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
			<form action="results.do" method="GET">
				<h4>Search Bakeries:</h4>
				<input class="form-control" type="number" name="id" /> <input
					class="btn btn-primary" type="submit" value="Search" />
			</form>

			<form action="showBakeries.do" method="GET">
				<input class="btn btn-primary" type="submit" value="Show Bakeries" />
			</form>
			
			<form action="createCake.do" method="GET">
		<input class="btn btn-primary" type="submit" value="Order a Cake!"/> 
	        </form>
                      
                      <!-- STRETCH GOALS -->
                      
			<!-- <form action="cakeBid.do" method="GET">
				<input class="btn btn-primary" type="submit"
					value="Create Cake Request" />
			</form>
			<form action="openCakeRequests.do" method="GET">
				<input class="btn btn-primary" type="submit"
					value="My Open Cake Requests" />
			</form> -->
			<form action="showCustomerReviews.do" method="POST">
				<input class="btn btn-primary" type="submit" value="My Reviews" />
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
        <c:forEach var="bakery" items="${cake}">
            <tr>
              <th>${user.firstName}</th>
              <td>${user.lastName}</td>
              <td>${user.address.phone}</td>
              <td>${occasion.name}</td>
              <td>${cake.cakeType.name}</td>
              <td>${cake.flavor.name}</td>
              <td>${cake.filling.fillingType}</td>
              <td>${cake.budget}</td>
              <td>${cake.dateAdded}</td>
              <td>${cake.specialInstructions}</td>
              
              
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