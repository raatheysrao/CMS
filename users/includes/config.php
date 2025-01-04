<?php
$mysql_hostname = "35.202.195.238";
$mysql_user = "cms_ums";
$mysql_password = "cms@1234";
$mysql_database = "cms";
$bd = mysqli_connect($mysql_hostname, $mysql_user, $mysql_password, $mysql_database) or die("Could not connect database");
?>