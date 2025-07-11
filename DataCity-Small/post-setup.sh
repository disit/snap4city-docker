set -e #stop on error

cd servicemap-conf
./update-ontology.sh localhost
docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/servicemap.vt
docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/valuetypes.vt
docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/servicemap-dbpedia.vt

echo create opensearch iot index
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/snap4-iot-organization' -d @mapping_Sensors-ETL-IOT-ES7-v4.json
echo

echo create opensearch iot-device-state index
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/iot-device-state' -d @mapping_DeviceState-ES7-v1.json
echo

echo create opensearch ot-device-state index
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/ot-device-state' -d @mapping_DeviceState-ES7-v1.json
echo

echo create opensearch kpi index
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/snap4-kpi' -d @mapping_Sensors-ETL-IOT-ES7-v4.json
echo

ANON=TVBXNm93Q0loMWxDK1FpcGJ4ekVKdz09

echo setup role areamanager
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/_plugins/_security/api/roles/kibanauser_areamanager' -d @- << EOF
{
  "cluster_permissions": [
    "*"
  ],
  "index_permissions": [{
    "index_patterns": [
      "snap4-*"
    ],
    "dls": "{\"bool\":{\"should\":[{\"match\":{\"username\": \"\${attr.jwt.uid}\"}},{\"match\": {\"user_delegations\": \"\${attr.jwt.uid}\"}},{\"bool\":{\"must\":[{\"match\":{\"user_delegations\": \"$ANON\"}},{\"match\": {\"organization\": \"\${attr.jwt.ou}\"}}]}},{\"match\": {\"organization_delegations\": \"\${attr.jwt.ou}\"}}],\"minimum_should_match\": 1}}",
    "allowed_actions": [
      "read"
    ]
  }]
}
EOF
echo

echo setup rolemapping areamanager
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/_plugins/_security/api/rolesmapping/kibanauser_areamanager' -d @- << EOF
{
  "backend_roles" : [ "AreaManager" ]
}
EOF
echo

echo setup role manager
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/_plugins/_security/api/roles/kibanauser_manager' -d @- << EOF
{
  "cluster_permissions": [
    "*"
  ],
  "index_permissions": [{
    "index_patterns": [
      "snap4-*"
    ],
    "dls": "{\"bool\":{\"should\":[{\"match\":{\"username\": \"\${attr.jwt.uid}\"}},{\"match\": {\"user_delegations\": \"\${attr.jwt.uid}\"}},{\"bool\":{\"must\":[{\"match\":{\"user_delegations\": \"$ANON\"}},{\"match\": {\"organization\": \"\${attr.jwt.ou}\"}}]}},{\"match\": {\"organization_delegations\": \"\${attr.jwt.ou}\"}}],\"minimum_should_match\": 1}}",
    "allowed_actions": [
      "read"
    ]
  }]
}
EOF
echo

echo setup rolemapping manager
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/_plugins/_security/api/rolesmapping/kibanauser_manager' -d @- << EOF
{
  "backend_roles" : [ "Manager" ]
}
EOF
echo

echo setup role tooladmin
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/_plugins/_security/api/roles/kibanauser_tooladmin' -d @- << EOF
{
  "cluster_permissions": [
    "*"
  ],
  "index_permissions": [{
    "index_patterns": [
      "snap4-*"
    ],
    "dls": "{\"bool\":{\"should\":[{\"match\":{\"organization\":\"\${attr.jwt.ou}\"}},{\"match\":{\"user_delegations\":\"\${attr.jwt.uid}\"}},{\"match\":{\"user_delegations\":\"$ANON\"}},{\"match\":{\"organization_delegations\":\"\${attr.jwt.ou}\"}}],\"minimum_should_match\":1}}",
    "allowed_actions": [
      "read"
    ]
  }]
}
EOF
echo

echo setup rolemapping tooladmin
curl --insecure -u admin:admin -H 'Content-Type: application/json' -X PUT 'https://localhost:9200/_plugins/_security/api/rolesmapping/kibanauser_tooladmin' -d @- << EOF
{
  "backend_roles" : [ "ToolAdmin" ]
}
EOF
echo

echo add dashboard
curl -u admin:admin -XPOST "http://localhost:5601/api/saved_objects/_import?overwrite=true" -H "osd-xsrf: true" -H "securitytenant: global" --form file=@osd-dashboard.ndjson
echo

docker-compose exec dashboard-builder bash -c "cd /var/www/html/dashboardSmartCity/sql; php updateDb.php"
docker-compose exec dashboard-builder bash -c "cd /var/www/html/iot-directory/sql; php updateDb.php"
docker-compose exec dashboard-cron bash -c "cd /var/www/html/dashboardSmartCity/opensearch; php IngestData.php"

echo add geoserver workspace Snap4City
curl -u admin:snap4geo -XPOST -H "Content-type: text/xml" -d "<workspace><name>Snap4City</name></workspace>"  http://localhost/geoserver/rest/workspaces
echo add geoserver workspace traffic
curl -u admin:snap4geo -XPOST -H "Content-type: text/xml" -d "<workspace><name>traffic</name></workspace>"  http://localhost/geoserver/rest/workspaces
echo add geoserver road traffic style
curl -u admin:snap4geo -XPOST -H "Content-type: application/vnd.ogc.sld+xml" -d @servicemap-trafficflowmanager/road_traffic_style.sld  http://localhost/geoserver/rest/styles?name=road_traffic_style

echo restart some services
docker-compose restart wsserver personaldata orionbrokerfilter opensearch-dashboards iot-fiware-harvester proxy varnish


