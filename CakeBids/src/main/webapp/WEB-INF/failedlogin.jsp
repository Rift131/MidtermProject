<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/styles.css">
<meta charset="UTF-8">
<title>failedlogin</title>
<style>
body {
	background: linear-gradient(to top, rgba(0, 0, 0, 0.8),
		rgba(0, 0, 0, 0.8)), url(img/IMG_1596.PNG)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>
<body>
	<h1>Login Failed</h1>
	<form action="login.do">
		<input class="btn btn-primary" type="submit" value="Login" />
	</form>




</body>
</html>