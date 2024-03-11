cd "$(dirname "$0")"
echo -n "$(date -Iseconds) get valuetypes from processloader... "
curl -s https://processloader_host/processloader/get_valuetypes.php > valuetypes.vt

STATUS="$(cmp --silent  valuetypes.vt valuetypes-last.vt ; echo $?)"  # "$?" gives exit status for each comparison

if [ $STATUS -ne 0 ]; then  # if status isn't equal to 0, then execute code
    echo CHANGED valuetypes upload to virtuoso
    #isql-vt localhost dba dba valuetypes.vt
    docker-compose exec virtuoso-kb isql-v localhost dba dba /root/servicemap/valuetypes.vt 
    cp valuetypes.vt valuetypes-last.vt
else
    echo SAME valuetypes
fi

