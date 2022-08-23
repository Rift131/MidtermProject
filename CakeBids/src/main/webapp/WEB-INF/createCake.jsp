<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Cake Order Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!--  CSS FILES AFTER BOOTSRAP-->
<link rel="stylsheet" href="css/cakeForm.css">
 <jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>

	<h3>Cake Order Form</h3>
	<form action="createCake.do" method="GET">
		
		    <h4><label for="name">Name your cake</label></h4>
			<input type="text" id="name" name="Cakename">
			<br>
			
			<h4><label for="description">Describe your vision for this cake</label></h4> 
			<input type="text" id="description" name="cakeDescription">
			<br>
			
			<select name="occasion.name">
			<c:forEach items="${listOccasion}" var="occasion.name">
			<option value="${occasion.id}">${occasion.name}</option>
			</c:forEach>
			</select>
			<br>
			
			<select name="cakeType.name">
			<c:forEach items="${listCakeType}" var="cakeType.name">
			<option value="${cakeType.id}">${cakeType.name}</option>
			</c:forEach>
			</select>
			<br>
			
			<select name="flavors.name">
			<c:forEach items="${listFlavor}" var="flavors.name">
			<option value="${flavor.id}">${flavor.name}</option>
			</c:forEach>
			</select>
			<br>
			
			<select name="fillings.fillingType">
			<c:forEach items="${listFillings}" var="filling.fillingType">
			<option value="${fillings.id}">${fillings.fillingType}</option>
			</c:forEach>
			</select>
			<br>
		
		    <h4><label for="budget">What is your budget for this cake?</label></h4>  
			<input type="number" id="cakeBudget" name="cakeBudget">
			<br>
		
		    <select name="cakeBid.bakery.name">
			<c:forEach items="${listBakery}" var="cakeBid.bakery.name">
			<option value="${bakery.id}">${bakery.name}</option>
			</c:forEach>
			</select>
			<br>
			
			<!-- This is a departure from original design. Repurposing "date_added" column for required date -->	
		    <h4><label for="dateAdded">What day would you like your cake to be ready by?</label></h4> 
		    <input type="date" id="dateAdded" name="dateNeededBy" value="2022-08-26" min="2022-01-01" max="2122-12-31"> 
			<br>
			
			<h4><label for="specialInstructions">Do you have any special instructions?</label></h4> 
			<input type="text" id="specialInstructions" name="specialInstructions">
			<br>
		   
		    <select name="deliveryMethod.deliveryType">
			<c:forEach items="${listDeliveryMethod}" var="cakeBid.bakery.name">
			<option value="${deliveryMethod.id}">${deliveryMethod.deliveryType}</option>
			</c:forEach>
			</select>
			<br>
		    
		    <!-- Not utilizing the cakeimages field intentionally -->
		    
		    <!-- Attempting to route through foreign keys -->
		    <h4><label for="occasion.userId.user">Your contact information</label></h4> 
		    <label for="firstName">${occasion.userId.user.firstName } </label><br>
		    <label for="lastName">${occasion.userId.user.lastName } </label><br>
		    <label for="phoneNumber">${occasion.userId.user.addressId.address.phone }</label> <br>
		    <br>
		    
		<input class="btn btn-success" type="submit" value="Create Account">
	
	</form>

	
    






</body>
</html>