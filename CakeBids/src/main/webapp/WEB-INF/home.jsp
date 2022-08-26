<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
/* body{
background-image: url(https://i.pinimg.com/236x/79/5f/55/795f5555fb2cac60a976f2f9ea22ca80.jpg);
background-repeat: no-repeat;
/* background-size: cover; */
/* background-position: center;
object-fit: cover;
} */ 
body { 
  background: linear-gradient(to top, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://findyourcakeinspiration.com/wp-content/uploads/2020/02/Drama-Romance-Wedding-Cake-808x1024.png) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}


</style>


<meta charset="UTF-8">
<title>CakeBids Homepage</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<jsp:include page="bootstraphead.jsp" />
<jsp:include page="navbar.jsp"></jsp:include>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
<main class="container-fluid">

	<h1>Cake Network</h1>
	<div id="tagline">
	<p> Search. Order. Enjoy.<p>
	</div>
	<form action="login.do">
		<input class="btn btn-dark" id="loginbtn" type="submit" value="Login" />
	</form>

	<form action="createAccount.do" method="GET">
		<input class="btn btn-dark" id="createAccountBtn" type="submit"
			value="Create Customer Account" />
	</form>
	<form action="searchKeyword.do" method="GET">
		 <div class="input-group">
  <input type="text" name="keyword" class="form-control rounded"  aria-label="Search" aria-describedby="search-addon" />
  <button type="submit" class="btn btn-outline-secondary">Search</button>
</div>
	</form>
	<form action="createBakeryAccount.do" method="GET">
		<input class="btn btn-dark" id="createBaccount" type="submit"
			value="Create Bakery Account" />
	</form>

	<div id="developers">
	<p>Developed and Designed by: Kenneth Pederson | Chad Rousseau | Samantha Heisterkamp</p>
	</div>
		
	<br>

  <jsp:include page="bootstrapfoot.jsp" />
      </main> 
</body>
</html>