<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.connect" %>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"> 
<link rel="stylesheet" href="css/user.css">
<script src="js/jquery-3.2.1.js"></script>
<script src="http://www.openlayers.org/api/OpenLayers.js"></script>
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
  	<p class="alpha" onmouseover="colourChange()" onclick="openeye()">Messages</p>
  	<p class="beta" onclick="opengraph()">Report</p>
  	<p class="beta" onclick="openbitcoin()">Wallet</p>
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
	String sql="SELECT * FROM user";
	st=con.createStatement();
	rs=st.executeQuery(sql);
	String uname="";
	String fname="";
	String lname="";
	String email="";
	String phone="";
	String loc="";
	String pin="";
	String bitcoin="";
	String wallet="";
	String uid="";
	double etherium=0, dollar=0, euro=0, inr=0,sum_wallet=0;
	while(rs.next())
	{
		if(rs.getString(2).equals(username))
		{
			uid=rs.getString(1);
			uname=rs.getString(2);
			fname=rs.getString(3);
			lname=rs.getString(4);
			email=rs.getString(5);
			phone=rs.getString(7);
			loc=rs.getString(8);
			pin=rs.getString(9);
			bitcoin=rs.getString(10);
			wallet=rs.getString(11);
			etherium=Math.round(Double.parseDouble(wallet)*31.72*100000d)/10000d;
			dollar=Math.round(Double.parseDouble(wallet)*8016.47*100000d)/10000d;
			euro=Math.round(Double.parseDouble(wallet)*7186.11*100000d)/10000d;
			inr=Math.round(Double.parseDouble(wallet)*557381.15*100000d)/10000d;
		}
		else
			continue;
	}
	
	String sql4="SELECT * FROM messages";
	ResultSet rs3=st.executeQuery(sql4);
	while(rs3.next())
	{
		if(rs3.getString(3).equals(username) && rs3.getString(8).equals("Accepted"))
		{
			sum_wallet+=Double.parseDouble(rs3.getString(9));
		}
		else
			continue;
	}
	String balance=BigDecimal.valueOf(sum_wallet).toPlainString();
	String update="UPDATE user SET wallet='"+balance+"' WHERE uid='"+uid+"'";
	st.executeUpdate(update);
	
	int count_geo=0;
	String getloc="SELECT * FROM police";
	ResultSet rs_geo=st.executeQuery(getloc);
	while(rs_geo.next())
	{
		count_geo++;
	}
	double[] p_lat=new double[count_geo];
	double[] p_long=new double[count_geo];
	String[] police_uname=new String[count_geo];
	double[] Distance=new double[count_geo];
	for(int i=0;i<count_geo;i++)
	{
		p_lat[i]=0;
		p_long[i]=0;
		Distance[i]=0;
		police_uname[i]="";
	}
	%>
  	<div style="height: 195px; width: 100%; background-image:linear-gradient(rgba(255,255,255,0.6), rgba(255,255,255,0.6)), url(images/profile_back.jpg);background-size: contain">
	  	<form method="post" enctype="multipart/form-data">
	  		<input type="file" onchange="readURL(this);" name="image" hidden="" id="filetoupload">
			<img src="icons/github.png" height="130px" style="margin-left: -6%;margin-top: 120px;border-radius: 100px" width="130px" id="blah" /><label for="filetoupload" class="logo"><img src="icons/edit.png" style="cursor: pointer;margin-top: 105px" height="20px" width="18px"/></label><br><br>
			<label style="margin-left: -6%;font-family: Montserrat"><font color="#53ff1a">&#11044;</font> <%=fname %> (@<%=username %>)</label><br><br>
		</form>
	</div>
	<div style="font-family: Calibri;font-size: 20px; margin-top: 150px;text-align: left;margin-left: 30%;width: 40%">
		FirstName: <span class="col" style="text-transform: uppercase;"><%=fname %></span> <span style="margin-left: 40px">LastName:</span> <span class="col" style="text-transform: uppercase;"><%=lname %></span><br>
		Email: <span class="col"><%=email %></span><br>
		Phone: <span class="col"><%=phone %></span><br>
		Address: <span class="col" style="text-transform: uppercase;"><%=loc %></span><br>
		Pincode: <span class="col"><%=pin %></span><br>
		Bitcoin address: <span class="col"><%=bitcoin %></span>
	</div>
	<div style="font-family: Montserrat;top: 115%;position: absolute;margin-left: 37%;font-size: 12px">&copy; Copyright to SPY-DARR &trade; Pvt. Ltd. v2.0</div>
  </div>
</div>
<form method="post" action="user.jsp" id="status_submit">
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
  	<div style="width: 25%;top: 30px;left:50px;position: absolute">
  		<fieldset style="height: 523px;border-radius: 10px;padding: 0px;overflow: hidden;border: 1px solid #e6e6e6"><legend style="border-radius: 50px;height: 35px;width: 250px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white;text-align: center;margin-left: 10px"><b>REPORT INFORMATION</b></legend>
  			<div style="height: 444px;padding-left: 10px;font-family: Helvetica;letter-spacing: 0.1em">
	  			<form method="post" action="user.jsp" id="form_info">
	  				Incident Date: <input type="Date" name="in_date" style="height: 30px;width: 200px;border: 1px solid #e6e6e6;border-radius: 20px;margin-top: 20px;"><br><br>
	  				Incident Time: <input type="Time" name="in_time" style="height: 30px;width: 200px;border: 1px solid #e6e6e6;border-radius: 20px;"><br><br>
	  				Incident Type: <select style="height: 35px;width: 200px;border: 1px solid #e6e6e6;border-radius: 20px;-moz-appearance:none;text-align: center;" name="in_type">
	  					<option>Select Crime type</option>
	  					<option>Assault</option>
	  					<option>Battery</option>
	  					<option>False Imprisonment</option>
	  					<option>Kidnapping</option>
	  					<option>Homicide</option>
	  					<option>Rape</option>
	  					<option>Larceny</option>
	  					<option>Robbery</option>
	  					<option>Burglary</option>
	  					<option>Arson</option>
	  					<option>Embezzlement</option>
	  					<option>Forgery</option>
	  					<option>False pretenses</option>
	  					<option>Receipt of stolen goods</option>
	  					<option>Attempt</option>
	  					<option>Solicitation</option>
	  					<option>Conspiracy</option>
	  					<option>Alcohol-related crimes</option>
	  				</select><br><br><br>
	  				Incident Location: <textarea style="height: 80px;width: 325px;border: 1px solid #e6e6e6;border-radius: 20px;border-bottom-right-radius: 0;margin-top:5px;text-align: center;line-height:30px;" placeholder="Optional Address" name="in_loc"></textarea><br><br>
	  				Description: <textarea style="height: 80px;width: 325px;border: 1px solid #e6e6e6;border-radius: 20px;border-bottom-right-radius: 0;margin-top:5px;text-align: center;line-height:30px;" placeholder="Enter full crime Description" name="in_des"></textarea>
	  				<input type="submit" name="submit_info" hidden="">
	  			</form>
  			</div>
  			<div><button style="height: 35px;width: 350px;border: none;background-color: #1b7fbd;color: white;font-family: Agency FB;font-size: 20px;letter-spacing: 0.3em;" onclick="submit_info()"><b>SUBMIT</b></button></div>
  			<%
  			String in_date=request.getParameter("in_date");
  			String in_time=request.getParameter("in_time");
  			String in_type=request.getParameter("in_type");
  			String in_loc=request.getParameter("in_loc");
  			String in_des=request.getParameter("in_des");
  			if(in_date==null && in_time==null && in_type==null && in_loc==null && in_des==null) {}
  			else
  			{
  				%>
  				<script>document.getElementById("myeye").style.width = "100%";</script>
  				<%
  			}
  			%>
  		</fieldset>
  	</div>
  	<div style="margin-left: 34.3%;top: 30px;position: absolute;">
  		<fieldset style="border-radius: 10px;padding: 0px;overflow: hidden;border: 1px solid #e6e6e6"><legend style="border-radius: 50px;height: 35px;width: 250px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white;text-align: center;margin-left: 10px"><b>SET LOCATION</b></legend>
  			<div style="display: flex;align-items: center;justify-content: left;padding: 10px"><img src="icons/map_gps.svg" onclick="getLocation()" style="cursor: pointer;">&nbsp;&nbsp;<label style="cursor: pointer;font-family: Garamond" onclick="getLocation()">Use your current location</label></div>
  			<div id="mapdiv" style="height:400px;width:350px;background-image: url(icons/watermark.svg);"></div>
  			<div>
	  			<form action="user.jsp" method="post">
	  			<input type="hidden" name="in_date1" value="<%= in_date %>">
	  			<input type="hidden" name="in_time1" value="<%= in_time %>">
	  			<input type="hidden" name="in_type1" value="<%= in_type %>">
	  			<input type="hidden" name="in_loc1" value="<%= in_loc %>">
	  			<input type="hidden" name="in_des1" value="<%= in_des %>">
	  			<input type="hidden" name="in_geolat" id="latitude">
	  			<input type="hidden" name="in_geolong" id="longitude">
	  			<input type="submit" value="SUBMIT" name="submit_loc"  style="font-weight:bold;height: 35px;width: 350px;border: none;background-color: #1b7fbd;color: white;font-family: Agency FB;font-size: 20px;letter-spacing: 0.3em;cursor:pointer"></form>
  			</div>
  			<%
  			String in_date1=request.getParameter("in_date1");
  			String in_time1=request.getParameter("in_time1");
  			String in_type1=request.getParameter("in_type1");
  			String in_loc1=request.getParameter("in_loc1");
  			String in_des1=request.getParameter("in_des1");
  			String in_geolat=request.getParameter("in_geolat");
  			String in_geolong=request.getParameter("in_geolong");
  			if(in_geolat==null && in_geolong==null) {}
  			else
  			{
  				int p=0;
  				String search_policedb="SELECT * FROM police";
  				ResultSet search_rs=st.executeQuery(search_policedb);
  				while(search_rs.next())
  				{
  					p_lat[p]=Double.parseDouble(search_rs.getString(9));
  					p_long[p]=Double.parseDouble(search_rs.getString(10));
  					police_uname[p]=search_rs.getString(2);
  					p++;
  				}
  				double xlat=Double.parseDouble(in_geolat);
  	  			double ylong=Double.parseDouble(in_geolong);
  	  			double R = 6371000,dlat=0,dlong=0,mx=0,cx=0;
  	  			for(int a=0;a<count_geo;a++)
  	  			{
  	  				dlat=Math.toRadians(p_lat[a]-xlat);
  	  				dlong=Math.toRadians(p_long[a]-ylong);
  	  				mx=Math.sin(dlat/2) * Math.sin(dlat/2) + Math.cos(Math.toRadians(xlat))* Math.cos(Math.toRadians(p_lat[a])) * Math.sin(dlong/2) * Math.sin(dlong/2);
  	  				cx=2 * Math.atan2(Math.sqrt(mx), Math.sqrt(1-mx));
  	  				Distance[a]=(float)(R*cx);
  	  			}
  	  			double min=Distance[0];
  	  			int array_index=0;
  	  			for(int y=0;y<Distance.length;y++)
  	  			{
  	  				if(min>Distance[y])
  	  				{
  	  					min=Distance[y];
  	  					array_index=y;
  	  				}
  	  			}
  				String message="["+in_date1+"|"+in_time1+"] ("+in_type1+") "+in_des1+" at "+in_loc1;
  				String report_sql="INSERT INTO messages VALUES (NULL,'"+username+"','"+police_uname[array_index]+"','"+message+"','"+in_loc1+"','"+in_geolat+"','"+in_geolong+"','Not Accepted','0','Unseen','"+time+"','1')";
  				st.executeUpdate(report_sql);
  				%>
  				<script>document.getElementById("myeye").style.width = "100%";</script>
  				<%
  			}
  			%>
  		</fieldset>
  	</div>
  	<div style="width: 25%;margin-left: 65%;top: 30px;position: absolute;">
  		<fieldset style="height: 523px;border-radius: 10px;padding: 0px;overflow: hidden;border: 1px solid #e6e6e6"><legend style="border-radius: 50px;height: 35px;width: 300px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white;text-align: center;margin-left: 10px"><b>SUPPORT WITH EVIDENCE</b></legend>
  		<div style="height: 444px;padding-left: 20px;font-family: Helvetica">
  			<form action="user.jsp" method="post" id="from_des">
  			<input type="file" id="upload" multiple='multiple' hidden="" name="attachments"></input><label for="upload" style="padding: 5px 30px;border: 1px solid #e6e6e6;border-radius: 30px;margin-top: 30px;background-color:#e6e6e6;position: absolute;cursor: pointer;">Browse</label>
  			<textarea style="margin-top: 300px;position: absolute;width: 305px;height: 120px;border: 1px solid #e6e6e6;border-radius: 10px;border-bottom-right-radius: 0;line-height: 30px;text-align: center;" placeholder="Compose secure description" name="in_attach"></textarea></form>
			<div id="selectedFiles" style="margin-top: 80px;height: 200px;font-family: Garamond;font-size: 15px;position: absolute;"></div>
  		</div>
  		<div><button style="height: 35px;width: 350px;border: none;background-color: #1b7fbd;color: white;font-family: Agency FB;font-size: 20px;letter-spacing: 0.3em;" onclick="submit_des()"><b>SUBMIT</b></button></div>
  		<%
  		String in_attach=request.getParameter("in_attach");
  		if(in_attach==null) {}
		else
		{
			%>
			<script>document.getElementById("myeye").style.width = "100%";</script>
			<%
		}
  		%>
  	</fieldset>
  	</div>
  </div>
</div>
<div id="mynotification" class="notification">
  <div class="notification-content">
  	<div style="height:100px;background-color: #1b7fbd;display: flex;align-items: center;justify-content: center;color:white;font-family:Agency FB;font-size:40px;letter-spacing: 0.3em"><b>NOTIFICATIONS</b></div>
  	<div id="noti" style="height: 450px;display: flex;align-items: center;justify-content: center;color:#e6e6e6;font-family:Montserrat;font-size:30px;">No New Notifications</div>
 	<%
 	String[] msg_u=new String[50];
	String[] location_u=new String[50];
	String[] rec_from_u=new String[50];
	String[] noti_time_u=new String[50];
	String[] coins_u=new String[50];
 	String noti_sql="SELECT * FROM messages";
 	String style="none";
 	String display="none";
 	String[] veiw_u=new String[50];
 	for(int i=0;i<50;i++)
 		veiw_u[i]="none";
 	ResultSet rst=st.executeQuery(noti_sql);
 	int j=0;
 	while(rst.next())
 	{
 		if(rst.getString(3).equals(username) && rst.getString(10).equals("Unseen"))
 		{
 			veiw_u[j]="block";
 			coins_u[j]=rst.getString(9);
 			msg_u[j]=rst.getString(4);
			location_u[j]=rst.getString(5);
			rec_from_u[j]=rst.getString(2);
			noti_time_u[j]=rst.getString(11);
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
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;display:<%=veiw_u[0]%>">
			You have received <font color="#3399ff"><%=coins_u[0] %> Bitcoins</font> from <%=rec_from_u[0] %> against the report "<%=msg_u[0] %>" in <%=location_u[0] %> at <%=noti_time_u[0] %>
			</div>
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;display:<%=veiw_u[1]%>">
			You have received <font color="#3399ff"><%=coins_u[1] %> Bitcoins</font> from <%=rec_from_u[1] %> against the report "<%=msg_u[1] %>" in <%=location_u[1] %> at <%=noti_time_u[1] %>
			</div>
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;display:<%=veiw_u[2]%>">
			You have received <font color="#3399ff"><%=coins_u[2] %> Bitcoins</font> from <%=rec_from_u[2] %> against the report "<%=msg_u[2] %>" in <%=location_u[2] %> at <%=noti_time_u[2] %>
			</div>
			<div style="border: 1px solid #e6e6e6;border-radius: 100px;padding: 20px 50px;margin-bottom:10px;display:<%=veiw_u[3]%>">
			You have received <font color="#3399ff"><%=coins_u[3] %> Bitcoins</font> from <%=rec_from_u[3] %> against the report "<%=msg_u[3] %>" in <%=location_u[3] %> at <%=noti_time_u[3] %>
			</div>
		</div>
		<div style="display: <%=display %>;align-items: center;justify-content: center;margin-top:-35px" id="rem">
		<form action="user.jsp" method="post">
		<input type="hidden" name="check" value="<%=username%>">
		<input type="submit" value="" style="background-image: url(icons/cross.svg);background-repeat: no-repeat;background-position: center;cursor: pointer;width: 50px;height: 50px;border:none;border-radius: 50%;background-color:white">
		</form>
		</div> 
		<%
	  	String check=request.getParameter("check"); 
	  	if(check==null){}
	  	else {
		  	String query="UPDATE messages SET view='Seen' WHERE to_user='"+username+"'";
 			st.executeUpdate(query);
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
  <%
  String sql2="SELECT * FROM messages";
  int accepted=0, rejected=0, c=0;
  ResultSet rs2=st.executeQuery(sql2);
  while(rs2.next())
	{
		if(rs2.getString(3).equals(username) && rs2.getString(8).equals("Not Accepted"))
		{
			rejected++;
			c++;
		}
		else if(rs2.getString(3).equals(username) && rs2.getString(8).equals("Accepted"))
		{
			accepted++;
			c++;
		}
		else
			continue;
	}
  %>
  	<div style="height: 90px;width: 230px;background-color: #00cc44;border-radius:60px;margin-top: 3%;margin-left: 20%;position: absolute;color: white;font-family:Calibri;font-weight:bold;font-size:40px; display: flex;align-items: center;justify-content: center;"><%=inr %> &#8377;</div>
  	<span style="margin-top: 11%;margin-left: 24%;position: absolute;font-family: Montserrat">Total Earnings</span>
  	<div style="height: 90px;width: 230px;background-color: orange;border-radius:60px;margin-top: 3%;margin-left: 40%;position: absolute;color: white;font-family:Calibri;font-weight:bold;font-size:40px; display: flex;align-items: center;justify-content: center;"><%=c %></div>
  	<span style="margin-top: 11%;margin-left: 44.5%;position: absolute;font-family: Montserrat">Total Reports</span>
  	<div style="height: 90px;width: 230px;background-color: #ff6699;border-radius:60px;margin-top: 3%;margin-left: 60%;position: absolute;color: white;font-family:Calibri;font-weight:bold;font-size:40px; display: flex;align-items: center;justify-content: center;"><%=accepted %> | <%=rejected %></div>
  	<span style="margin-top: 11%;margin-left: 63%;position: absolute;font-family: Montserrat">Accepted | Rejected</span>
  </div>
</div>
<div id="mybitcoin" class="bitcoin">
  <div class="bitcoin-content">
  	<div style="height: 280px; width: 100%; background-image: url(images/wave.svg);background-size:100% 100%">
  		<span style="top:12%;left: 26%; position: absolute;"><font color="white" size="10" face="Montserrat"><%=wallet %> BTC</font>
  		<img src="icons/qr.png" style="height: 20px; width:20px; filter: invert(100%);margin-left: 90px;cursor: pointer;" onclick="openqr()">
  		<img src="icons/line.png" style="height: 20px; width:20px; filter: invert(100%);margin-left: 10px">
  		<img src="icons/send.svg" style="height: 20px; width:20px; filter: invert(100%);margin-left: 10px;transform: rotate(-45deg);cursor: pointer;">
  		</span>
  	</div>
  	<div style="width: 500px; border: 1px solid #e6e6e6;margin-left: 40px;border-radius: 20px;font-family: Montserrat">
  		<label style="margin-left: 15px;">Conversion</label><hr>
  		<table cellpadding="13">
  			<tr><td><img src="icons/etherium.png" style="height: 30px;width: 30px"></td><td>ETH</td><td style="width: 350px;text-align: right"><%=etherium %></td></tr>
  			<tr><td><img src="icons/dollar.png" style="height: 30px;width: 30px"></td><td>DOLLAR</td><td style="width: 350px;text-align: right"><%=dollar %></td></tr>
  			<tr><td><img src="icons/euro.png" style="height: 30px;width: 30px"></td><td>EURO</td><td style="width: 350px;text-align: right"><%=euro %></td></tr>
  			<tr><td><img src="icons/rupee.png" style="height: 30px;width: 30px"></td><td>INR</td><td style="width: 350px;text-align: right"><%=inr %></td></tr>
  		</table>
  	</div>
  	<hr style="width: 0; height: 200px; margin-left: 45%; top: 55%;position: absolute; color: #e6e6e6;">
  	<div id="hidd" style="left: 47%;top: 55%;position: absolute;height:40%;width:45%;text-align:center;display: flex;align-items: center;justify-content: center;"><font color="#e6e6e6" size="6" face="Montserrat">No recent activity</font></div>
	<div id="didd" style="left: 62%;top: 95%;position: absolute;display:none"><button style="width:170px;height:40px;border-radius:50px;border:1px solid #e6e6e6;background-color:white;cursor:pointer">+ More Results</button></div>  
  </div>
  	<%
  	ResultSet rs1=st.executeQuery(sql2);
  	String[] reward=new String[4];
  	String[] sender=new String[4];
  	for(int i=0;i<4;i++)
  	{
  		sender[i]="";
  		reward[i]="";
  	}
  	int count=0;
  	while(rs1.next())
	{
  		if(count<4)
  		{
			if(rs1.getString(3).equals(username) && rs1.getString(8).equals("Accepted"))
			{
				reward[count]="+"+rs1.getString(9);
				sender[count]="Received from "+rs1.getString(2);
				count++;
				%>
				<script>document.getElementById("hidd").style.display = "none";</script>
				<%
			}
			else
				continue;
  		}
  		else
  		{
  			%>
			<script>document.getElementById("didd").style.display = "block";</script>
			<%
  		}
	}
  	%>
	<div style="left: 47%;top: 55%;position: absolute;height:30%;width:45%;font-family: Montserrat">
	<table cellpadding="13">
	<tr><td style="width:500px"><%=sender[0] %></td><td style="width: 350px;text-align: right"><%=reward[0] %></td></tr>
	<tr><td style="width:500px"><%=sender[1] %></td><td style="width: 350px;text-align: right"><%=reward[1] %></td></tr>
	<tr><td style="width:500px"><%=sender[2] %></td><td style="width: 350px;text-align: right"><%=reward[2] %></td></tr>
	<tr><td style="width:500px"><%=sender[3] %></td><td style="width: 350px;text-align: right"><%=reward[3] %></td></tr>
	</table>
	</div>
</div>
<div id="myuser_set" class="user_set">
  <div class="user_set-content">
  	<div style="margin-top: 20px">
  		<fieldset style="border-bottom: none;border-right: none;border-left: none;border-top: 2px solid #e6e6e6">
		<legend style="border-radius: 50px;height: 35px;width: 350px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white"><b>PERSONAL INFORMATION</b></legend>
		<form style="font-family:Montserrat;text-align: left;margin-left: 30%" action="user.jsp" method="post">
			FIRST NAME: <input type="text" name="up_fname" class="set" style="margin-left: 105px" required><br><br>
			LAST NAME: <input type="text" name="up_lname" class="set" style="margin-left: 110px" required><br><br>
			PHONE: <input type="number" name="up_phone" class="set" style="margin-left: 143px;-moz-appearance: textfield;" required><br><br>
			LOCATION: <textarea name="up_addr" class="set" style="margin-left: 118px;border-bottom-right-radius: 0" required></textarea><br><br>
			PINCODE: <input type="number" name="up_pincode" class="set" style="margin-left: 125px;-moz-appearance: textfield;" required>
			<input type="submit" name="up_submit" value="SUBMIT" style="margin-top: -8%;position: absolute;margin-left: 100px;" class="hov">
		</form>
		</fieldset>
  	</div>
  	<%
  	String up_fname=request.getParameter("up_fname");
  	String up_lname=request.getParameter("up_lname");
  	String up_phone=request.getParameter("up_phone");
  	String up_location=request.getParameter("up_addr");
  	String up_pincode=request.getParameter("up_pincode");
  	if(up_fname==null && up_lname==null && up_phone==null && up_location==null && up_pincode==null){}
  	else {
  		%> 
   	   <script>document.getElementById("myuser_set").style.width = "100%";</script>
   	   <%
  	   String update1="UPDATE user SET fname='"+up_fname+"',lname='"+up_lname+"',phone='"+up_phone+"',location='"+up_location+"',pincode='"+up_pincode+"' WHERE uname='"+username+"'";
  	   st.executeUpdate(update1);
  	}
  	%>
  	<div>
  		<fieldset style="border-bottom: none;border-right: none;border-left: none;border-top: 2px solid #e6e6e6">
		<legend style="border-radius: 50px;height: 35px;width: 350px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white"><b>LOGIN INFORMATION</b></legend>
		<form style="font-family:Montserrat;text-align: left;margin-left: 30%" action="user.jsp" method="post">
			EMAIL: <input type="email" name="up_email" class="set" style="margin-left: 150px"><br><br>
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
  	   String update2="UPDATE user SET email='"+up_email+"',pass='"+up_password+"' WHERE uname='"+username+"'";
  	   st.executeUpdate(update2);
  	}
  	%>
  	<div>
  		<fieldset style="border-bottom: none;border-right: none;border-left: none;border-top: 2px solid #e6e6e6">
		<legend style="border-radius: 50px;height: 35px;width: 350px;padding-top: 10px;font-family: Agency FB;letter-spacing: 0.2em;font-size:20px;background-color: #1b7fbd;color: white"><b>WALLET INFORMATION</b></legend>
		<form style="font-family:Montserrat;text-align: left;margin-left: 30%" action="user.jsp" method="post">
			<br>BITCOIN ADDRESS: <input type="text" name="up_baddr" class="set">
			<input type="submit" name="submit" value="SUBMIT" style="position: absolute;margin-left: 100px" class="hov">
		</form>
		</fieldset>
	</div>
	<%
	String up_bitcoin=request.getParameter("up_baddr");
  	if(up_bitcoin==null){}
  	else {
  		%> 
    	   <script>document.getElementById("myuser_set").style.width = "100%";</script>
    	   <%
  	   String update3="UPDATE user SET bitcoin='"+up_bitcoin+"' WHERE uname='"+username+"'";
  	   st.executeUpdate(update3);
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
function submit_info() {
	document.getElementById("form_info").submit(); 
}
function submit_loc() {
	document.getElementById("myForm").submit(); 
}
function submit_des() {
	document.getElementById("form_des").submit(); 
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
function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition);
		} else {}
}
function showPosition(position) {
	var lat=position.coords.latitude;
	var longi=position.coords.longitude;
	map = new OpenLayers.Map("mapdiv");
	map.addLayer(new OpenLayers.Layer.OSM());
	var lonLat = new OpenLayers.LonLat( longi, lat ).transform(new OpenLayers.Projection("EPSG:4326"),map.getProjectionObject());
	var zoom=15;
	var markers = new OpenLayers.Layer.Markers( "Markers" );
	map.addLayer(markers);
	markers.addMarker(new OpenLayers.Marker(lonLat));
	map.setCenter (lonLat, zoom);
	document.getElementsByClassName('olControlAttribution')[0].style.display='none'
	document.getElementById("latitude").value=lat;
	document.getElementById("longitude").value=longi;
}

var selDiv = "";
document.addEventListener("DOMContentLoaded", init, false);
function init() {
	document.querySelector('#upload').addEventListener('change', handleFileSelect, false);
	selDiv = document.querySelector("#selectedFiles");
}
function handleFileSelect(e) {		
	if(!e.target.files) return;		
	selDiv.innerHTML = "";		
	var files = e.target.files;
	for(var i=0; i<files.length; i++) {
		var f = files[i];		
		selDiv.innerHTML +="&#9670;&nbsp;" + f.name + "<br/>";
		}			
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