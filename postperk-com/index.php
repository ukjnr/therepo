<?php
include_once("php_includes/check_login_status.php");

$sql1 = "SELECT username, avatar FROM users WHERE avatar is NOT NULL AND activated='1' ORDER BY RAND() LIMIT 32";
$query1 = mysqli_query($db_conx, $sql1);
$usernumrows = mysqli_num_rows($query1);
$userlist = "";
while ($row = mysqli_fetch_array($query1, MYSQLI_ASSOC)) {
    $u = $row["username"];
    $avatar = $row["avatar"];
    $profile_pic = 'user/'.$u.'/'.$avatar;
    $userlist .= '<a href="user.php?u='.$u.'" title="'.$u.'"><img src="'.$profile_pic.'" alt="'.$u.'" style="width:100px; height:100px; margin:10px;"></a>';
}
$sql3 = "SELECT COUNT(id) FROM users WHERE activated='1'";
$query3 = mysqli_query($db_conx, $sql3);
$row3 = mysqli_fetch_row($query3);
$usercount = $row3[0];
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Intersect Social Network Tutorials and Demo</title>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="style/style.css">
</head>
<body>
<?php include_once("template_pageTop.php"); ?>
<div id="pageMiddle">
<?php

$sql0 = "SELECT username FROM users WHERE activated='1'";
$query0 = mysqli_query($db_conx, $sql0);
$usernumrows0 = mysqli_num_rows($query0);
$userlist0 = "";
while ($row = mysqli_fetch_array($query0, MYSQLI_ASSOC)) {
    $u = $row["username"];
    $userlist0 .= '<a href="user.php?u='.$u.'">'.$u.'</a>&nbsp;| ';
}
?>
<h3>Temporary users testing the live tutorial system files (<?php echo $usernumrows0 ?>):</h3>
<?php echo $userlist0; ?>
<?php
$sql2 = "SELECT id FROM users";
$query2 = mysqli_query($db_conx, $sql2);
$num_rows2 = mysqli_num_rows($query2);
?>
<h3>Temporary users testing the live tutorial system files with picture (<?php echo $num_rows2 ?>):</h3>
<?php echo $userlist; ?>
</div>
<?php include_once("template_pageBottom.php"); ?>
</body>
</html>