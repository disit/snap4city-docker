#
echo "ATTENTION!!"
echo "this script is going to update the dashboard-builder database structure, we suggest to perform a BACKUP"
echo
while true; do
    read -p "DO YOU WANT TO CONTINUE? write YES to update the db: " yn
    case $yn in
        "YES") docker-compose exec dashboard-builder bash -c "cd /var/www/html/dashboardSmartCity/sql/; php updateDb.php"; break;;
        * ) echo "nothing done"; exit;;
    esac
done

