export IOTDIR_SERVER_COUNTRY_NAME=IT
export IOTDIR_SERVER_STATE=Florence
export IOTDIR_SERVER_LOCALITY=Florence
export IOTDIR_SERVER_ORGANIZATION_NAME=Altair
export IOTDIR_SERVER_ORGANIZATION_UNIT=Altair
export IOTDIR_SERVER_COMMON_NAME=iotobsf-altair
export IOTDIR_SERVER_EMAIL_ADDRESS=your@server.email
export IOTDIR_SERVER_CRL_URI=URI:http://dashboard/example_ca.crl
export IOTDIR_SERVER_DNS_ALT=iotobsf-altair
export IOTDIR_SERVER_PASSWORD=pass:ag67sgdh7fh373gd6k9
export IOTDIR_SERVER_PK12_PASSWORD=pass:h8d83jfmf088dhdhf
export IOTDIR_CA_PASSWORD=pass:a56h78jhd7bd4j9hgvj

openssl req -config server.cnf -new -newkey rsa:4096 -keyout private/server-$IOTDIR_SERVER_COMMON_NAME-key.pem -out certreqs/server-$IOTDIR_SERVER_COMMON_NAME-csr.pem -passout $IOTDIR_SERVER_PASSWORD

openssl ca -batch -config server.cnf -days 825 -extensions v3_ca_has_san -out certsdb/server-$IOTDIR_SERVER_COMMON_NAME-crt.pem -keyfile private/ca-key.pem -passin $IOTDIR_CA_PASSWORD -cert ca-crt.pem -infiles certreqs/server-$IOTDIR_SERVER_COMMON_NAME-csr.pem

openssl pkcs12 -export -in certsdb/server-$IOTDIR_SERVER_COMMON_NAME-crt.pem -inkey private/server-$IOTDIR_SERVER_COMMON_NAME-key.pem -chain -CAfile ca-crt.pem -out server-$IOTDIR_SERVER_COMMON_NAME-crt.p12 -passin $IOTDIR_SERVER_PASSWORD -passout $IOTDIR_SERVER_PK12_PASSWORD 
