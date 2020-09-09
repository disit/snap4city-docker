<?php
/* Snap4city Ownership API
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

// db access

$db_host = "localhost";
$database = "profiledb";
$db_user = "user";
$db_pwd = "password";

// SSO configuration (needed only for debugging)
$sso_base_url = 'http://keycloak:8088';
$sso_client_id = 'php-ownership-api';
$sso_client_secret = '7bcdc43f-210d-45cc-9b5f-f1025bba525f';
$sso_login_redirect = 'http://dashboard/ownership-api/login/';
// SSO mandatory configuration
$sso_userinfo_endpoint = 'http://keycloak:8088/auth/realms/master/protocol/openid-connect/userinfo';

$log_path = '/tmp';

// can be used to bypass authentication, use ONLY if needed
$trustedIpAddrs = array();

//keycloak admin user used for user search

$keycloack_base_url = 'http://keycloak:8088/auth';
$keycloack_admin = 'admin';
$keycloack_pwd = 'admin';

//ldap access, used for organization and role search

$ldapServer = 'localhost';
$ldapPort = '389';
$ldapBaseDN = 'dc=ldap,dc=organization,dc=com';
$ldapAdminDN = 'cn=admin,dc=ldap,dc=organization,dc=com';
$ldapAdminPwd = 'secret';

//set the keys with the same values used in dashboard-builder
$encryptionMethod = "AES-256-CBC";
$encryptionInitKey = "EncryptionIniKey";
$encryptionIvKey = "IVKeyivKey123456";

$datamanager_api_url = 'http://dashboard/datamanager/api';

// uncomment if using wstunnel server for edge iotapps
#$wstunnel_db_host = 'localhost';
#$wstunnel_database = 'wstunnel';
#$wstunnel_db_user = 'user';
#$wstunnel_db_passw = 'password';

#$iot_app_edge_url = 'http://localhost/edge/';

$conf=array(
'db_host'=>'localhost',
'database'=>'profiledb',
'db_user'=>'user',
'db_pwd'=>'password',
'sso_client_id'=>'php-ownership-api',
'sso_client_secret'=>'ab7abd2c-f86e-485e-a859-a159ef546883',
'sso_userinfo_endpoint'=>'http://localhost:8088/auth/realms/master/protocol/openid-connect/userinfo',
'ldapServer'=>'localhost',
'ldapPort'=>'389',
'ldapBaseDB'=>'dc=test,dc=example,dc=org'
);

foreach($conf as $k=>$v) {
  $vv=getenv("OWN_".strtoupper($k));
  if($vv!==FALSE)
    $v=$vv;
  $$k=$v;
}

