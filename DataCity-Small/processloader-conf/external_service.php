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
$host= 'loclahost';
$username= 'user';
$password= 'password';
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
$host_heatmap ='localhost';
$username_heatmap = 'user';
$password_heatmap = 'password';
$dbname_heatmap = 'heatmap';

?>
