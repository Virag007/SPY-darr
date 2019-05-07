<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/login.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
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
<div class="login">
	<div class="left">
		<br><font color="#00b3b3" size="6" face="Calibri"><b>Sign In to SPY-darr</b></font><br><br>
		<img src="icons/fb.svg" class="cp"><img src="icons/g+.svg" class="cp"><img src="icons/in.svg" class="cp">
		<br><br><font color="#85adad" face="Calibri">or use your email account :</font><br>
		<br><input type="text" name="username" placeholder="Email"><br><br>
		<input type="password" name="passwd" placeholder="Password"><br><br>
		<a href="forgotpass.jsp"><font face="Calibri" color="#334d4d">Forgot Your Password?</font><br></a><hr style="width: 145px;color: #f0f5f5"><br>
		<a href="user.jsp"><input type="submit" value="SIGN IN" class="but"></a>
	</div>
	<div class="right">
		<span style="top: 35%;position: relative;color: white;font-family: Montserrat;font-size: 14px"><font size="5" face="Calibri"><b>Hello, Friends!</b></font><br><br>
		Enter your personal details<br>
		and start journey with us<br><br>
		<input type="submit" value="SIGN UP" onclick="openlog()" class="but"></span>
	</div>
	<div class="log" id="mylog">
		<div class="log-container">
			<div  class="left1">
				<span style="top: 35%;position: relative;color: white;font-family: Montserrat;font-size: 14px"><font size="5" face="Calibri"><b>Welcome Back!</b></font><br><br>
				To keep connected with us <br>
				please login with your personal details<br><br>
				<input type="submit" value="SIGN IN" onclick="closelog()" class="but"></span>
			</div>
			<div class="right1">
				<br><font color="#00b3b3" size="6" face="Calibri"><b>Create Account</b></font><br><br>
				<img src="icons/fb.svg" class="cp"><img src="icons/g+.svg" class="cp"><img src="icons/in.svg" class="cp"><br>
				<br><font face="Calibri" color="#85adad">or use your email for registration</font><br><br>
				<input type="text" name="Name" placeholder="Name"><br><br>
				<input type="email" name="Email" placeholder="Email"><br><br>
				<input type="password" name="passwd" placeholder="Password"><br><br>
				<input type="submit" value="SIGN UP" class="but">
			</div>
		</div>
	</div>
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
	<a href="home.jsp"><button class="bt"><font color="white">&#11096;</font></button></a>
	<button class="bt"><font color="white">&#9634;</font></button>
</div>
<script type="text/javascript">
function openDrop() {
  document.getElementById("myDrop").style.height = "30%";
}
function closeDrop() {
  document.getElementById("myDrop").style.height = "0%";
}
function openlog() {
  document.getElementById("mylog").style.width = "100%";
}
function closelog() {
  document.getElementById("mylog").style.width = "0%";
}
</script>
</body>
</html>