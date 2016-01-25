<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
    <script>
var latlon = "noSet";
    function getLoctaion() {
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
</script>
    </head>
    <body><?php $latlon = preg_replace('#[^a-z0-9 .,-]#i', '', $_POST['latlon']);
echo $latlon;
        
        
        ?>
find you location
<button onCLick="getLocation()">Locate Me</button>
    </body></html>