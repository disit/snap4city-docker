docker-compose exec dashboard-builder bash -c "cd /var/www/html/dashboardSmartCity/sql; php updateDb.php"
docker-compose exec dashboard-builder bash -c "cd /var/www/html/iot-directory/sql; php updateDb.php"

