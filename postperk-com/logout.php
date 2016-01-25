<?php
include_once("php_includes/check_login_status.php");
// Set Session data to an empty array

$_SESSION = array();
// Expire their cookie files
if (isset($_COOKIE["id"]) && isset($_COOKIE["user"]) && isset($_COOKIE["pass"])) {
    setcookie("id", '', strtotime( '-5 days' ), '/');
    setcookie("user", '', strtotime( '-5 days' ), '/');
    setcookie("pass", '', strtotime( '-5 days' ), '/');
}
// Destroy the session variables
session_destroy();
// Double check to see if their sessions exists
if (isset($_SESSION['username'])) {
    header("location: message.php?msg=Error:_Logout_Failed");
} else {
    try{
		$hybridauth = new Hybrid_Auth( $config );

		// logout the user from $provider
		$hybridauth->logoutAllProviders(); 

		// return to login page
		$hybridauth->redirect( "/../login.php" );
    }
	catch( Exception $e ){
		echo "<br /><br /><b>Oh well, we got an error :</b> " . $e->getMessage();

		echo "<hr /><h3>Trace</h3> <pre>" . $e->getTraceAsString() . "</pre>"; 
	}
    header("location: http://postperk.com");
    exit();
}

?>