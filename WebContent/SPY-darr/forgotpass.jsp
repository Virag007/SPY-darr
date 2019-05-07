<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="css/forgotpass.css">
<title>Forgot Password</title>
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
<div id="navbar">
	<div id="logo"><a href="login.jsp">SIGN-IN</a></div>
</div>
<div class="clear"></div>
<div id="back">
	<center><font color="white" size="10" face="Calibri">Let’s find your account</font>
	<fieldset>
	<form method="post" id="login">
		<table>
			<tr><td>Email</td></tr><tr><td><input type="email" name="em" required placeholder="Type your Email"></td></tr>
			<tr><td>Security Code</td></tr><tr><td><input type="text" name="code" required placeholder="Security Code"></td></tr>
			<tr><td>New Password</td></tr><tr><td><input type="password" name="new" required placeholder="New Password" pattern=".{5,12}" minlength="6" required title="Password should be 5 to 12 characters"></td></tr>
			<tr><td>Confirm Password</td></tr><tr><td><input type="password" name="cnew" required placeholder="Confirm your Password"></td></tr>
			<tr><td align="center"><input type="submit" name="submit" value="Save" style="width: 100px;background-color: #37a69b;box-shadow: inset 0px 1px 0px #2ab7ec, 0px 2px 0px 0px #497a78, 0px 4px 2px #999;"></td></tr>
		</table>
	</form>
	</fieldset>
	</center>
</div>
<script>
function openDrop() {
  document.getElementById("myDrop").style.height = "30%";
}
function closeDrop() {
  document.getElementById("myDrop").style.height = "0%";
}
</script>
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
	<a href="home.jsp"><button class="bt"><font color="white">&#11096;</font></button></a>
	<button class="bt"><font color="white">&#9634;</font></button>
</div>
</body>
</html>