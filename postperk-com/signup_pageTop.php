<?php


// It is important for any file that includes this file, to have
// check_login_status.php included at its very top.


//edit
$new_friends = "";
//edit
$envelope = '<img src="images/note_dead.jpg" width="22" height="12" alt="Notes" title="This envelope is for logged in members">';
$loginLink = '<a href="login.php">Log In</a> &nbsp; | &nbsp; <a href="signup.php">Sign Up</a>';
if ($user_ok == true) {
    $sql = "SELECT notescheck FROM users WHERE username='$log_username' LIMIT 1";
    $query = mysqli_query($db_conx, $sql);
    $row = mysqli_fetch_row($query);
    $notescheck = $row[0];
    $sql = "SELECT id FROM notifications WHERE username='$log_username' AND date_time > '$notescheck' LIMIT 1";
    $query = mysqli_query($db_conx, $sql);
    $numrows = mysqli_num_rows($query);
    if ($numrows == 0) {
        $envelope = '<a href="notifications.php" title="Your notifications and friend requests"><img src="images/note_still.jpg" width="22" height="12" alt="Notes"></a>';
    } else {
        $envelope = '<a href="notifications.php" title="You have new notifications"><img src="images/note_flash.gif" width="22" height="12" alt="Notes"></a>';
    }
    $loginLink = '<a href="user.php?u='.$log_username.'">'.$log_username.'</a> &nbsp; | &nbsp; <a href="logout.php">Log Out</a>';
     //myedit friendcount
 $sql ="SELECT COUNT(id) FROM friends WHERE user2='$log_username' AND accepted='0'";
    $query = mysqli_query($db_conx, $sql);
    $row = mysqli_fetch_row($query);
    $requests_count = $row[0];
    if ($requests_count != 0){
       $new_friends = '<a href="notifications.php" title="Friends Requests"><img src="images/newfriend.png"    width="18" height="12" alt="Friend">('.$requests_count.')</a>&nbsp;&nbsp;&nbsp;';
    }
}
?>
<div id="pageTop">
  <div id="pageTopWrap">
    <div id="pageTopLogo">
      <a href="http://postperk.com">
        <img src="images/logo.png" alt="logo" title="Web Intersect 2.0">
      </a>
    </div>
    <div id="pageTopRest">
      <div id="menu1">
        <div>  <a href="feed.php">
           feed
          </a>&nbsp;<?php echo $new_friends; ?>&nbsp;<a href="ffriends.php">
         find friends
          </a>
          <?php echo $envelope; ?>  &nbsp; <?php echo $loginLink; ?>&nbsp;
        </div>
      </div>
      <div id="menu2">
        <div>
          <a href="http://postperk.com">
            <img src="images/home.png" alt="home" title="Home">
          </a>
            <?php if(isset($_SESSION['username'])) { ?>
          <a href="#"><img src="images/group3.png" alt="groups" border="0" title="Groups" onclick="return false" onmousedown="showGroups()"></a>
<?php } ?>
          <!--<a href="#">Menu_Item_1</a>
          <a href="#">Menu_Item_2</a> -->
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/main.js"></script>
<script src="js/ajax.js"></script>
<script type="text/javascript">
var isShowing = "no";
function showGroups() {
	if(isShowing == "no"){
		_('groupModule').innerHTML = '<div id="groupWrapper"><div id="groupList"><h2>My Groups</h2><hr /><?php echo $mgList; ?><h2>All Groups</h2><hr /><?php echo $agList; ?></div><div id="groupForm"><h2>Create New Group</h2><hr /><p>Group Name:<br /><input type="text" id="gname" onBlur="checkGname()" ><span id="gnamestatus"></span></p><p>How do people join your group?<br /><select name="invite" id="invite"><option value="null" selected>&nbsp;</option><option value="1">By requesting to join.</option><option value="2">By simply joining.</option></select></p><button id="newGroupBtn" onClick="createGroup()">Create Group</button><span id="status"></span></div></div><div class="clear"></div>';
		isShowing = "yes";
	} else {
		_('groupModule').innerHTML = '';
		isShowing = "no";
	}
}
function checkGname(){
	var u = _("gname").value;
	var rx = new RegExp;
	rx = /[^a-z 0-9_]/gi;
	u = u.replace(rx, "");
	var rxx = new RegExp;
	rxx = /[ ]/g;
	u = u.replace(rxx, "_");
	
	if(u != ""){
		_("gnamestatus").innerHTML = 'checking ...';
		var ajax = ajaxObj("POST", "php_parsers/group_parser.php");
        ajax.onreadystatechange = function() {
	        if(ajaxReturn(ajax) == true) {
	            _("gnamestatus").innerHTML = ajax.responseText;
	        }
        }
        ajax.send("gnamecheck="+u);
	}
}
function createGroup(){
	var name = _("gname").value;
	var inv = _("invite").value;
	if(name == "" || inv == "null"){
		alert("Fill all fields");
		return false;
	} else {
		status.innerHTML = 'please wait ...';
		var ajax = ajaxObj("POST", "php_parsers/group_parser.php");
		ajax.onreadystatechange = function() {
			if(ajaxReturn(ajax) == true) {
				var datArray = ajax.responseText.split("|");
				if(datArray[0] == "group_created"){
				var sid = datArray[1];
					window.location = "group.php?g="+sid;
				} else {
					alert(ajax.responseText);
				}
			}
		}
		ajax.send("action=new_group&name="+name+"&inv="+inv);
	}	
}
</script>
<div id="groupModule"></div>