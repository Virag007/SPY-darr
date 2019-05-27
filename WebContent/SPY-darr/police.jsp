<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.connect" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Police</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"> 
<link rel="stylesheet" href="css/user.css">
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
  	<p class="alpha" onmouseover="colourChange()" onclick="closehome()">Home</p>
  	<p class="beta" onclick="opengraph()">Report</p>
  	<p class="beta" onmouseover="colourChange1()" onclick="openuser_set()">Account Settings</p>
  	<p class="beta" onclick="opennotification()">Notifications</p>
  	<p class="beta" onclick="openbug()">Bug Report</p>
  	<p class="beta" onclick="popup()">Logout</p>
  </div>
  <a href="javascript:void(0)" class="side_close" onclick="closeside()">&#10096;</a>
</div>
<div id="myperson" class="person">
  <div class="person-content">
  <%
  	String time=(new java.util.Date()).toString();
	String username=(String)session.getAttribute("uname");
	Connection con=connect.dbcon();
	Statement st=null;
	ResultSet rs=null;
	String sql="SELECT * FROM police";
	st=con.createStatement();
	rs=st.executeQuery(sql);
	String uname="";
	String email="";
	String phone="";
	String loc="";
	String pin="";
	String dept="";
	while(rs.next())
	{
		if(rs.getString(2).equals(username))
		{
			uname=rs.getString(2);
			email=rs.getString(3);
			phone=rs.getString(5);
			loc=rs.getString(6);
			pin=rs.getString(7);
			dept=rs.getString(8);
		}
		else
			continue;
	}
	%>
  	<div style="height: 195px; width: 100%; background-image:linear-gradient(rgba(255,255,255,0.6), rgba(255,255,255,0.6)), url(images/profile_back.jpg);background-size: contain">
	  	<form method="post" enctype="multipart/form-data">
	  		<input type="file" onchange="readURL(this);" name="image" hidden="" id="filetoupload">
			<img src="icons/github.png" height="130px" style="margin-left: -5%;margin-top: 120px;border-radius: 100px" width="130px" id="blah" /><label for="filetoupload" class="logo"><img src="icons/edit.png" style="cursor: pointer;margin-top: 105px" height="20px" width="18px"/></label><br><br>
			<label style="margin-left: -5%;font-family: Montserrat"><font color="#53ff1a">&#11044;</font> <%=dept %> (@<%=username %>)</label><br><br>
		</form>
	</div>
	<div style="font-family: Calibri;font-size: 20px; margin-top: 150px;text-align: left;margin-left: 30%;width: 40%">
		Department <span class="col" style="text-transform: uppercase;"><%=dept %></span><br>
		Email: <span class="col"><%=email %></span><br>
		Phone: <span class="col"><%=phone %></span><br>
		Address: <span class="col" style="text-transform: uppercase;"><%=loc %></span><br>
		Pincode: <span class="col"><%=pin %></span><br><br>
	</div>
	<div style="font-family: Montserrat;top: 115%;position: absolute;margin-left: 37%;font-size: 12px">&copy; Copyright to SPY-DARR &trade; Pvt. Ltd. v2.0</div>
  </div>
</div>
<form method="post" action="police.jsp" id="status_submit">
	<input type="hidden" id="status_index" name="status_ind" value="">
	<input type="hidden" id="status_count_new" name="status_newcount" value="">
	<input type="submit" hidden="">
</form>
<%
String home_index=request.getParameter("status_ind");
String home_count=request.getParameter("status_newcount");
String home_update="UPDATE messages SET support='"+home_count+"' WHERE mmid='"+home_index+"'";
st.executeUpdate(home_update);
%>
<div id="myeye" class="eye">
  <div class="eye-content">
  </div>
</div>
<div id="mynotification" class="notification">
  <div class="notification-content">
  <div style="height:100px;background-color: #1b7fbd;display: flex;align-items: center;justify-content: center;color:white;font-family:Agency FB;font-size:40px;letter-spacing: 0.3em"><b>NOTIFICATIONS</b></div>
  	<div id="noti" style="height: 450px;display: flex;align-items: center;justify-content: center;color:#e6e6e6;font-family:Montserrat;font-size:30px;">No New Notifications</div>
 	<%
	String[] msg_p=new String[4];
	String[] location_p=new String[4];
	String[] rec_from_p=new String[4];
	String[] noti_time_p=new String[4];
	String[] mmid_p=new String[4];
 	String noti_sql="SELECT * FROM messages";
 	String style="none";
 	String display="none";
 	String[] veiw_p=new String[4];
 	for(int i=0;i<4;i++)
 		veiw_p[i]="none";
 	ResultSet rst=st.executeQuery(noti_sql);
 	int j=0;
 	while(rst.next())
 	{
 		if(rst.getString(3).equals(username) && rst.getString(10).equals("Unseen"))
 		{
 			veiw_p[j]="block";
 			mmid_p[j]=rst.getString(1);
 			msg_p[j]=rst.getString(4);
			location_p[j]=rst.getString(5);
			rec_from_p[j]=rst.getString(2);
			noti_time_p[j]=rst.getString(11);
			j++;
			style="block";
			display="flex";
			%>
			<script>
			document.getElementById("noti").style.display = "none";
			</script>
			<%
 		}
 		else
 		{
 			continue;
 		}
 	}
 	%>
	<div style="height: 450px;width:75%;font-family:Montserrat;font-size:20px;margin-left: 150px;margin-top: 20px;display:<%=style %>;" id="ext">
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;cursor:pointer;display:<%=veiw_p[0]%>" onclick="opennoti1()">
			<font color="#3399ff"><%=rec_from_p[0] %></font> reported "<%=msg_p[0] %>" from <%=location_p[0] %> at <%=noti_time_p[0] %>
			</div>
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;cursor:pointer;display:<%=veiw_p[1]%>" onclick="opennoti2()">
			<font color="#3399ff"><%=rec_from_p[1] %></font> reported "<%=msg_p[1] %>" from <%=location_p[1] %> at <%=noti_time_p[1] %>
			</div>
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;cursor:pointer;display:<%=veiw_p[2]%>" onclick="opennoti3()">
			<font color="#3399ff"><%=rec_from_p[2] %></font> reported "<%=msg_p[2] %>" from <%=location_p[2] %> at <%=noti_time_p[2] %>
			</div>
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;cursor:pointer;display:<%=veiw_p[3]%>" onclick="opennoti4()">
			<font color="#3399ff"><%=rec_from_p[3] %></font> reported "<%=msg_p[3] %>" from <%=location_p[3] %> at <%=noti_time_p[3] %>
			</div>
		</div>
		<div style="display: <%=display %>;align-items: center;justify-content: center;margin-top:-35px" id="rem">
		<form action="police.jsp" method="post">
		<input type="hidden" name="check" value="<%=username%>">
		<input type="submit" value="" style="background-image: url(icons/cross.svg);background-repeat: no-repeat;background-position: center;cursor: pointer;width: 50px;height: 50px;border:none;border-radius: 50%;background-color:white">
		</form>
		</div> 
		<%
	  	String check=request.getParameter("check"); 
	  	if(check==null){}
	  	else {
		  	String query="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[0]+"'";
		  	String query_p="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[1]+"'";
		  	String query_p1="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[2]+"'";
		  	String query_p2="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[3]+"'";
 			st.executeUpdate(query);
 			st.executeUpdate(query_p);
 			st.executeUpdate(query_p1);
 			st.executeUpdate(query_p2);
 			%> 
		  	<script>
		  	document.getElementById("mynotification").style.width = "100%";
		  	</script>
		  	<% 
	  	}
	  	%>
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
  	<div style="margin-top: 20px">
  		<fieldset style="border-bottom: none;border-right: none;border-left: none;border-top: 2px solid #e6e6e6">
		<legend style="border-radius: 50px;height: 35px;width: 350px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white"><b>PERSONAL INFORMATION</b></legend>
		<form style="font-family:Montserrat;text-align: left;margin-left: 30%" action="police.jsp" method="post">
			<br>DEPT NAME: <input type="text" name="up_dname" class="set" style="margin-left: 105px" required><br><br>
			PHONE: <input type="number" name="up_phone" class="set" style="margin-left: 143px;-moz-appearance: textfield;" required><br><br>
			LOCATION: <textarea name="up_addr" class="set" style="margin-left: 118px;border-bottom-right-radius: 0" required></textarea><br><br>
			PINCODE: <input type="number" name="up_pincode" class="set" style="margin-left: 125px;-moz-appearance: textfield;" required><br><br>
			<input type="submit" name="up_submit" value="SUBMIT" style="margin-top: -8%;position: absolute;margin-left: 570px;" class="hov">
		</form>
		</fieldset>
  	</div>
  	<%
  	String up_dname=request.getParameter("up_dname");
  	String up_phone=request.getParameter("up_phone");
  	String up_location=request.getParameter("up_addr");
  	String up_pincode=request.getParameter("up_pincode");
  	if(up_dname==null && up_phone==null && up_location==null && up_pincode==null){}
  	else {
  		%> 
   	   <script>document.getElementById("myuser_set").style.width = "100%";</script>
   	   <%
  	   String update1="UPDATE police SET phone='"+up_phone+"',location='"+up_location+"',pincode='"+up_pincode+"',dept='"+up_dname+"' WHERE uname='"+username+"'";
  	   st.executeUpdate(update1);
  	}
  	%>
  	<div>
  		<fieldset style="border-bottom: none;border-right: none;border-left: none;border-top: 2px solid #e6e6e6">
		<legend style="border-radius: 50px;height: 35px;width: 350px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white"><b>LOGIN INFORMATION</b></legend>
		<form style="font-family:Montserrat;text-align: left;margin-left: 30%" action="police.jsp" method="post">
			<br>EMAIL: <input type="email" name="up_email" class="set" style="margin-left: 150px"><br><br>
			PASSWORD: <input type="password" name="up_passwd" class="set" style="margin-left: 105px">
			<input type="submit" name="submit" value="SUBMIT" style="margin-top: -2%;position: absolute;margin-left: 100px" class="hov">
		</form>
		</fieldset>
	</div>
	<%
	String up_email=request.getParameter("up_email");
  	String up_password=request.getParameter("up_passwd");
  	if(up_email==null && up_password==null){}
  	else {
  		%> 
    	   <script>document.getElementById("myuser_set").style.width = "100%";</script>
    	   <%
  	   String update2="UPDATE police SET email='"+up_email+"',pass='"+up_password+"' WHERE uname='"+username+"'";
  	   st.executeUpdate(update2);
  	}
  	%>
  </div>
</div>
<div id="mybug" class="bug">
  <div class="bug-content">
  	<div style="width:94%;height:510px;position: absolute;font-family: Calibri;font-size: 20px">
  		<div class="mess">Permission to copy, modify, and distribute this material for any purpose without acknowledgement is hereby strictly prohibited, and that the name of &copy; SPY-darr not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of SPY-darr. Thanks for using our platform. Kindly encourage this ad-free platform in your society.</div><br>
  		<div class="mess">Thanks for reaching Team SPY-DARR &trade; Pvt. Ltd.. Please chat with us for any issues or suggestions.</div><br>
  	<%
  	String str1=request.getParameter("report");
  	if(request.getParameter("report")==null){}
  	else {
  	   if(str1.length()==0) {}
  	   else
  	   { %> 
  	   <div class="mess" style="background-color:#b3ffb3;"><%= str1 %></div><br>
  	   <script>document.getElementById("mybug").style.width = "100%";</script>
  	   <div class="mess">Thanks.&#9786; We fix it soon.</div><br>
  	   <% 
  	 	String sql1="INSERT INTO bug VALUES (NULL,'"+username+"','"+str1+"','Unseen','"+time+"')";
  	    st.executeUpdate(sql1);
  	   }
  	}
  	%>
  	
  	</div>
  	<div style="margin-top:38%;position: absolute;width: 100%;padding: 20px;">
  	<form method="post">
  		<input type="text" name="report" placeholder="Enter your bug details" style="width: 88%;height: 35px;border-radius: 20px;border:1px solid #e6e6e6;letter-spacing: 0.2em;font-size: 15px;text-indent: 20px;">
  		<input type="submit" name="submit" value="" style="background-image: url(icons/send.svg);background-repeat: no-repeat;background-position: center;cursor: pointer;width: 36px;height: 36px;border:none; background-color: pink;border-radius: 50%;filter: invert(100%);text-align: center;">
  	</form>
  	</div>
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
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
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
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change2").style.borderBottom="1px solid blue";
  document.getElementById("change2").style.borderTop="1px solid blue";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function closehome() {
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="1px solid blue";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="1px solid blue";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function opennotification() {
  document.getElementById("mynotification").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change8").style.borderBottom="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change7").style.borderBottom="1px solid yellow";
  document.getElementById("change9").style.borderBottom="0";
}
function opengraph() {
  document.getElementById("mygraph").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change5").style.borderBottom="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change7").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="1px solid blue";
  document.getElementById("change7").style.borderBottom="1px solid #a6a6a6";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function openuser_set() {
  document.getElementById("myuser_set").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("mybug").style.width = "0%";
  document.getElementById("change7").style.borderBottom="1px solid yellow";
  document.getElementById("change7").style.borderTop="1px solid yellow";
  document.getElementById("change2").style.borderTop="0";
  document.getElementById("change4").style.borderTop="0";
  document.getElementById("change5").style.borderTop="0";
  document.getElementById("change8").style.borderTop="0";
  document.getElementById("change9").style.borderTop="0";
  document.getElementById("change2").style.borderBottom="0";
  document.getElementById("change4").style.borderBottom="0";
  document.getElementById("change5").style.borderBottom="0";
  document.getElementById("change8").style.borderBottom="0";
  document.getElementById("change9").style.borderBottom="0";
}
function openbug() {
  document.getElementById("mybug").style.width = "100%";
  document.getElementById("myDrop").style.height = "0%";
  document.getElementById("myside").style.width = "0%";
  document.getElementById("myperson").style.width = "0%";
  document.getElementById("mynotification").style.width = "0%";
  document.getElementById("mygraph").style.width = "0%";
  document.getElementById("myuser_set").style.width = "0%";
  document.getElementById("change9").style.borderBottom="1px solid yellow";
  document.getElementById("change9").style.borderTop="1px solid yellow";
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
function opennoti1() {
  document.getElementById("qr1").style.height="80%";
  document.getElementById("qr1").style.display="block";
}
function noti1down() {
  document.getElementById("qr1").style.height="0";
  document.getElementById("qr1").style.display="none";
}
function opennoti2() {
	document.getElementById("qr2").style.height="80%";
	document.getElementById("qr2").style.display="block";
}
function noti2down() {
	document.getElementById("qr2").style.height="0";
	document.getElementById("qr2").style.display="none";
}
function opennoti3() {
	document.getElementById("qr3").style.height="80%";
	document.getElementById("qr3").style.display="block";
}
function noti3down() {
	document.getElementById("qr3").style.height="0";
	document.getElementById("qr3").style.display="none";
}
function opennoti4() {
	document.getElementById("qr4").style.height="80%";
	document.getElementById("qr4").style.display="block";
}
function noti4down() {
	document.getElementById("qr4").style.height="0";
	document.getElementById("qr4").style.display="none";
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
	<img class="drawer" id="change4" style="filter: invert(100%);background-color: #bfbfbf;border-bottom-right-radius: 50%" src="icons/home.svg" onclick="closehome()">
	<img class="drawer" id="change5" src="icons/graph.png" onclick="opengraph()">
	<img class="drawer" id="change7" style="border-bottom: 1px solid #a6a6a6; border-bottom-right-radius: 50%;" src="icons/user_set.png" onclick="openuser_set()">
	<img class="drawer" id="change8" src="icons/notification.svg" onclick="opennotification()">
	<img class="drawer" id="change9" src="icons/bug.svg" onclick="openbug()">
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
		<a href="logout.jsp"><button style="margin-top:30px;height:45px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-right:10px;color:white;outline:none">OK</button></a>
		<button onclick="popdown()" style="margin-top: 30px;height:45px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;outline:none">Cancel</button>
	</div>
	<div id="qr1" class="qr_common">
		<div style="width: 100%;height:7%;border-bottom: 2px solid black;padding-top: 20px;background-color: #00b3b3;color:white;font-family:Agency FB;font-size:20px;letter-spacing: 0.3em;border-top-right-radius: 20px;border-top-left-radius: 20px"><b>SEND MONEY</b></div>
	<label style="padding: 10px 20px;background-color: #009999;border: none;border-radius: 20px;color: white;font-size: 13px"><%=username %></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="15" color="#e6e6e6">&#x2192;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="padding: 10px 20px;background-color:#cccc33;border: none;border-radius: 20px;color: white;font-size: 13px"><%=rec_from_p[0] %></label><br><br><br>
	<form method="post" action="police.jsp">
		<input type="text" name="reward_coin" style="height: 150px;width: 150px;border-radius: 50%;border:15px solid #e6e6e6;text-align: center;box-shadow: 3px 6px 16px #888888;font-size: 20px;" placeholder="Bitcoin"><br><br><br>
		<textarea placeholder="Add a message (optional)" name="additional" style="height: 50px;width:450px;border-radius: 50px;border:none;border-bottom-right-radius: 0;text-align: center;line-height: 30px;background-color: #f2f2f2"></textarea>
		<input type="submit" style="margin-top:30px;height:40px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-right:10px;color:white;cursor: pointer;font-size: 15px;font-family: Montserrat" value="Send">
		<span onclick="noti1down()" style="padding: 10px 20px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;cursor: pointer;font-size: 15px">Cancel</span>
	</form>
	</div>
	<%
	String reward_coin=request.getParameter("reward_coin");
	String additional=request.getParameter("additional");
	String message_new=additional+"@"+msg_p[0];
	if(reward_coin!=null && additional!=null)
	{
		if(reward_coin.equals("0"))
		{
			String insert_msg="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[0]+"','"+message_new+"','"+location_p[0]+"','0','0','Rejected','0','Unseen','"+time+"','0')";
			String query_msg="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[0]+"'";
			st.executeUpdate(insert_msg);
			st.executeUpdate(query_msg);
		}
		else
		{
			String insert_msg="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[0]+"','"+message_new+"','"+location_p[0]+"','0','0','Accepted','"+reward_coin+"','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg);
			String query_msg="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[0]+"'";
			st.executeUpdate(query_msg);
		}
	}
	else {}
	%>
	<div id="qr2" class="qr_common">
		<div style="width: 100%;height:7%;border-bottom: 2px solid black;padding-top: 20px;background-color: #00b3b3;color:white;font-family:Agency FB;font-size:20px;letter-spacing: 0.3em;border-top-right-radius: 20px;border-top-left-radius: 20px"><b>SEND MONEY</b></div>
	<label style="padding: 10px 20px;background-color: #009999;border: none;border-radius: 20px;color: white;font-size: 13px"><%=username %></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="15" color="#e6e6e6">&#x2192;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="padding: 10px 20px;background-color:#cccc33;border: none;border-radius: 20px;color: white;font-size: 13px"><%=rec_from_p[1] %></label><br><br><br>
	<form method="post" action="police.jsp">
		<input type="text" name="reward_coin1" style="height: 150px;width: 150px;border-radius: 50%;border:15px solid #e6e6e6;text-align: center;box-shadow: 3px 6px 16px #888888;font-size: 20px;" placeholder="Bitcoin"><br><br><br>
		<textarea placeholder="Add a message (optional)" name="additional1" style="height: 50px;width:450px;border-radius: 50px;border:none;border-bottom-right-radius: 0;text-align: center;line-height: 30px;background-color: #f2f2f2"></textarea>
		<input type="submit" style="margin-top:30px;height:40px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-right:10px;color:white;cursor: pointer;font-size: 15px;font-family: Montserrat" value="Send">
		<span onclick="noti2down()" style="padding: 10px 20px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;cursor: pointer;font-size: 15px">Cancel</span>
	</form>
	</div>
	<%
	String reward_coin1=request.getParameter("reward_coin1");
	String additional1=request.getParameter("additional1");
	String message_new1=additional1+"@"+msg_p[1];
	if(reward_coin1!=null && additional1!=null)
	{
		if(reward_coin1.equals("0"))
		{
			String insert_msg1="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[1]+"','"+message_new1+"','"+location_p[1]+"','0','0','Rejected','0','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg1);
			String query_msg1="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[1]+"'";
			st.executeUpdate(query_msg1);
		}
		else
		{
			String insert_msg1="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[1]+"','"+message_new1+"','"+location_p[1]+"','0','0','Accepted','"+reward_coin1+"','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg1);
			String query_msg1="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[1]+"'";
			st.executeUpdate(query_msg1);
		}
	}
	else {}
	%>
	<div id="qr3" class="qr_common">
		<div style="width: 100%;height:7%;border-bottom: 2px solid black;padding-top: 20px;background-color: #00b3b3;color:white;font-family:Agency FB;font-size:20px;letter-spacing: 0.3em;border-top-right-radius: 20px;border-top-left-radius: 20px"><b>SEND MONEY</b></div>
	<label style="padding: 10px 20px;background-color: #009999;border: none;border-radius: 20px;color: white;font-size: 13px"><%=username %></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="15" color="#e6e6e6">&#x2192;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="padding: 10px 20px;background-color:#cccc33;border: none;border-radius: 20px;color: white;font-size: 13px"><%=rec_from_p[2] %></label><br><br><br>
	<form method="post" action="police.jsp">
		<input type="text" name="reward_coin2" style="height: 150px;width: 150px;border-radius: 50%;border:15px solid #e6e6e6;text-align: center;box-shadow: 3px 6px 16px #888888;font-size: 20px;" placeholder="Bitcoin"><br><br><br>
		<textarea placeholder="Add a message (optional)" name="additional2" style="height: 50px;width:450px;border-radius: 50px;border:none;border-bottom-right-radius: 0;text-align: center;line-height: 30px;background-color: #f2f2f2"></textarea>
		<input type="submit" style="margin-top:30px;height:40px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-right:10px;color:white;cursor: pointer;font-size: 15px;font-family: Montserrat" value="Send">
		<span onclick="noti3down()" style="padding: 10px 20px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;cursor: pointer;font-size: 15px">Cancel</span>
	</form>
	</div>
	<%
	String reward_coin2=request.getParameter("reward_coin2");
	String additional2=request.getParameter("additional2");
	String message_new2=additional2+"@"+msg_p[2];
	if(reward_coin2!=null && additional2!=null)
	{
		if(reward_coin2.equals("0"))
		{
			String insert_msg2="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[2]+"','"+message_new2+"','"+location_p[2]+"','0','0','Rejected','0','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg2);
			String query_msg2="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[2]+"'";
			st.executeUpdate(query_msg2);
		}
		else
		{
			String insert_msg2="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[2]+"','"+message_new2+"','"+location_p[2]+"','0','0','Accepted','"+reward_coin2+"','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg2);
			String query_msg2="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[2]+"'";
			st.executeUpdate(query_msg2);
		}
	}
	else {}
	%>
	<div id="qr4" class="qr_common">
		<div style="width: 100%;height:7%;border-bottom: 2px solid black;padding-top: 20px;background-color: #00b3b3;color:white;font-family:Agency FB;font-size:20px;letter-spacing: 0.3em;border-top-right-radius: 20px;border-top-left-radius: 20px"><b>SEND MONEY</b></div>
	<label style="padding: 10px 20px;background-color: #009999;border: none;border-radius: 20px;color: white;font-size: 13px"><%=username %></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="15" color="#e6e6e6">&#x2192;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="padding: 10px 20px;background-color:#cccc33;border: none;border-radius: 20px;color: white;font-size: 13px"><%=rec_from_p[3] %></label><br><br><br>
	<form method="post" action="police.jsp">
		<input type="text" name="reward_coin3" style="height: 150px;width: 150px;border-radius: 50%;border:15px solid #e6e6e6;text-align: center;box-shadow: 3px 6px 16px #888888;font-size: 20px;" placeholder="Bitcoin"><br><br><br>
		<textarea placeholder="Add a message (optional)" name="additional3" style="height: 50px;width:450px;border-radius: 50px;border:none;border-bottom-right-radius: 0;text-align: center;line-height: 30px;background-color: #f2f2f2"></textarea>
		<input type="submit" style="margin-top:30px;height:40px;width:90px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-right:10px;color:white;cursor: pointer;font-size: 15px;font-family: Montserrat" value="Send">
		<span onclick="noti4down()" style="padding: 10px 20px;background-image:linear-gradient(#D38312,#A83279);border-radius:20px;border:none;margin-left:10px;color:white;cursor: pointer;font-size: 15px">Cancel</span>
	</form>
	</div>
	<%
	String reward_coin3=request.getParameter("reward_coin3");
	String additional3=request.getParameter("additional3");
	String message_new3=additional3+"@"+msg_p[3];
	if(reward_coin3!=null && additional3!=null)
	{
		if(reward_coin3.equals("0"))
		{
			String insert_msg3="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[3]+"','"+message_new3+"','"+location_p[3]+"','0','0','Rejected','0','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg3);
			String query_msg3="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[3]+"'";
			st.executeUpdate(query_msg3);
		}
		else
		{
			String insert_msg3="INSERT INTO messages VALUES (NULL,'"+username+"','"+rec_from_p[3]+"','"+message_new3+"','"+location_p[3]+"','0','0','Accepted','"+reward_coin3+"','Unseen','"+time+"','0')";
			st.executeUpdate(insert_msg3);
			String query_msg3="UPDATE messages SET view='Seen' WHERE mmid='"+mmid_p[3]+"'";
			st.executeUpdate(query_msg3);
		}
	}
	else {}
	%>
</div>
<%
String[] home_status=new String[50];
String[] div=new String[50];
String[] uploader=new String[50];
String[] geo=new String[50];
String[] support=new String[50];
String[] mmid=new String[50];
String[] colors = {"#3399ff","#009999","#79d2a6","#206020","#cc3333","#cc5933","#cc8033","#cca633","#cccc33","#a6cc33","#a633cc","#cc3359","#ffff66"};
ResultSet home=st.executeQuery(noti_sql);
int status_count=0;
Random ran = new Random();
while(home.next())
	{
		if(home.getString(12).equals("0")==false && home.getString(8).equals("Not Accepted"))
		{
			int random=ran.nextInt(13);
			home_status[status_count]=home.getString(4);
			uploader[status_count]=home.getString(2);
			support[status_count]=home.getString(12);
			mmid[status_count]=home.getString(1);
			geo[status_count]=" @(Latitude: "+home.getString(6)+", Longitude: "+home.getString(7)+")";
			div[status_count]="<div><label class=\"dp\" style=\"background-color:"+colors[random]+";text-transform:uppercase\">"+uploader[status_count].charAt(0)+"</label><div class=\"home\"><font color=\"#1b7fbd\" face=\"Helvetica\"><b><u>"+uploader[status_count]+"</u>:&nbsp;</b></font>&nbsp;"+home_status[status_count]+geo[status_count]+"<br><br>&#128077;&nbsp;<input type=\"text\" id=\"status"+status_count+"\" value="+support[status_count]+" style=\"background-color:#f2f2f2;border:none\"><div class=\"overlay_home\" onclick=\"status_counter("+status_count+","+mmid[status_count]+")\"><div class=\"text\">&#128077;&nbsp;&nbsp;SUPPORT</div></div></div></div>";
			status_count++;
		}
		else
		{
			continue;
		}
	}
%>
<div style="height:105px;background-color: #1b7fbd;color:white;font-family:Agency FB;font-size:40px;letter-spacing: 0.3em"><b><label style="margin-top: 40px;position: absolute;margin-left: 40%">CRIME CHANNEL</label></b></div>
<div style="margin-left: 100px;width: 90%;margin-top: 28px">
  	<%
  	for(int m=(status_count-1);m>=0;m--)
  	{%>
  		<%=div[m] %><%
  	}
  	%>
</div>
<script>
function status_counter(status_count,mmid_count) {
	var id_status="status";
	var id_status1=id_status.concat(status_count);
	var counter=parseInt(document.getElementById(id_status1).value);
	counter++;
	document.getElementById(id_status1).value=counter;
	document.getElementById("status_count_new").value=counter;
	document.getElementById("status_index").value=mmid_count;
	document.getElementById("status_submit").submit();
}
</script>
<div class="footer">
	<button class="bt"><font color="white">&#128710;</font></button>
	<a href="home.jsp"><button class="bt"><font color="white">&#11096;</font></button></a>
	<button class="bt"><font color="white">&#9634;</font></button>
</div>
</body>
</html>