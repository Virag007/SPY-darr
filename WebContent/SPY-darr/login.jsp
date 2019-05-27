<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.connect" %>
<%@page import="java.sql.*" %>
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
		<br>
		<form method="post" action="login.jsp">
		<input type="text" name="username" placeholder="Username" required><br><br>
		<input type="password" name="passwd" placeholder="Password" required><br><br>
		<a href="forgotpass.jsp"><font face="Calibri" color="#334d4d">Forgot Your Password?</font><br></a><hr style="width: 145px;color: #f0f5f5"><br>
		<input type="submit" value="SIGN IN" class="but"></form>
		<br><label style="font-family:Calibri;color:red;display:none" id="extra"><marquee>Wrong Credentials</marquee></label>
	</div>
	
	<%
	Connection con=connect.dbcon();
	Statement st=null;
	ResultSet rs=null;
	String sql="SELECT * FROM status";
	String username=request.getParameter("username");
	String password=request.getParameter("passwd");
	if(username==null && password==null) {}
	else
	{
		st=con.createStatement();
		rs=st.executeQuery(sql);
		while(rs.next())
		{
			if(rs.getString(3).equals(username) && rs.getString(5).equals(password) && rs.getString(2).equals("admin"))
			{
				session.setAttribute("uname", username);
				response.sendRedirect("admin.jsp");
			}
			else if(rs.getString(3).equals(username) && rs.getString(5).equals(password) && rs.getString(2).equals("user"))
			{
				session.setAttribute("uname", username);
				response.sendRedirect("user.jsp");
			}
			else if(rs.getString(3).equals(username) && rs.getString(5).equals(password) && rs.getString(2).equals("police"))
			{
				session.setAttribute("uname", username);
				response.sendRedirect("police.jsp");
			}
			else if(rs.getString(3).equals(username) && rs.getString(5).equals(password) && rs.getString(2).equals("ministry"))
			{
				session.setAttribute("uname", username);
				response.sendRedirect("ministry.jsp");
			}
			else
			{
				%>
				<script>document.getElementById("extra").style.display = "block";</script>
				<%
			}
		}
	}
	%>
	
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
				<form method="post" action="login.jsp">
				<input type="email" name="Email" placeholder="Email" required><br><br>
				<input type="password" name="passwd" placeholder="Password" required><br><br>
				<select name="usertype" required>
                	<option selected disabled hidden="">Select Usertype</option>
                	<option>Normal User</option>
                	<option>Police</option>   
                	<option>Ministry</option>
                </select><br><br>
				<input type="submit" value="SIGN UP" class="but"></form>
			</div>
			<%
			if(request.getParameter("usertype")==null){}
			else {
			String usertype=request.getParameter("usertype");
			String email=request.getParameter("Email");
			String pass=request.getParameter("passwd");
			if(usertype.equals("Normal User"))
			{
				%>
				<form action="normalreg.jsp" method="post">
					<input type="hidden" name="sendemail1" value="<%=email%>"/>
					<input type="hidden" name="sendpassword1" value="<%=pass%>" />
					<input type="submit" id="qq" value="" hidden="">
				</form>
				<script>
				document.getElementById("extra").style.display = "none";
				document.getElementById("qq").click();
				</script>
				<%
			}
			else if(usertype.equals("Police"))
			{
				%>
				<form action="policereg.jsp" method="post">
					<input type="hidden" name="sendemail2" value="<%=email%>"/>
					<input type="hidden" name="sendpassword2" value="<%=pass%>" />
					<input type="submit" id="qq" value="" hidden="">
				</form>
				<script>
				document.getElementById("extra").style.display = "none";
				document.getElementById("qq").click();
				</script>
				<%
			}
			else if(usertype.equals("Ministry"))
			{
				%>
				<form action="ministryreg.jsp" method="post">
					<input type="hidden" name="sendemail3" value="<%=email%>"/>
					<input type="hidden" name="sendpassword3" value="<%=pass%>" />
					<input type="submit" id="qq" value="" hidden="">
				</form>
				<script>
				document.getElementById("extra").style.display = "none";
				document.getElementById("qq").click();
				</script>
				<%
			}
			else
			{}
			}
			%>
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
