export MYSQL_PWD=rootpwd
for db in Dashboard ServiceMap SuperServiceMap iotdb profiledb processloader_db
do
echo restore $db...
  mysql -h 192.168.1.119 -u root $db < bkup/$db.sql
done

