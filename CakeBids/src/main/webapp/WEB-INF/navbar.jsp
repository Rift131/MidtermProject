<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="css/styles.css">

<div id="nav">
 
<h5 id="navhead">
	<a href="home.do" style="color: lightgray">Home</a> | <a href="showBakeries.do" style="color: lightgray">Bakeries</a> 
		<c:if test="${not empty sessionScope.loggedIn }">|
		<a href="customerAccount.do" style="color: lightgray">Account</a>
		</c:if>
</h5>


</div>
