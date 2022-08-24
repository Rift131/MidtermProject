<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Customer Account</title>
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

			<form action="reviews.do" method="GET">
				<input class="form-control" type="number" name="id" /> <input
					class="btn btn-primary" type="submit" value="All Bakery Reviews" />
			</form>

			<form action="logout.do" method="GET">
				<input class="btn btn-primary" type="submit" value="Logout" />
			</form>
			<form action="bakeryAccountUpdate.do" method="POST">
				<input class="btn btn-primary" type="submit"
					value="Update My Account" />
			</form>
			<form action="accountDeactivated.do" method="POST">
				<h4>Delete Account:</h4>
				<input class="btn btn-warning" type="submit" value="delete" />
			</form>
		</c:when>



	</c:choose>
</body>
</html>