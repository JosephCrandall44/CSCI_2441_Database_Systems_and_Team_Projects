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
map_canvas{
    align: center;
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
#map_canvas {
  width: 800px;
  margin-left: auto;
  margin-right: auto;
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
$sql = "SELECT tweetid,message,favorites,retweets,lat,lon,attitude FROM Tweets ORDER BY tweetid desc ";
$result = $conn->query($sql);

if(!is_object($result)){
  echo "SOMETHING WENT WRONG";
}
$tempNum = 0;
if(($result->num_rows > 0)){
    while($row = $result->fetch_assoc()){
        echo $row[2];
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
        <p1>This page does not work with IE <= 9.0 </p1>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        // <script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=visualization&sensor=false"></script>
        <script type="text/javascript">
        // check DOM Ready
        $(document).ready(function() {
            // execute
            (function() {

                var styles = [
                  {
                    stylers: [
                      { hue: "#003366" },
                      { saturation: -10 }
                    ]
                  },{
                    featureType: "road",
                    elementType: "geometry",
                    stylers: [
                      { lightness: 100 },
                      { visibility: "simplified" }
                    ]
                  },{
                    featureType: "road",
                    elementType: "labels",
                    stylers: [
                      { visibility: "off" }
                    ]
                  }
                ];

                var styledMap = new google.maps.StyledMapType(styles,
                {name: "mapstyle"});
                // map options
                var options = {
                   zoom: 14,
                   center: new google.maps.LatLng(38.9007, -77.0508),
                    mapTypeIds: [google.maps.MapTypeId.ROADMAP,'mapstyle'],
                    mapTypeControl: false
                };
                // map.setOptions({styles: styles});
                // init map
                var map = new google.maps.Map(document.getElementById('map_canvas'), options);
                map.mapTypes.set('map_style', styledMap);
                map.setMapTypeId('map_style');

                var xdata = <?php echo json_encode($xdata, JSON_FORCE_OBJECT);?>;

                var ydata = <?php echo json_encode($ydata, JSON_FORCE_OBJECT);?>;

                var heatmapData = [];

                document.getElementById("myb").innerHTML = ydata[2][1];

                for(i=0; i<Object.keys(ydata).length; i++){

                    // weight by retweets + favorites
                    heatmapData[i] = {"location": new google.maps.LatLng(ydata[i][0], ydata[i][1]), "weight": 100, "sentiment": ydata[i][5]};
                    document.getElementById("myb").innerHTML = heatmapData[i]["location"] + "   " + heatmapData[i]["weight"]+ "   " + heatmapData[i]["sentiment"];
                }

                var heatmap = new google.maps.visualization.HeatmapLayer({
                  data: heatmapData
                });
                heatmap.setMap(map);
                heatmap.set('radius', 20)


            })();
        });
        </script>
        <input type="button" value="Load New Tweets" onclick="window.location.href='scrapeTweets.php?lat=38.9007&lon=-77.0508'" />
        <input type="button" value="Targeted Scrape" onclick="window.location.href='targetScrape.php'" />
        <input type="button" value="Standard Map" onclick="window.location.href='homepage.php'" />
        <h3 id = "myh3">Where we've scraped</h3>
    </head>
    <body>



        <div id="map_canvas" style="width: 1200px; height:800px;"></div>


        <!-- these images will be custom buttons to perform SQL queries and display results -->
<!--    <a href="topPositiveYaks.php"><img src="TopPositiveYaksButton.png" alt="Positive Yaks sorted by Score" height="200" width="200"></a>
        <img src="TopNegativeYaksButton.png" alt="Negative Yaks sorted by Score" height="200" width="200">
        <img src="BottomPositiveYaksButton.png" alt="Positive Yaks sorted by Score" height="200" width="200">
        <img src="BottomNegativeYaksButton.png" alt="Negative Yaks sorted by Score" height="200" width="200"> -->
        <p id="myb">test</p>
    </body>
</html>

