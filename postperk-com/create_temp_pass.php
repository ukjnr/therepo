<?php
include_once("php_includes/db_conx.php");
$tpass = "ALTER TABLE useroptions ADD temp_pass VARCHAR(255) NOT NULL after answer";
mysqli_query($db_conx, $tpass);
?>