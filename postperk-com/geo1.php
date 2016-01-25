<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
    <script>
var latlon = "noSet";
    function getLocation() {
    navigator.geolocation.getCurrentPosition(getPos,getError);
    }

    function getPos(position) {
     latlon=position.coords.latitude+","+position.coords.longitude;
     alert(latlon);
    }
    function getError(error) {
    var locError = error.code;
        var latlon = "notSet";
        alert(lalion);
        
    }
    var pp = getElementById('geo');
    pp.innerHTML= latlon;
        
</script>
    </head>
    <body>
find you location
<button onCLick="getLocation()">Locate Me</button>
       <?php 
$latlon = preg_replace('#[^a-z0-9 .,-]#i', '', $_POST['latlon']); 
        
        ?>
    </body></html>