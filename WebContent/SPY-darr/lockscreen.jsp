<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LockScreen</title>
<link rel="stylesheet" href="css/lockscreen.css">
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
<div id="clock">
	<p style="font-size: 70px;font-family: Agency FB;color: white;letter-spacing: 0.1em;margin: 0">12:00 AM</p>
	<p style="font-size: 25px;font-family: Calibri;color: white;margin: 0">Mon,22 April</p>
</div>
<div id="myNav" class="overlay">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
   	<p><font color="white" size="30px" face="Calibri">Type your pin</font></p><br>
   	<form method="post" action="lockscreen.jsp" id="form_id">
    <input type="password" id="pass" name="passwd" maxlength="4" required="Required" placeholder="&#9899;&#9899;&#9899;&#9899;">
	</form>  
  </div>
</div>
<span onclick="openNav()" id="action"><p style="transform: rotate(90deg)">&#10096;</p></span>
<%
if(request.getParameter("passwd")==null){}
else {
String password=request.getParameter("passwd");       
if(password.equals("9471"))
	response.sendRedirect("home.jsp");
else
	response.sendRedirect("lockscreen.jsp");
}
%>
<script>
function openNav() {
  document.getElementById("myNav").style.height = "50%";
}
function closeNav() {
  document.getElementById("myNav").style.height = "0%";
}
function openDrop() {
  document.getElementById("myDrop").style.height = "30%";
}
function closeDrop() {
  document.getElementById("myDrop").style.height = "0%";
}
</script>
<img src="icons/r0.svg" style="height:4.5%; width: 4.5%;bottom: 10px;position: fixed;padding-left: 0px;filter: invert(100%);opacity: 0.8">
<img src="icons/r1.svg" style="height: 4.5%;width: 4.5%;bottom: 10px;position: fixed;margin-left: 95.5%;filter: invert(100%);opacity: 0.8">
</body>
</html>