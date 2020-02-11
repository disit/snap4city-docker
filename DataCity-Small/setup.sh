chmod -R a+w iotapp-nr1
chmod -R a+w iotapp-nr2
chmod a+w iot-directory-certificate
mkdir -p iot-directory-log
chmod a+w iot-directory-log
mkdir servicemap-conf/logs
mkdir servicemap-iot-conf/logs
mkdir servicemap-iot-conf/logs/insert
mkdir servicemap-iot-conf/logs/delete
chmod a+w servicemap-conf/logs
chmod a+w servicemap-iot-conf/logs
chmod a+w servicemap-iot-conf/logs/insert
chmod a+w servicemap-iot-conf/logs/delete
chmod a+w nifi/conf
chmod a+w nifi/conf/flow.xml.gz
chmod a+w nifi/extensions
sysctl -w vm.max_map_count=262144
