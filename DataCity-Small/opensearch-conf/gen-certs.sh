#!/bin/sh
# Root CA
C=IT
ST=Toscana
L=Florence
O=SNAP4
OU=

echo generate CA cert
openssl genrsa -out root-ca-key.pem 2048
openssl req -new -x509 -sha256 -key root-ca-key.pem -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=ROOT" -out root-ca.pem -days 3650
# Admin cert
echo
echo generate admin cert
openssl genrsa -out admin-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in admin-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out admin-key.pem
openssl req -new -key admin-key.pem -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=ADMIN" -out admin.csr
openssl x509 -req -in admin.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out admin.pem -days 3650
# Node cert 1
echo
echo generate node cert
openssl genrsa -out node1-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in node1-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out node1-key.pem
openssl req -new -key node1-key.pem -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=opensearch-n1" -out node1.csr
openssl x509 -req -in node1.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out node1.pem -days 3650
# Client cert
echo
echo generate client cert
openssl genrsa -out client-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in client-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out client-key.pem
openssl req -new -key client-key.pem -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=CLIENT" -out client.csr
openssl x509 -req -in client.csr -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out client.pem -days 3650
chmod a+r *-key.pem

# Cleanup
rm admin-key-temp.pem
rm admin.csr
rm node1-key-temp.pem
rm node1.csr
rm client-key-temp.pem
rm client.csr

echo "generate truststore (need keytool)"
rm -f trust-store.p12
keytool -import -file root-ca.pem -alias snap4ca -storepass snap4ca -storetype pkcs12 -noprompt -keystore trust-store.p12
# p12 made with openssl does not work with java
#openssl pkcs12 -export -nokeys -in root-ca.pem -out root-ca.p12 -passout pass:snap4ca
#chmod a+r root-ca.p12
cp trust-store.p12 ../nifi/conf/trust-store.p12
cp trust-store.p12 ../datamanager-conf/trust-store.p12
cd ../servicemap-conf
cp cacerts.orig cacerts
keytool -importcert -keystore cacerts -file ../opensearch-conf/root-ca.pem -alias snap4ca -storepass changeit -noprompt
