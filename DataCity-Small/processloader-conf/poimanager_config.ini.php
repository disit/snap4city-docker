<?php
/*
[database]
servername= "dashboarddb"
username= "user"
password = "passwordx"
dbname = "datatable"

[application]
target_dir="POIManager/files/"
language_file="languages.csv"

[poi]
poi_template_column="name,abbreviation,descriptionShort,descriptionLong,phone,fax,url,email,refPerson,secondPhone,secondFax,secondEmail,secondCivicNumber,secondStreetAddress,notes,timetable,photo,other1,other2,other3,postalcode,province,city,streetAddress,civicNumber,latitude,longitude"
poi_datatypes="string,string,string,string,string,string,URL,email,string,string,string,email,string,string,string,string,URL,string,string,string,string,string,string,string,string,float,float"
cell_special_characters="?,|"

[api]
ownershipApiUrl = "http://dashboard/ownership-api/v1/register/?"
valueTypeValueUnitApiUrl="http://dashboard/iot-directory/api/device.php/?"
valueTypeValueUnitApiUrlTest="http://dashboard/processloader/api/"
processLoaderURI= "http://dashboard/processloader/api/"
ownershipLimitApiUrl="http://dashboard/ownership-api/v1/limits?type=PoiTableID&accessToken="
ownershipListApiUrl="http://dashboard/ownership-api/v1/list/?type=PoiTableID&accessToken="
ownershipDeleteApiUrl="http://dashboard/ownership-api/v1/delete/?type=PoiTableID&"
processLoaderNatureURI="http://dashboard/processloader/api/dictionary/?type=subnature"
processLoaderValueUnitURI="http://dashboard/processloader/api/dictionary/?type=value_unit"
processLoaderContextBrokerURI="http://dashboard/iot-directory/api/contextbroker.php/?action=get_all_contextbroker&nodered"
valueTypeValueUnitAction="get_param_values"
valueTypeValueUnitNodered="1"
elementType = "PoiTableID"
elementUrl = ""
elementName = "PoiTableID"
base_suri="http://www.disit.org/km4city/resource/poi/"
uploaderUserUrl="http://dashboard/auth/realms/master/protocol/openid-connect/userinfo"
delegationUrl="http://dashboard/datamanager/api/v1/username/"
locationUrl="http://dashboard/ServiceMap/api/v1/location/?"

