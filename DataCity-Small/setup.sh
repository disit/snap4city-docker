if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

chmod -R a+w iotapp-nr1
chmod -R a+w iotapp-nr2
chmod a+w iot-directory-certificate
mkdir -p iot-directory-log
chmod a+w iot-directory-log
mkdir -p datamanager-conf
mkdir -p servicemap-conf/logs
mkdir -p servicemap-iot-conf/logs
mkdir -p servicemap-iot-conf/logs/insert
mkdir -p servicemap-iot-conf/logs/delete
mkdir -p servicemap-iot-conf/logs/move
mkdir -p servicemap-iot-conf/logs/list-static-attr
mkdir -p varnish/logs
mkdir -p nifi/logs
mkdir -p ownership-conf/logs
mkdir -p datamanager-logs

chmod a+w servicemap-conf/logs
chmod a+w servicemap-iot-conf/logs
chmod a+w servicemap-iot-conf/logs/insert
chmod a+w servicemap-iot-conf/logs/delete
chmod a+w servicemap-iot-conf/logs/move
chmod a+w servicemap-iot-conf/logs/list-static-attr
chmod a+w nifi/conf
chmod a+w nifi/conf/flow.xml.gz
chmod a+w nifi/extensions
chmod a+w nifi/logs
chmod a+w ownership-conf/logs
chmod a+w datamanager-logs

mkdir -p certbot/logs
mkdir -p certbot/conf
mkdir -p certbot/work
mkdir -p certbot/www
chown -R 1000:1000 certbot

sysctl -w vm.max_map_count=262144

cd opensearch-conf
./gen-certs.sh

