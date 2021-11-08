cd servicemap-conf
source update-ontology.sh localhost
docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/servicemap.vt
docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/servicemap-dbpedia.vt

