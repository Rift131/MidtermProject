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
	<jsp:include page="bootstraphead.jsp" />
<link rel="stylesheet" href="css/styles.css">

<style>
body {
	background: linear-gradient(to top, rgba(0, 0, 0, 0.7),
		rgba(0, 0, 0, 0.7)), url(img/841B1728-7A97-4F4E-8C13-CE53CAB0F916.JPG)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
	</head>
	<body>
	
<main class="container-fluid">
	
		
		<c:choose>
			<c:when test="${empty loggedIn.bakery }">
				<form action="searchKeyword.do" method="GET">
					<div class="input-group">
						<input type="text" name="keyword" class="form-control rounded"
							placeholder="Search" aria-label="Search"
							aria-describedby="search-addon" />
						<button type="submit" class="btn btn-outline-dark">Search</button>
					</div>
				</form>

				<form action="showBakeries.do" method="GET">
					<input class="btn btn-dark" id="showB" type="submit" value="Show Bakeries"  />
				</form>
				<form action="createCake.do" method="GET">
					<input class="btn btn-dark" id="createC" type="submit" value="Order a Cake!"  />
				</form>
				<form action="accountUpdate.do" method="POST">
					<input class="btn btn-dark" type="submit" value="Update My Account" id="updateB" />
				</form>
				<form action="logout.do" method="GET">
					<input class="btn btn-dark" type="submit" value="Logout" id="logoutB" />
				</form>
				<form action="accountDeactivated.do" method="POST">
					
					<input class="delete" type="submit" value="Delete Account" />
				</form>

				<table
					class="table">

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
						<c:forEach var="occasion" items="${loggedIn.occasions}">
							<c:forEach var="cake" items="${occasion.cakes}">
								<tr>
									<td>${cake.occasion.user.firstName}</td>
									<td>${cake.occasion.user.address.phone}</td>
									<td>${cake.occasion.user.lastName}</td>
									<td>${cake.occasion.name}</td>
									<td>${cake.cakeType.name}</td>
									<td><c:forEach var="flavor" items="${cake.flavors}">
											<li>${flavor.name}</li>
										</c:forEach></td>
									<td><c:forEach var="filling" items="${cake.fillings}">
											<li>${filling.fillingType}</li>
										</c:forEach></td>
									<td>${cake.deliveryMethods.deliveryType}</td>
									<td>${cake.budget}</td>
									<td>${cake.neededByDate}</td>
									<td>${cake.specialInstructions}</td>


								</tr>
							</c:forEach>
						</c:forEach>
					</tbody>

				</table>
			</c:when>

			<c:when test="${not empty loggedIn.bakery }">
				<!-- display bakery stuff -->

				<table
					class="table table-hover table-md thead-dark tbody-grey ">

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
								<td>${order.cake.occasion.user.firstName}</td>
								<td>${order.cake.occasion.user.lastName}</td>
								<td>${order.cake.occasion.user.address.phone}</td>
								<td>${order.cake.occasion.name}</td>
								<td>${order.cake.cakeType.name}</td>
								<td><c:forEach var="flavor" items="${order.cake.flavors}">
										<li>${flavor.name}</li>
									</c:forEach></td>
								<td><c:forEach var="filling" items="${order.cake.fillings}">
										<li>${filling.fillingType}</li>
									</c:forEach></td>
								<td>${order.cake.deliveryMethods.deliveryType}</td>
								<td>${order.cake.budget}</td>
								<td>${order.cake.neededByDate}</td>
								<td>${order.cake.specialInstructions}</td>


							</tr>
						</c:forEach>
					</tbody>

				</table>

				

				<form action="logout.do" method="GET">
					<input class="btn btn-dark" type="submit" value="Logout" id="logoutB" />
				</form>
				<form action="bakeryAccountUpdate.do" method="POST">
					<input class="btn btn-dark" type="submit" value="Update My Account" id="updateB"/>
				</form>
				<form action="accountDeactivated.do" method="POST">
				
					<input class="delete" type="submit" value="Delete Account" />
				</form>
			</c:when>



		</c:choose>
		
		</main>
	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="bootstrapfoot.jsp" />
	</body>

</html>