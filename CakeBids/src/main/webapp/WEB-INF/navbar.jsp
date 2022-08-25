<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="css/styles.css">

<div id="nav">
 
<h5>
	<a href="home.do" style="color: #556b2f">Home</a> | <a href="showBakeries.do">Bakeries</a> | <a
		href="reviews.do">Reviews</a>  
		<c:if test="${not empty sessionScope.loggedIn }">|
		<a href="customerAccount.do">Account</a>
		</c:if>
</h5>


</div>
