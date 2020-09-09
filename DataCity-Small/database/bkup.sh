export MYSQL_PWD=rootpwd
for db in Dashboard ServiceMap SuperServiceMap iotdb profiledb processloader_db
do
echo backup $db...
  mysqldump -h 192.168.1.119 -u root $db > bkup/$db.sql
  #mysqldump -u root --password=rootpwd $db | gzip > bkup/$db.sql.gz
done

