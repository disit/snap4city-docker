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

//EXTERNAL SERVICES//
$host= 'dashboarddb';
$username= 'user';
$password= 'passwordx';
$dbname= 'profiledb';
$snap4city_API='localhost';

//PHOTO SERVICE//
$host_photo= 'dashboarddb';
$username_photo= 'user';
$password_photo= 'passwordx';
$dbname_photo= 'ServiceMap';
$photo_api='http://dashboard/ServiceMap/api/v1/photo/thumbs/';
$default_longitude = 11.252;
$default_latitude = 43.773;
$default_serviceUri = 'http://dashboard/ServiceMap/api/v1/?serviceUri=';
$photo_service_api = 'http://dashboard/ServiceMap/ajax/';

//KPI EDITOR//
$host_kpi= 'dashboarddb';
$username_kpi= 'user';
$password_kpi= 'passwordx';
$dbname_kpi= 'processloader_db';

//heatmap server
$host_heatmap ='dashboarddb';
$username_heatmap = 'user';
$password_heatmap = 'passwordx';
$dbname_heatmap = 'heatmap';

//userlimits
$host_limits = 'dashboarddb';
$username_limits = 'user';
$password_limits = 'passwordx';
$dbname_limits = 'profiledb';

$org_limits_api = 'http://dashboard/dashboardSmartCity/api/organizations.php';
$types_limits = ["IOTID","DashboardID","ModelID","AppID","DAAppID","DeviceGroupID","HeatmapID","PortiaID","SynopticID","SynopticTmplID","BrokerID"];

// posgres od server
$host_od = 'od-postgis';
$username_od = 'postgres';
$password_od = 'pgpassword';
$dbname_od = 'postgres';

$host_dashboardbuilder = $host;
$username_dashboardbuilder = $username;
$password_dashboardbuilder = $password;
$db_dashboardbuilder = 'Dashboard';

?>
