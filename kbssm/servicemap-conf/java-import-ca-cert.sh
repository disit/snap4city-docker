#!/usr/bin/env bash

# Exit on error
set -e

# Ensure script is running as root
if [ "$EUID" -ne 0 ]
  then echo "WARN: Please run as root (sudo)"
  exit 1
fi

# Check required commands
command -v openssl >/dev/null 2>&1 || { echo "Required command 'openssl' not installed. Aborting." >&2; exit 1; }
command -v keytool >/dev/null 2>&1 || { echo "Required command 'keytool' not installed. Aborting." >&2; exit 1; }

# Get command line args
host=$1; port=${2:-443}; deleteCmd=${3:-${2}}

# Check host argument
if [ ! ${host} ]; then
cat << EOF
Please enter required parameter(s)

usage:  ./java-cert-importer.sh <host> [ <port> | default=443 ] [ -d | --delete ]

EOF
exit 1
fi;

if [ "$JAVA_HOME" ]; then
    javahome=${JAVA_HOME}
elif [[ "$OSTYPE" == "linux-gnu" ]]; then # Linux
    javahome=$(readlink -f $(which java) | sed "s:bin/java::")
elif [[ "$OSTYPE" == "darwin"* ]]; then # Mac OS X
    javahome="$(/usr/libexec/java_home)/jre"
fi

if [ ! "$javahome" ]; then
    echo "WARN: Java home cannot be found."
    exit 1
elif [ ! -d "$javahome" ]; then
    echo "WARN: Detected Java home does not exists: $javahome"
    exit 1
fi

echo "Detected Java Home: $javahome"

# Set cacerts file path
cacertspath=${javahome}/jre/lib/security/cacerts
cacertsbackup="${cacertspath}.$$.backup"

if ( [ "$deleteCmd" == "-d" ] || [ "$deleteCmd" == "--delete" ] ); then
    keytool -delete -alias ${host} -keystore ${cacertspath} -storepass changeit
    echo "Certificate is deleted for ${host}"
    exit 0
fi

# Get host info from user
#read -p "Enter server host (E.g. example.com) : " host
#read -p "Enter server port (Default 443) : " port

# create temp file
tmpfile="/tmp/${host}.$$.crt"

# Create java cacerts backup file
cp ${cacertspath} ${cacertsbackup}

echo "Java CaCerts Backup: ${cacertsbackup}"

# Get certificate from speficied host
openssl x509 -in <(openssl s_client -connect ${host}:${port} -prexit 2>/dev/null) -out ${tmpfile}

# Import certificate into java cacerts file
keytool -importcert -file ${tmpfile} -alias ${host} -keystore ${cacertspath} -storepass changeit

# Remove temp certificate file
rm ${tmpfile}

# Check certificate alias name (same with host) that imported successfully
result=$(keytool -list -v -keystore ${cacertspath} -storepass changeit | grep "Alias name: ${host}")

# Show results to user
if [ "$result" ]; then
    echo "Success: Certificate is imported to java cacerts for ${host}";
else
    echo "Error: Something went wrong";
fi;

