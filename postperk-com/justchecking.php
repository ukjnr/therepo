<?php
	// config and whatnot
    $config = dirname(__FILE__) . '/hybrid/hybridauth/config.php';
    require_once( "/hybrid/hybridauth/Hybrid/Auth.php" );

     ob_start();

	$user_data = NULL;

	// try to get the user profile from an authenticated provider
	try{
		$hybridauth = new Hybrid_Auth( $config );

		// selected provider name 
		$provider = @ trim( strip_tags( $_GET["provider"] ) );

		// check if the user is currently connected to the selected provider
		if( !  $hybridauth->isConnectedWith( $provider ) ){ 
			// redirect him back to login page
			header( "Location: login.php?error=Your are not connected to $provider or your session has expired" );
		}

		// call back the requested provider adapter instance (no need to use authenticate() as we already did on login page)
		$adapter = $hybridauth->getAdapter( $provider );

		// grab the user profile
		$user_data = $adapter->getUserProfile();
    }
	catch( Exception $e ){  
		// In case we have errors 6 or 7, then we have to use Hybrid_Provider_Adapter::logout() to 
		// let hybridauth forget all about the user so we can try to authenticate again.

		// Display the received error,
		// to know more please refer to Exceptions handling section on the userguide
		switch( $e->getCode() ){ 
			case 0 : echo "Unspecified error."; break;
			case 1 : echo "Hybriauth configuration error."; break;
			case 2 : echo "Provider not properly configured."; break;
			case 3 : echo "Unknown or disabled provider."; break;
			case 4 : echo "Missing provider application credentials."; break;
			case 5 : echo "Authentication failed. " 
					  . "The user has canceled the authentication or the provider refused the connection."; 
			case 6 : echo "User profile request failed. Most likely the user is not connected "
					  . "to the provider and he should to authenticate again."; 
				   $adapter->logout(); 
				   break;
			case 7 : echo "User not connected to the provider."; 
				   $adapter->logout(); 
				   break;
		} 

		echo "<br /><br /><b>Original error message:</b> " . $e->getMessage();

		echo "<hr /><h3>Trace</h3> <pre>" . $e->getTraceAsString() . "</pre>";  
	}
?>

    
  
   
    
   
    
 <?php   
    
    
    
  include_once("php_includes/db_conx.php");  

    
$social_email = $user_data->email;
echo "the socailemail api logged in is:  " . $social_email;
echo "<hr />";


$mematch ="";
$result = mysqli_query($db_conx,"SELECT * FROM users
WHERE email='$social_email'");

while($row = mysqli_fetch_array($result)) {
  $mematch = $row['email'];
    $e = $row['email'];
    $p = $row['password'];
    
   
    
    
      }  
       if($mematch == $social_email){
   echo "yeap it is equal";
          
         
           
        
// GET USER IP ADDRESS
  
    if ($e == "" || $p == "") {
        echo "login_failed";
        exit();
    } else {
// END FORM DATA ERROR HANDLING
        $sql = "SELECT id, username, password FROM users WHERE email='$e' AND activated='1' LIMIT 1";
        $query = mysqli_query($db_conx, $sql);
        $row = mysqli_fetch_row($query);
        $db_id = $row[0];
        $db_username = $row[1];
        $db_pass_str = $row[2];
        if ($p != $db_pass_str) {
            echo "login_failed";
            exit();
        } else {
// CREATE THEIR SESSIONS AND COOKIES
            $_SESSION['userid'] = $db_id;
            $_SESSION['username'] = $db_username;
            $_SESSION['password'] = $db_pass_str;
            setcookie("id", $db_id, strtotime( '+30 days' ), "/", "", "", TRUE);
            setcookie("user", $db_username, strtotime( '+30 days' ), "/", "", "", TRUE);
            setcookie("pass", $db_pass_str, strtotime( '+30 days' ), "/", "", "", TRUE);
// UPDATE THEIR "IP" AND "LASTLOGIN" FIELDS
            $sql = "UPDATE users SET ip='$ip', lastlogin=now() WHERE username='$db_username' LIMIT 1";
            $query = mysqli_query($db_conx, $sql);
            echo $db_username;
             echo '<a href="login.php">go to profile</a>';
            // redirect him back to login page
			   header("location: /../user.php?u=".$_SESSION["username"] . "&provider=$provider" );
    exit();
          
        }
    }       
           
           
           
           
           
           
  
   } else {
   
          echo "no it is not equal";
  $gena = $user_data->firstName . $user_data->firstName . rand();   
           
           
  $u = preg_replace('#[^a-z0-9]#i', '', $gena);
    $e = mysqli_real_escape_string($db_conx, $social_email);
    $p = rand();
    $g = preg_replace('#[^a-z]#', '', 'm');
    $c = preg_replace('#[^a-z ]#i', '', 'US');
// GET USER IP ADDRESS
 $ip = preg_replace('#[^0-9.]#', '', getenv('REMOTE_ADDR'));
// DUPLICATE DATA CHECKS FOR USERNAME AND EMAIL
    $sql = "SELECT id FROM users WHERE username='$u' LIMIT 1";
    $query = mysqli_query($db_conx, $sql);
    $u_check = mysqli_num_rows($query);
// -------------------------------------------
    $sql = "SELECT id FROM users WHERE email='$e' LIMIT 1";
    $query = mysqli_query($db_conx, $sql);
    $e_check = mysqli_num_rows($query);
// FORM DATA ERROR HANDLING
  
// END FORM DATA ERROR HANDLING
        // Begin Insertion of data into the database
// Hash the password and apply your own mysterious unique salt
        $p_hash = md5($p);
// Add user info into the database table for the main site table
        $sql = "INSERT INTO users (username, email, password, gender, country, ip, signup, lastlogin, notescheck, avatar, identifier, profileURL, WebsiteURL, photoURL, displayName, description, firstName, lastName, language, age, birthDay, birthMonth, birthYear, emailVerified, phone, address, region, city, zip)
               VALUES('$u','$e','$p_hash','$g','$c','$ip',now(),now(),now(),'avatardefault.jpg','$user_data->identifier','$user_data->profileURL','$user_data->webSiteURL','$user_data->photoURL','$user_data->displayName','$user_data->description','$user_data->firstName','$user_data->lastName','$user_data->language','$user_data->age','$user_data->birthDay','$user_data->birthMonth','$user_data->birthYear','$user_data->emailVerified','$user_data->phone','$user_data->address','$user_data->region','$user_data->city','$user_data->zip')";
        $query = mysqli_query($db_conx, $sql);
        $uid = mysqli_insert_id($db_conx);
// Establish their row in the useroptions table
        $sql = "INSERT INTO useroptions (id, username, background) VALUES ('$uid','$u','original')";
        $query = mysqli_query($db_conx, $sql);
           
// Create directory(folder) to hold each user's files(pics, MP3s, etc.)
       if (!file_exists("user/$u")) {
            mkdir("user/$u", 0755);
            //copy avatar
            $avatar = "images/avatardefault.jpg";
            $avatar2 = "user/$u/avatardefault.jpg";
            if (!copy($avatar, $avatar2)) {
                echo "failed to create avatar.";
            }
        }
// Email the user their activation link
        $to = "$e";
        $from = "auto_responder@postperk.com";
        $subject = 'postperk new account details';
        $message = '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>postperk.com Message</title></head><body style="margin:0px; font-family:Tahoma, Geneva, sans-serif;"><div style="padding:10px; background:#333; font-size:24px; color:#CCC;"><a href="http://postperk.com"><img src="http://www.postperk.com/images/logo.png" width="36" height="30" alt="postperk.com" style="border:none; float:left;"></a>postperk.com Account Activation</div><div style="padding:24px; font-size:17px;">Hello '.$u.',<br /><br />your login details for postperk r as follows:<br /><br /><a href="http://www.postperk.com/login.php>login</a> <br /><br />your email:<b>'.$e.'<br />your email:<b>'.$p.'</b></div></body></html>';
        $headers = "From: $from\n";
        $headers .= "MIME-Version: 1.0\n";
        $headers .= "Content-type: text/html; charset=iso-8859-1\n";
        mail($to, $subject, $message, $headers);
        echo "signup_success<hr /><br />";
           echo "<h1>your pasword is " . $p . "<hr /> your email is </h1>" . $e . "<hr /><br /><br />" ;
            echo '<a href="login.php">go to profile</a>';
		
        
    }         
      

    $p = md5($p);
// GET USER IP ADDRESS
  
    if ($e == "" || $p == "") {
        echo "login_failed";
        exit();
    } else {
// END FORM DATA ERROR HANDLING
        $sql = "SELECT id, username, password FROM users WHERE email='$e' AND activated='1' LIMIT 1";
        $query = mysqli_query($db_conx, $sql);
        $row = mysqli_fetch_row($query);
        $db_id = $row[0];
        $db_username = $row[1];
        $db_pass_str = $row[2];
        if ($p != $db_pass_str) {
            echo "login_failed";
            exit();
        } else {
// CREATE THEIR SESSIONS AND COOKIES
            $_SESSION['userid'] = $db_id;
            $_SESSION['username'] = $db_username;
            $_SESSION['password'] = $db_pass_str;
            setcookie("id", $db_id, strtotime( '+30 days' ), "/", "", "", TRUE);
            setcookie("user", $db_username, strtotime( '+30 days' ), "/", "", "", TRUE);
            setcookie("pass", $db_pass_str, strtotime( '+30 days' ), "/", "", "", TRUE);
// UPDATE THEIR "IP" AND "LASTLOGIN" FIELDS
            $sql = "UPDATE users SET ip='$ip', lastlogin=now() WHERE username='$db_username' LIMIT 1";
            $query = mysqli_query($db_conx, $sql);
            echo $db_username;
        
            exit();
        }
            
			// redirect him back to login page
			header( "Location: index.php" );
		
    }
    exit();


 echo "<br>";

  echo "<br>";

?>

