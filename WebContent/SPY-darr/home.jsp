<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Android Phone</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/lockscreen.css">
</head>
<body>
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
<script>
function openDrop() {
  document.getElementById("myDrop").style.height = "30%";
}
function closeDrop() {
  document.getElementById("myDrop").style.height = "0%";
}
</script>
<div class="header">
	<img class="bar" src="icons/battery.svg">
	<img class="bar" src="icons/signal.svg">
	<img class="bar" src="icons/signal.svg">
	<img class="bar" src="icons/alarm.svg">
	<img class="bar" src="icons/bluetooth.svg">
	<img class="bar" src="icons/wifi.svg">
	<img class="bar" src="icons/gps.svg">
	<img src="icons/darrow.svg" onclick="openDrop()" id="drop">
</div>
<div style="text-align: center;"><input type="text" id="place" placeholder="Search..."></div>
<div id="icon">
	<a href="http://www.facebook.com/"><img class="app" src="icons/facebook.png"></a>
	<a href="http://www.twitter.com"><img class="app" src="icons/twitter.png"></a>
	<a href="http://www.youtube.com"><img class="app" src="icons/youtube.png"></a>
	<a href="http://www.linkedin.com"><img class="app" src="icons/linkedin.png"></a>
	<a href="http://www.github.com"><img class="app" src="icons/github.png"></a>
	<a href="http://www.googleplay.com"><img class="app" src="icons/play.png"></a><p></p>
	<a href="http://www.googlemaps.com"><img class="app" src="icons/maps.png"></a>
	<a href="http://www.gmail.com"><img class="app" src="icons/Gmail.png"></a>
	<a href="music.jsp"><img class="app" src="icons/Playmusic.png"></a>
	<a href="https://web.whatsapp.com/"><img class="app" src="icons/whatsapp.png"></a>
	<a href="calculator.jsp"><img class="app" src="icons/Calculator.png"></a>
	<a href="spydarr.jsp"><img class="app" src="icons/spydarr.png"></a>
</div>
<div id="tab">
	<a href="#"><img class="drawer" src="icons/Phone.png"></a>
	<a href="#"><img class="drawer" src="icons/Contacts.png"></a>
	<a href="https://www.google.com/intl/en_in/earth/"><img class="drawer" src="icons/Earth.png"></a>
	<a href="#"><img class="drawer" src="icons/Messenger.png"></a>
	<a href="#"><img class="drawer" src="icons/camera.png"></a>
</div>
<div class="footer">
	<button class="bt"><font color="white">&#128710;</font></button>
	<button class="bt"><font color="white">&#11096;</font></button>
	<button class="bt"><font color="white">&#9634;</font></button>
</div>
</body>
</html>