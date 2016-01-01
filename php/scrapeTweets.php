
<?php
ini_set('display_errors', 1);
require_once('./TwitterAPIExchange.php');

$settings = array(
    'oauth_access_token' => "3165989763-wOQEd1Cmkny3HJQ1oIeOwkWC0zmEsjtJafnXnkX",
    'oauth_access_token_secret' => "UIQtZggHmNRxbTZpmybN8EBmIf6v2SFVc7Ler6ZJoFW0L",
    'consumer_key' => "qdqmGRHBFfdGqLzxhU1eNpKGk",
    'consumer_secret' => "WcQsHjbnNpvFB774Btg24f10ZCIMgj547kwIQYUeU2Y7qCnQsR"
);

$url = 'https://api.twitter.com/1.1/search/tweets.json';
$queryCoords = $_GET["intLat"] . ',' . $_GET["intLon"] . ',.5mi';
$getfield = '?geocode='.$queryCoords;
$requestMethod = 'GET';
$twitter = new TwitterAPIExchange($settings);
$arr= $twitter->setGetfield($getfield)
             ->buildOauth($url, $requestMethod)
             ->performRequest();
#// echo print_r($arr);
$results = json_decode($arr, true);
#// echo print_r($results['statuses'][1]["text"]);
#// echo print_r($results['statuses'][1]["geo"]["coordinates"]);

include 'mysettings.php';

$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
} 

// echo print_r($arr);

echo '
<html>
<head>
<h1>The following tweets have been scraped into the database</h1>
 <input type="button" value="Show me" onclick="window.location.href=\'homepage.php?intLat=' . $_GET["intLat"] .  '&intLon=' . $_GET["intLon"] . '\'"/>  

<style>

body {
	background-color: gray;
}
#div0 {
	background-color: #FF9933;
	
}
#div1 {
	background-color: #00CCFF;
	
}
#div2 {
	background-color: #00CC99;
}
#div3 {
	background-color: #FF9933;
	
}
#div4 {
	background-color: #00CCFF;
	
}
#div5 {
	background-color: #00CC99;
}
#div6 {
	background-color: #FF9933;
	
}
#div7 {
	background-color: #00CCFF;
	
}
#div8 {
	background-color: #00CC99;
}
#div9 {
	background-color: #FF9933;
	
}
#div10 {
	background-color: #00CCFF;
	
}
#div11 {
	background-color: #00CC99;
	
}
#div12 {
	background-color: #FF9933;
	
}
#div13 {
	background-color: #00CCFF;
}
#div14 {
	background-color: #00CC99;
	
}

</style></head><body>';

require_once __DIR__ . '/phpInsight-master/autoload.php';
$sentiment = new \PHPInsight\Sentiment();

for($x=0; $x<sizeof($results['statuses']); $x++){
	// echo print_r($arr);
	echo'<div id="div' . $x . '"">';

	echo print_r($results['statuses'][$x]["text"]);
	echo '<pre>Tweet #: ';
	echo print_r($results['statuses'][$x]["id"]);
	echo '<pre>UserID: ';
	echo print_r($results['statuses'][$x]["user"]["id"]);
	echo '<pre>Created at:';
	echo print_r($results['statuses'][$x]["created_at"]);
	echo '<pre>retweets: ';
	echo print_r($results['statuses'][$x]["retweet_count"]);
	echo '<pre>favorites: ';
	echo print_r($results['statuses'][$x]["favorite_count"]);
	echo '<pre>lat: ';
	echo print_r($results['statuses'][$x]["geo"]["coordinates"][0]);
	echo '<pre>lon: ';
	echo print_r($results['statuses'][$x]["geo"]["coordinates"][1]);
	echo '<pre>image: ';
	echo print_r($results['statuses'][$x]["user"]["entities"]["url"]["urls"][0]["expanded_url"]);
	echo '<br>';
	$string = $results['statuses'][$x]["text"];
	// calculations:
	$scores = $sentiment->score($string);
	$class = $sentiment->categorise($string);

	// output:
	echo "String: $string\n";
	echo "Dominant: $class, scores: ";
	print_r($scores);
	echo "\n";

	echo '<br>';
	echo '<br>';
	

	$values = array(
			"tweetid" => $results['statuses'][$x]["id"],
			"message" => $results['statuses'][$x]["text"],
			"userid" => $results['statuses'][$x]["user"]["id"],
			"favorites" => $results['statuses'][$x]["favorite_count"],
			"retweets" => $results['statuses'][$x]["retweet_count"],
			"datePosted" => NULL,
			"attitude" => $class, "lat" => $results['statuses'][$x]["geo"]["coordinates"][0],
			"lon" => $results['statuses'][$x]["geo"]["coordinates"][1]
		);

	$sql = 'INSERT INTO Tweets (tweetid, message, userid,favorites, retweets, datePosted, attitude, lat, lon) VALUES (' . $results['statuses'][$x]["id"] . ',\'' . $results['statuses'][$x]["text"] . '\',' . $results['statuses'][$x]["user"]["id"] . ',' . $results['statuses'][$x]["favorite_count"] . ',' . $results['statuses'][$x]["retweet_count"] . ',' . 'NULL' . ',\'' . $class . '\',' . $results['statuses'][$x]["geo"]["coordinates"][0] . ','
 . $results['statuses'][$x]["geo"]["coordinates"][1] . ');';
	$result = $conn->query($sql);

	echo $result;
	echo'</div>';
}
echo '</body></html>';

$conn->close();

?>
