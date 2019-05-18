<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.connect" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
<link rel="stylesheet" href="css/normalreg.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
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
<div id="back">
	<fieldset>
		<legend>Who r U</legend>
	<form id="login" enctype="multipart/form-data" action="normalreg.jsp">
		<table>
			<tr>
				<td align="center"><b>Profile Photo</b><input type="file" onchange="readURL(this);" name="image" hidden id="filetoupload"></td>
			</tr>
			<tr>
				<td align="center"><img src="icons/github.png" height="80px" style="margin-top:10px;border-radius:100px" width="80px" id="blah" /><label for="filetoupload" class="logo"><img src="icons/edit.png" style="cursor:pointer;margin-top:6px" height="13px" width="13px"/></label></td>
			</tr>
			<tr>
				<td>User Name<input type="text" name="uname" placeholder="Set your Username" style="width:230px;margin-left:75px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>First Name<input type="text" name="fname" placeholder="First Name" style="width:230px;margin-left:75px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>Last Name<input type="text" name="lname" placeholder="Last Name" style="width:230px;margin-left:80px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>Email<input type="email" name="email" placeholder="Email" value=<%= request.getParameter("sendemail1") %> style="width:230px;margin-left:110px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>Password<input type="password" name="passwd" placeholder="Password" value=<%= request.getParameter("sendpassword1") %> style="width:230px;margin-left:83px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>Confirm Password<input type="password" name="cpasswd" placeholder="Confirm Password" value=<%= request.getParameter("sendpassword1") %> style="width:230px;margin-left:25px;margin-top:10px" required ></td>
			</tr>
			<tr>
				<td>Phone<input type="number" name="phone" placeholder="Phone" style="width:230px;margin-left:105px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>Bitcoin<input type="text" name="bitcoin" placeholder="Bitcoin Address" style="width:230px;margin-left:98px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td>Residential Address<textarea name="addr" placeholder="Residential Address" style="width:230px;margin-left:15px;margin-top:10px" required></textarea></td>
			</tr>
			<tr>
				<td>Pincode<input type="number" name="pincode" placeholder="Pincode" style="width:230px;margin-left:95px;margin-top:10px" required></td>
			</tr>
			<tr>
				<td><p align="center" style="margin-top:20px;font-weight:lighter;font-family:Calibri"><font size="3">By clicking Complete, you agree to the SPY-darr User Agreement, Privacy Policy, and Cookie Policy.</font></p></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" name="okay" value="COMPLETE" style="width:260px"></td>
			</tr>
		</table>
	</form>
</fieldset></div><br><br><br>
<%
Connection con=connect.dbcon();
Statement st=null;
String username=request.getParameter("uname");
String firstname=request.getParameter("fname");
String lastname=request.getParameter("lname");
String email=request.getParameter("email");
String password=request.getParameter("passwd");
String phone=request.getParameter("phone");
String address=request.getParameter("addr");
String pincode=request.getParameter("pincode");
String bitcoin=request.getParameter("bitcoin");
String sql="INSERT INTO user VALUES (NULL,'"+username+"','"+firstname+"','"+lastname+"','"+email+"','"+password+"','"+phone+"','"+address+"','"+pincode+"','"+bitcoin+"')";
String sql1="INSERT INTO status VALUES (NULL,'user','"+username+"','"+email+"','"+password+"')";
if(username==null && firstname==null && lastname==null && email==null && password==null && phone==null && address==null && pincode==null && bitcoin==null) {}
else
{
	st=con.createStatement();
	st.executeUpdate(sql);
	st.executeUpdate(sql1);
	response.sendRedirect("login.jsp");
}
%>
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
function readURL(input) 
{
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
</body>
</html>