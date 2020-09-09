echo get valutypes from processloader
curl -sS http://localhost/processloader/get_valuetypes.php > valuetypes.vt
echo update valuetypes on virtuoso-kb
docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/valuetypes.vt


