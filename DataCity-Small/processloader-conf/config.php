<?php
/* Resource Manager - Process Loader
   Copyright (C) 2018 DISIT Lab http://www.disit.org - University of Florence

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as
   published by the Free Software Foundation, either version 3 of the
   License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */


session_start();
$username = "user";
$password = "passwordx";
//$password = "";
$host="dashboarddb";
$dbname = "processloader_db";
$host_valueunit = $host;
$username_valueunit = $username;
$password_valueunit = $password;
$dbname_valueunit = $dbname;

//SERVER LDAP
$ldapServer = 'ldap-server';
//nome repository files
$repository_files = 'jobs/';
$repository_destination = '/srv/share/jobs/';
$server_share = '/srv/share/jobs/';
$ip_SCE = 'localhost';
$SCE_dbname = "quartz";

$oicd_address='http://dashboard';
$ssoEndpoint = 'http://dashboard';
$ssoClientId = 'php-dashboard-builder';
$ssoClientSecret = 'fd4b64fc-eabd-41e8-aef4-34c9f6864b2c';
$personalDataApiBaseUrl = 'http://localhost/ownership-api';
$delegationDataApiUrl = 'http://personaldata:8080/datamanager/api';
$ldapParamters = 'dc=ldap,dc=organization,dc=com';
$access_token_userinfo = 'http://dashboard/auth/realms/master/protocol/openid-connect/userinfo';
$appUrl= 'http://dashboard/processloader';

//JAVA PARAMETERS
$java_path ='/usr/lib/jvm/java-8-openjdk-amd64/bin/java';

//ETL PARAMETERS
$DDI_HOME = '-DDI_HOME=/home/ubuntu/programs/data-integration/';
$classpath= '-classpath';
$pentaho = 'org.pentaho.di.kitchen.Kitchen';
$xms = '-Xmx512m';
$data_integration_path = ':/home/ubuntu/programs/data-integration/lib/*';
$level = 'Debug';
//Access_token
$access_token_userinfo = "http://www.snap4city.org/auth/realms/master/protocol/openid-connect/userinfo";
//R PARAMETERS
$r_path = '/usr/bin/Rscript';

$connessione_al_server= mysqli_connect($host, $username, $password) or die("Errore di Connessione!!");
if(!$connessione_al_server){
die ('Non riesco a connettermi: errore '.mysqli_error()); // questo apparirà solo se ci sarà un errore
}
 
$db_selected=mysqli_select_db($connessione_al_server,$dbname); // dove io ho scritto "prova" andrà inserito il nome del db
if(!$db_selected){
die ('Errore nella selezione del database: errore '.mysqli_error()); // se la connessione non andrà a buon fine apparirà questo messaggio
}

?>
