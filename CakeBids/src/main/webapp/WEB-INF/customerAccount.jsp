<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Customer Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<jsp:include page="bootstraphead.jsp" />
<main class="container-fluid">
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>

	<c:choose>
		<c:when test="${empty loggedIn.bakery }">
			<form action="searchKeyword.do" method="GET">
				<h4>Search Bakeries:</h4>
				<input class="form-control" type="text" name="id" /> <input
					class="btn btn-secondary" type="submit" value="Search" />
			</form>

			<form action="showBakeries.do" method="GET">
				<input class="btn btn-primary" type="submit" value="Show Bakeries" />
			</form>
			
			<form action="createCake.do" method="GET">
		<input class="btn btn-primary" type="submit" value="Order a Cake!"/> 
	        </form>
          
			<form action="showOrders.do" method="POST">
				<input class="btn btn-primary" type="submit" value="My Orders" />
			</form>

			<form action="accountUpdate.do" method="POST">
				<input class="btn btn-primary" type="submit"
					value="Update My Account" />
			</form>

			<form action="logout.do" method="GET">
				<input class="btn btn-primary" type="submit" value="Logout" />
			</form>

			<form action="accountDeactivated.do" method="POST">
				<h4>Delete Account:</h4>
				<input class="btn btn-warning" type="submit" value="delete" />
			</form>
		</c:when>

		<c:when test="${not empty loggedIn.bakery }">
			<!-- display bakery stuff -->

<table class="table table-hover table-md thead-dark tbody-grey table-striped">
         
           <thead>
            <tr>
      
               <th scope="col">Customer First Name</th>
              <th scope="col">Customer Last Name</th>
              <th scope="col">Customer Phone</th>
               <th scope="col">Customer Occasion</th>
              <th scope="col">Cake Type</th>                           
              <th scope="col">Cake Flavor</th>                           
              <th scope="col">Cake Filling</th>                           
              <th scope="col">Delivery Method</th>                           
              <th scope="col">Budget</th>                           
              <th scope="col">Date needed</th>                           
              <th scope="col">Special Instructions</th>                           
            </tr>
          </thead>
        
          <tbody>
        <c:forEach var="order" items="${loggedIn.bakery.cakeBids}">
            <tr>
              <th>${order.cake.occasion.user.firstName}</th>
              <td>${order.cake.occasion.user.lastName}</td>
              <td>${order.cake.occasion.user.address.phone}</td>
              <td>${order.cake.occasion.name}</td>
              <td>${order.cake.cakeType.name}</td>
              <c:forEach var="flavor" items="${order.cake.flavors}">
              <td>${flavor.name}</td>
              </c:forEach>
			  <c:forEach var="filling" items="${order.cake.fillings}">
              <td>${filling.fillingType}</td>
              </c:forEach>               
              <td>${order.cake.budget}</td>
              <td>${order.cake.dateAdded}</td>
              <td>${order.cake.specialInstructions}</td>
              
              
            </tr>
        </c:forEach>
          </tbody>
        
        </table> 

			<form action="reviews.do" method="GET">
				<input class="form-control" type="number" name="id" /> <input
					class="btn btn-light" type="submit" value="All Bakery Reviews" />
			</form>

			<form action="logout.do" method="GET">
				<input class="btn btn-light" type="submit" value="Logout" />
			</form>
			<form action="bakeryAccountUpdate.do" method="POST">
				<input class="btn btn-light" type="submit"
					value="Update My Account" />
			</form>
			<form action="accountDeactivated.do" method="POST">
				<h4>Delete Account:</h4>
				<input class="btn btn-info" type="submit" value="delete" />
			</form>
		</c:when>



	</c:choose>
	<jsp:include page="bootstrapfoot.jsp" />
</body>
</main>
</html>