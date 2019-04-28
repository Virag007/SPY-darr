<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="refresh" content="4;url=login.jsp" />
<title>SPY-darr</title>
<style type="text/css">
	#logo
	{
		margin-left:22%;
		transform: translateY(62%);
	}
	#anim
	{
		margin-left:48%;
		animation: beat 2.5s infinite;
		transform-origin: center; 
		position: absolute;
	}
	@keyframes beat
	{
		0% {transform: scale(1.2, 1.2);}
		16% {transform: scale(1.1, 1.1);}
		33% {transform: scale(1.2, 1.2);}
		49% {transform: scale(1.1, 1.1);}
		100% {transform: scale(1.2, 1.2);}
	}
</style>
</head>
<body>
<div id="logo">
	<img src="icons/spydar.jpg"/>
</div>
<div id="anim">
<img src="images/spydarr.png"/>
</div>
</body>
</html>