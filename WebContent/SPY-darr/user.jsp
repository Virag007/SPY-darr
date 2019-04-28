<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"> 
<link rel="stylesheet" href="css/user.css">
<title>User</title>
</head>
<body>
<div class="header">
	<img class="bar" src="icons/battery.svg">
	<img class="bar" src="icons/signal.svg">
	<img class="bar" src="icons/signal.svg">
	<img class="bar" src="icons/alarm.svg">
	<img class="bar" src="icons/bluetooth.svg">
	<img class="bar" src="icons/wifi.svg">
	<img class="bar" src="icons/gps.svg">
	<img class="bar" src="icons/dot.png">
	<img src="icons/darrow.svg" onclick="openDrop()" id="drop">
</div>
<div id="myside" class="side">
  <div class="side-content">
  	<p class="alpha">START</p>
  	<p class="alpha" onclick="openperson()">Virag</p>
  	<p class="alpha" onclick="closehome()">Home</p>
  	<p class="alpha" onmouseover="colourChange()" onclick="openeye()">Messages</p>
  	<p class="beta" onclick="opennotification()">Notifications</p>
  	<p class="beta" onclick="opengraph()">Report</p>
  	<p class="beta" onmouseover="colourChange1()" onclick="openbitcoin()">Wallet</p>
  	<p class="beta" onclick="openuser_set()">Account Settings</p>
  	<p class="beta" onclick="openbug()">Bug Report</p>
  	<p class="beta" onclick="alert(parag)">Logout</p>
  </div>
  <a href="javascript:void(0)" class="side_close" onclick="closeside()">&#10096;</a>
</div>
<div id="myperson" class="person">
  <div class="person-content">
  	<img src="icons/maps.png">
  </div>
</div>
<div id="myeye" class="eye">
  <div class="eye-content">
  	<div class="box">
  		<fieldset><legend>Report Information</legend>
  			Description: <textarea>Enter your text</textarea>
  		</fieldset>
  	</div>
  	<div class="box1">
  		<fieldset><legend>Set Location</legend>
  			<div class="mapouter"><div class="gmap_canvas"><iframe width="300" height="400" id="gmap_canvas" src="https://maps.google.com/maps?q=University%20Institute%20of%20technology%2C%20burdwan&t=&z=11&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>Google Maps Generator by <a href="https://www.embedgooglemap.net">embedgooglemap.net</a></div><style>.mapouter{position:relative;text-align:right;height:400px;width:300px;}.gmap_canvas {overflow:hidden;background:none!important;height:400px;width:300px;}</style></div>
  		</fieldset>
  	</div>
  	<div class="box2">
  		<fieldset><legend>Support with Evidence</legend></fieldset>
  	</div>
  </div>
</div>
<div id="mynotification" class="notification">
  <div class="notification-content">
  </div>
</div>
<div id="mygraph" class="graph">
  <div class="graph-content">
  </div>
</div>
<div id="mybitcoin" class="bitcoin">
  <div class="bitcoin-content">
  </div>
</div>
<div id="myuser_set" class="user_set">
  <div class="user_set-content">
  </div>
</div>
<div id="mybug" class="bug">
  <div class="bug-content">
  </div>
</div>

<script>
function openDrop() {
  document.getElementById("myDrop").style.height = "30%";
}
function closeDrop() {
  document.getElementById("myDrop").style.height = "0%";
}
function openside() {
  document.getElementById("myside").style.width = "18%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function closeside() {
  document.getElementById("myside").style.width = "0%";
  document.getElementById("change4").style.borderBottomRightRadius="50%";
  document.getElementById("change7").style.borderBottomRightRadius="50%";
}
function openperson() {
  document.getElementById("myperson").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change2").style.borderBottom="1px solid blue";
  document.getElementById("change2").style.borderTop="1px solid blue";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function closehome() {
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change3").style.borderBottom="1px solid blue";
  document.getElementById("change3").style.borderTop="1px solid blue";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function openeye() {
  document.getElementById("myeye").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change4").style.borderBottom="1px solid blue";
  document.getElementById("change4").style.borderTop="1px solid blue";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function opennotification() {
  document.getElementById("mynotification").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change8").style.borderBottom="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid yellow";
  document.getElementById("change9").style.borderBottom="0";
}
function opengraph() {
  document.getElementById("mygraph").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change5").style.borderBottom="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="1px solid blue";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function openbitcoin() {
  document.getElementById("mybitcoin").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change6").style.borderBottom="1px solid yellow";
  document.getElementById("change6").style.borderTop="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function openuser_set() {
  document.getElementById("myuser_set").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change7").style.borderBottom="1px solid yellow";
  document.getElementById("change7").style.borderTop="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function openbug() {
  document.getElementById("mybug").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybitcoin").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change9").style.borderBottom="1px solid yellow";
  document.getElementById("change9").style.borderTop="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change6").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change6").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
}
function colourChange() {
  document.getElementById("change4").style.borderBottomRightRadius="0";
}
function colourChange1() {
  document.getElementById("change7").style.borderBottomRightRadius="0";
}
</script>
<div id="tab">
	<img class="drawer" style="filter: invert(100%);background-color: #bfbfbf" src="icons/menu.svg" onclick="openside()">
	<img class="drawer" id="change2" style="filter: invert(100%);background-color: #bfbfbf" src="icons/person.svg" onclick="openperson()">
	<img class="drawer" id="change3" style="filter: invert(100%);background-color: #bfbfbf" src="icons/home.svg" onclick="closehome()">
	<img class="drawer" id="change4" style="filter: invert(100%);background-color: #bfbfbf;border-bottom-right-radius: 50%" src="icons/eye.svg" onclick="openeye()">
	<img class="drawer" id="change5" src="icons/graph.png" onclick="opengraph()">
	<img class="drawer" id="change6" src="icons/bitcoin.png" onclick="openbitcoin()">
	<img class="drawer" id="change7" style="border-bottom: 1px solid #a6a6a6; border-bottom-right-radius: 50%;" src="icons/user_set.png" onclick="openuser_set()">
	<img class="drawer" id="change8" src="icons/notification.svg" onclick="opennotification()">
	<img class="drawer" id="change9" src="icons/bug.svg" onclick="openbug()">
	<img class="drawer" src="icons/logout.svg">
</div>
<div id="myDrop" class="drop">
  <a href="javascript:void(0)" class="close" onclick="closeDrop()">&#10096;</a>
  <div class="drop-content">
  	<img class="dropdown" src="icons/fire.svg">
    <img class="dropdown" src="icons/data.svg">
    <img class="dropdown" src="icons/wifi.svg">
    <img class="dropdown" src="icons/flash.svg">
    <img class="dropdown" src="icons/volume.svg">
    <img class="dropdown" src="icons/airplane.svg">
    <img class="dropdown" src="icons/brightness.svg">
    <img class="dropdown" src="icons/bluetooth.svg">
    <img class="dropdown" src="icons/lock.svg">
    <img class="dropdown" src="icons/alarm.svg">
    <img class="dropdown" src="icons/gps.svg">
    <img class="dropdown" src="icons/read.svg">
    <img class="dropdown" src="icons/hotspot.svg">
    <img class="dropdown" src="icons/touch.svg">
    <img class="dropdown" src="icons/cast.svg">
    <img class="dropdown" src="icons/account.svg">
    <img class="dropdown" src="icons/power.svg">
  </div>
 </div>
<div class="footer">
	<button class="bt"><font color="white">&#128710;</font></button>
	<a href="index.html"><button class="bt"><font color="white">&#11096;</font></button></a>
	<button class="bt"><font color="white">&#9634;</font></button>
</div>
</body>
</html>