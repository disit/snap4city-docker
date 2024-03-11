
cd "$(dirname "$0")"
echo -n "$(date -Iseconds) get valuetypes from processloader... "
curl -sS http://localhost/processloader/get_valuetypes.php > valuetypes.vt

STATUS="$(cmp --silent  valuetypes.vt valuetypes-last.vt ; echo $?)"  # "$?" gives exit status for each comparison

if [ "$STATUS" -ne "0" ]; then
    echo CHANGED valuetypes upload to virtuoso
    docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/valuetypes.vt
    cp valuetypes.vt valuetypes-last.vt
else
    echo SAME valuetypes
fi

