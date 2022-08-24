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
	<form action="cakeCreated.do" method="GET">
		    <br>
		    <h4><label for="name">Name your cake  <input type="text" id="name" name="name"></label></h4>
			<br>
			<h4><label for="description">Describe your vision for this cake  <input type="text" id="description" name="description"></label></h4> 
			<br>
			  <h4><label for="cakeInspiration">URL for example picture of your cake  <input type="text" id="name" name="cakeInspiration"></label></h4>
			<br>
			<br>
			 <label for="occasion.name">Describe the occasion for this cake</label>
			<input type="text" id="occasionName" name="occasion.name"/>
			<input type="text" id="occasionStreet" name="occasion.address.address"/>
			<input type="text" id="occasionStreet2" name="occasion.address.address2"/>
			<input type="text" id="occasionCity" name="occasion.address.city"/>
			<input type="text" id="ioccasionState" name="occasion.address.state"/>
			<input type="text" id="occasionZip" name="occasion.address.zip"/>
			<input type="text" id="occasionPhone" name="occasion.address.phone"/>
			<br>
			<br>
			<label for="cakeType.id">Select the type of cake you would like</label>
			<select name="cakeType.id">
			<c:forEach items="${cakeTypes}" var="cakeType">
			<option value="${cakeType.id}">${cakeType.name}</option>
			</c:forEach>
			</select>
			<br>
			<br>
			<label for="flavor.id">Select your flavor</label> <!-- label for matches the select name -->
			<select name="flavor.id"> <!-- path to get to each flavor through its primary key -->
			<c:forEach items="${flavors}" var="flavor"> <!-- flavors is the controller calls this element. Flavor is the name of the ENTITY, lowercase first letter -->
			<option value="${flavor.id}">${flavor.name}</option> <!-- value is the primary key, after that is the path to the value in the table you want to appear -->
			</c:forEach>
			</select>
			<br>
			<br>
			<label for="filling.id">What filling would you like?</label>
			<select name="filling.id">
			<c:forEach items="${fillings}" var="filling">
			<option value="${filling.id}">${filling.fillingType}</option>
			</c:forEach>
			</select>
			<br>
		    <br>
		    <label for="bakeryId">Choose your favorite bakery</label>
		    <select name="bakeryId">
			<c:forEach items="${bakeries}" var="bakery">
			<option value="${bakery.id}">${bakery.name}</option>
			</c:forEach>
			</select> 
			<br>
			<br>
		    <label for="deliveryMethod.id">Choose your delivery method</label>
		    <select name="deliveryMethods.id">
			<c:forEach items="${deliveryMethods}" var="deliveryMethod">
			<option value="${deliveryMethod.id}">${deliveryMethod.deliveryType}</option>
			</c:forEach>
			</select>
			<br>
		    <br>
		    <h4><label for="budget">What is your budget for this cake?  <input type="number" id="cakeBudget" name="cakeBudget"></label></h4>  
			<br>
			
			<!-- This is a departure from original design. Repurposing "date_added" column for required date -->	
		    <h4><label for="neededByDate">What day would you like your cake to be ready by?</label></h4> 
		    <input type="date" id="dateAdded" name="neededByDate"> 
			<br>
			
			<h4><label for="specialInstructions">Do you have any special instructions?</label></h4> 
			<input type="text" id="specialInstructions" name="specialInstructions">
			<br>
		   
		    
		    <!-- Not utilizing the cakeimages field intentionally -->
		    
		    <!-- Attempting to route through foreign keys -->
		    <h4><label for="userContact">Your contact information</label></h4> 
		    <label for="firstName">First Name</label>
		    <input type="text" name="occasion.user.firstName" value="${loggedIn.firstName}"/>
		    <label for="lastName">Last Name</label>
		    <input type="text" name="occasion.user.lastName" value="${loggedIn.lastName}"/>
		    <label for="phone">Phone</label>
		    <input type="text" name="occasion.user.address.phone" value="${loggedIn.address.phone}"/>
		    <br>
		    <input class="btn btn-success" type="submit" value="Submit Your Order!">
	
			<input type="hidden" name="addressId" value="${loggedIn.address.id }">
	</form> 

</body>
</html>