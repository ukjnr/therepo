<?php

/*

$db_conx = mysqli_connect("mysql.hostinger.co.uk","u445972014_perk","test1234","u445972014_perk");
// Evaluate the connection
if (mysqli_connect_errno()) {
    echo mysqli_connect_error();
    exit();
} else {
// echo "Successful database connection, happy coding!!!";
}

*/

?>


<?php
$db_conx = mysqli_connect("localhost","root","","postperk");
// Evaluate the connection
if (mysqli_connect_errno()) {
    echo mysqli_connect_error();
    exit();
} else {
// echo "Successful database connection, happy coding!!!";
}
?>