<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.connect" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"> 
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery-3.2.1.js"></script>
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
  	<p class="alpha" onclick="openperson()"><%= (String)session.getAttribute("uname") %></p>
  	<p class="alpha" onclick="closehome()">Home</p>
  	<p class="alpha" onmouseover="colourChange()" onclick="openeye()">DBA</p>
  	<p class="beta" onclick="opengraph()">Report</p>
  	<p class="beta" onmouseover="colourChange1()" onclick="openuser_set()">Account Settings</p>
  	<p class="beta" onclick="opennotification()">Notifications</p>
  	<p class="beta" onclick="popup()">Logout</p>
  </div>
  <a href="javascript:void(0)" class="side_close" onclick="closeside()">&#10096;</a>
</div>
<div id="myperson" class="person">
  <div class="person-content">
  <%
	String username=(String)session.getAttribute("uname");
	Connection con=connect.dbcon();
	Statement st=null;
	ResultSet rs=null;
	String sql="SELECT * FROM admin";
	st=con.createStatement();
	rs=st.executeQuery(sql);
	String uname="";
	String fname="";
	String lname="";
	String email="";
	String phone="";
	String loc="";
	String pin="";
	while(rs.next())
	{
		if(rs.getString(2).equals(username))
		{
			uname=rs.getString(2);
			fname=rs.getString(3);
			lname=rs.getString(4);
			email=rs.getString(5);
			phone=rs.getString(7);
			loc=rs.getString(8);
			pin=rs.getString(9);
		}
		else
			continue;
	}
	%>
  	<div style="height: 195px; width: 100%; background-image:linear-gradient(rgba(255,255,255,0.6), rgba(255,255,255,0.6)), url(images/profile_back.jpg);background-size: contain">
	  	<form method="post" enctype="multipart/form-data">
	  		<input type="file" onchange="readURL(this);" name="image" hidden id="filetoupload">
			<img src="icons/github.png" height="130px" style="margin-left: -5%;margin-top: 120px;border-radius: 100px" width="130px" id="blah" /><label for="filetoupload" class="logo"><img src="icons/edit.png" style="cursor: pointer;margin-top: 105px" height="20px" width="18px"/></label><br><br>
			<label style="margin-left: -5%;font-family: Montserrat"><font color="#53ff1a">&#11044;</font> <%=fname %> (@<%=username %>)</label><br><br>
		</form>
	</div>
	<div style="font-family: Calibri;font-size: 20px; margin-top: 150px;text-align: left;margin-left: 30%;width: 40%">
		FirstName: <span class="col" style="text-transform: uppercase;"><%=fname %></span> <span style="margin-left: 40px">LastName:</span> <span class="col" style="text-transform: uppercase;"><%=lname %></span><br>
		Email: <span class="col"><%=email %></span><br>
		Phone: <span class="col"><%=phone %></span><br>
		Address: <span class="col" style="text-transform: uppercase;"><%=loc %></span><br>
		Pincode: <span class="col"><%=pin %></span><br>
	</div>
	<div style="font-family: Montserrat;top: 115%;position: absolute;margin-left: 37%;font-size: 12px">&copy; Copyright to SPY-DARR &trade; Pvt. Ltd. v1.0</div>
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
  	<div style="height: 90px;width: 230px;background-color: #00cc44;border-radius:60px;margin-top: 3%;margin-left: 20%;position: absolute;color: white;font-family:Calibri;font-weight:bold;font-size:40px; display: flex;align-items: center;justify-content: center;">423.5 &#8377;</div>
  	<span style="margin-top: 11%;margin-left: 24%;position: absolute;font-family: Montserrat">Total Earnings</span>
  	<div style="height: 90px;width: 230px;background-color: orange;border-radius:60px;margin-top: 3%;margin-left: 40%;position: absolute;color: white;font-family:Calibri;font-weight:bold;font-size:40px; display: flex;align-items: center;justify-content: center;">8</div>
  	<span style="margin-top: 11%;margin-left: 44.5%;position: absolute;font-family: Montserrat">Total Reports</span>
  	<div style="height: 90px;width: 230px;background-color: #ff6699;border-radius:60px;margin-top: 3%;margin-left: 60%;position: absolute;color: white;font-family:Calibri;font-weight:bold;font-size:40px; display: flex;align-items: center;justify-content: center;">5 | 3</div>
  	<span style="margin-top: 11%;margin-left: 63%;position: absolute;font-family: Montserrat">Accepted | Rejected</span>
  </div>
</div>
<div id="myuser_set" class="user_set">
  <div class="user_set-content">
  	<div>Personal Information</div>
  	<div>Login Information</div>
  	<div>Wallet Information</div>
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
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
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
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change2").style.borderBottom="1px solid blue";
  document.getElementById("change2").style.borderTop="1px solid blue";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
}
function closehome() {
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change3").style.borderBottom="1px solid blue";
  document.getElementById("change3").style.borderTop="1px solid blue";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
}
function openeye() {
  document.getElementById("myeye").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change4").style.borderBottom="1px solid blue";
  document.getElementById("change4").style.borderTop="1px solid blue";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
}
function opennotification() {
  document.getElementById("mynotification").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change8").style.borderBottom="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid yellow";
}
function opengraph() {
  document.getElementById("mygraph").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change5").style.borderBottom="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="1px solid blue";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
}
function openuser_set() {
  document.getElementById("myuser_set").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("myeye").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("change7").style.borderBottom="1px solid yellow";
  document.getElementById("change7").style.borderTop="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change3").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change3").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change8").style.borderBottom="0";
}
function colourChange() {
  document.getElementById("change4").style.borderBottomRightRadius="0";
}
function colourChange1() {
  document.getElementById("change7").style.borderBottomRightRadius="0";
}
function popup() {
  document.getElementById("pop").style.height="16%";
  document.getElementById("pop").style.display="block";
}
function popdown() {
  document.getElementById("pop").style.height="0";
  document.getElementById("pop").style.display="none";
}
function openqr() {
  document.getElementById("qr").style.height="60%";
  document.getElementById("qr").style.display="block";
}
function qrdown() {
  document.getElementById("qr").style.height="0";
  document.getElementById("qr").style.display="none";
}
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#blah')
			.attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
			}
	}
</script>
<div id="tab">
	<img class="drawer" style="filter: invert(100%);background-color: #bfbfbf" src="icons/menu.svg" onclick="openside()">
	<img class="drawer" id="change2" style="filter: invert(100%);background-color: #bfbfbf" src="icons/person.svg" onclick="openperson()">
	<img class="drawer" id="change3" style="filter: invert(100%);background-color: #bfbfbf" src="icons/home.svg" onclick="closehome()">
	<img class="drawer" id="change4" style="filter: invert(100%);background-color: #bfbfbf;border-bottom-right-radius: 50%" src="icons/eye.svg" onclick="openeye()">
	<img class="drawer" id="change5" src="icons/graph.png" onclick="opengraph()">
	<img class="drawer" id="change7" style="border-bottom: 1px solid #a6a6a6; border-bottom-right-radius: 50%;" src="icons/user_set.png" onclick="openuser_set()">
	<img class="drawer" id="change8" src="icons/notification.svg" onclick="opennotification()">
	<img class="drawer" src="icons/logout.svg" onclick="popup()">
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
	<div id="pop">
		Are you sure you want to logout<br>
		<a href="logout.jsp"><button style="margin-top:30px;height:45px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-right:10px;color:white;outline:none">Ok</button></a>
		<button onclick="popdown()" style="margin-top: 30px;height:45px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;outline:none">Cancel</button>
	</div>
	<div id="qr">
		3LDvhXJKECRBYWP68XwW5kQcG5T7oiv8jm<br><hr>
		<img src="images/qrcode.png" style="height: 250px;width: 250px"><br>
		<button onclick="qrdown()" style="margin-top: 30px;height:45px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;outline:none">OK</button>
	</div>
</div>
<div class="footer">
	<button class="bt"><font color="white">&#128710;</font></button>
	<a href="home.jsp"><button class="bt"><font color="white">&#11096;</font></button></a>
	<button class="bt"><font color="white">&#9634;</font></button>
</div>
</body>
</html>