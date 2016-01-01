<?php
// homepage.php
    echo "<style>
h1{
    font-family: Helvetica;
    font-size: 70px;
    text-align: center;
    color: green;
}

body{
    background-color: #99CCFF;
}
#map_canvas {
  width: 800px;
  margin-left: auto;
  margin-right: auto;
}
p1{
    font-family: Arial;
    font-size: 16px;
    color: red;
}
#buttonz {
    width: 300px;
    margin: 0 auto;
}
</style>


<head>";


include 'mysettings.php';


$xdata = array();

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT message,score,lat,lon FROM Yaks LIMIT 0,100";
$result = $conn->query($sql);

if(!is_object($result)){
  echo "SOMETHING WENT WRONG";
}

// class feature {
//     public $type = "Feature";
//     public $properties  = "";
//     public $geometry = "";
// }

// class properties {
//     public $color = "";
// }

// class coords {
//     $ar = array();
// }

// class geometry {
//     public $type = "Polygon";
//     public $coordinates = "";
// }

$tempNum = 0;
if(($result->num_rows > 0)){
    while($row = $result->fetch_assoc()){
        $xdata[$tempNum][0] = $row["lat"];
        $xdata[$tempNum][1] = $row["lon"];
        $xdata[$tempNum][2] = $row["message"];
        $xdata[$tempNum][3] = $row["score"];
        // $xdata[$tempNum][4] = $row["sentiment"];
        
        // #echo $xdata[$tempNum][1] . ", " . $xdata[$tempNum][2] . ", " . $xdata[$tempNum][3] . ", " . $xdata[$tempNum][0];
        $tempNum = $tempNum + 1;    
    }
  json_encode($xdata);
}

// tweets
$ydata = array();
$sql = "SELECT tweetid,message,favorites,retweets,lat,lon,attitude FROM Tweets ORDER BY tweetid desc";
$result = $conn->query($sql);

if(!is_object($result)){
  echo "SOMETHING WENT WRONG";
}


$tempNum = 0;
if(($result->num_rows > 0)){
    while($row = $result->fetch_assoc()){
        $ydata[$tempNum][0] = $row["lat"];
        $ydata[$tempNum][1] = $row["lon"];
        $ydata[$tempNum][2] = $row["message"];
        $ydata[$tempNum][3] = $row["favorites"];
        $ydata[$tempNum][4] = $row["retweets"];
        $ydata[$tempNum][5] = $row["attitude"];
        
        // # echo $ydata[$tempNum][0] . ", " . $ydata[$tempNum][1] . ", " . $ydata[$tempNum][2] . ", " . $ydata[$tempNum][3] . ", " . $xdata[ytempNum][0];
        $tempNum = $tempNum + 1;    
    }
  json_encode($ydata);
}


$conn->close();
?>


<!DOCTYPE html>
<html>
<script>
function changeMap(){
    // switch map from individual yaks view to heatmap view
}
</script>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Yuk Or Yay</title>
        <h1 id="title">Yuk Or Yay</h1>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>
        <script type="text/javascript">
        // check DOM Ready
        $(document).ready(function() {
            // execute
            (function() {
                    var lat = <?php
                    if(isset($_GET["intLat"])){
                        echo $_GET["intLat"];
                    }else{
                        echo "38.9007";
                    }

                ?>;

                var lon = <?php
                    if(isset($_GET["intLon"])){
                        echo $_GET["intLon"];
                    }else{
                        echo "-77.0508";
                    }

                ?>;
                // map options
                var options = {
                   zoom: 14,
                   center: new google.maps.LatLng(lat, lon),
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    mapTypeControl: false
                };

                // init map
                var map = new google.maps.Map(document.getElementById('map_canvas'), options);
                map.data.loadGeoJson('https://api.myjson.com/bins/1crrv');
                var featureStyle = {
                    fillColor: 'white',
                    strokeWeight: 1
                  }
                map.data.setStyle(featureStyle);

                var image = {
                    url: "target.png",
                    size: new google.maps.Size(250,250),
                    origin: new google.maps.Point(0,0),
                    anchor: new google.maps.Point(125,125)
                };

                  target = new google.maps.Marker({
                    position: map.getCenter(),
                    icon: image,
                    draggable: true,
                    map: map
                  });

                var xdata = <?php echo json_encode($xdata, JSON_FORCE_OBJECT);?>;

                var ydata = <?php echo json_encode($ydata, JSON_FORCE_OBJECT);?>;

                // set multiple marker
                for (var i = 0; i < Object.keys(xdata).length; i++) {

                    //adjust icon size according to yak score

                    // init markers
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(xdata[i][0],xdata[i][1]),
                        map: map,
                        title: 'yak #' + i,
                        icon: 'yakIcon.png',
                        animation:google.maps.Animation.DROP
                    });
                    // process multiple info windows
                    (function(marker, i) {
                        // add click event
                        google.maps.event.addListener(marker, 'click', function() {
                            infowindow = new google.maps.InfoWindow({
                                content: "<p>Lat: "+xdata[i][0]+"</p><p>Long: "+xdata[i][1]+"</p><p>Message: "+xdata[i][2]+"</p><p>Score: "+xdata[i][3]+"</p>",
                                maxWidth: 200
                            });
                            infowindow.open(map, marker);
                        });
                    })(marker, i);
                }
                for (var i = 0; i < Object.keys(ydata).length; i++) {

                    //adjust icon size according to yak score

                    // init markers
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(ydata[i][0],ydata[i][1]),
                        map: map,
                        title: 'tweet #' + i,
                        icon: 'twitter.png',
                        animation:google.maps.Animation.DROP
                    });
                    // process multiple info windows
                    (function(marker, i) {
                        // add click event
                        google.maps.event.addListener(marker, 'click', function() {
                            infowindow = new google.maps.InfoWindow({
                                content: "<p>Lat: "+ydata[i][0]+"</p><p>Long: "+ydata[i][1]+"</p><p>Message: "+ydata[i][2]+"</p><p>Favorites: "+ydata[i][3]+"</p><p>Retweets: "+ydata[i][4]+"</p><p>Sentiment: "+ydata[i][5],
                                maxWidth: 200
                            });
                            infowindow.open(map, marker);
                        });
                    })(marker, i);
                }
            })();
        });

        
        function targetScrape(){
            var lat = target.getPosition().lat();
            var lng = target.getPosition().lng();

            // document.getElementById("test").innerHTML = lat;
            window.location.href='scrapeTweets?intLat='+lat+'&intLon='+lng;

        }
        </script>
         <div id="buttonz">
        <input type="button" value="Scrape Tweets Here" onclick="targetScrape()" />
  <!--       <input type="button" value="Targeted Scrape" onclick="window.location.href='targetScrape.php'" />
        <input type="button" value="HeatMap" onclick="window.location.href='sentimentMap.php'" /> -->
        </div>
    </head>
    <body>



        <div id="map_canvas" style="width: 1200px; height:800px;"></div>
        <p style="width:800px; margin:50 auto; color: red;">This page does not work with IE < 9.0 <br></p>

        <!-- these images will be custom buttons to perform SQL queries and display results -->
<!--         <a href="topPositiveYaks.php"><img src="TopPositiveYaksButton.png" alt="Positive Yaks sorted by Score" height="200" width="200"></a>
        <img src="TopNegativeYaksButton.png" alt="Negative Yaks sorted by Score" height="200" width="200">
        <img src="BottomPositiveYaksButton.png" alt="Positive Yaks sorted by Score" height="200" width="200">
        <img src="BottomNegativeYaksButton.png" alt="Negative Yaks sorted by Score" height="200" width="200"> -->
    </body>
</html>

