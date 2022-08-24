<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Bakeries</title><link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<jsp:include page="bootstraphead.jsp" />
<jsp:include page="navbar.jsp"></jsp:include>
</head>
<body>
<main class="container-fluid">





 <table class="table table-hover table-md thead-dark tbody-grey table-striped">
         
           <thead>
            <tr>
      
               <th scope="col">Business Name</th>
              <th scope="col">Website</th>
              <th scope="col">Hours</th>
               <th scope="col">Street</th>
                <th scope="col">Unit</th>
              <th scope="col">City</th>  
              <th scope="col">State</th>
              <th scope="col">Phone</th>  
                                   
            </tr>
          </thead>
        
          <tbody>
        <c:forEach var="bakery" items="${bakery}">
            <tr>
              <th><a href="bakeryStorefront.do?bakeryId=${bakery.id }" >${bakery.name }</a></th>
              <td>${bakery.websiteUrl}</td>
              <td>${bakery.hoursOfOperation}</td>
              <td>${bakery.owner.address.address}</td>
              <td>${bakery.owner.address.address2}</td>
              <td>${bakery.owner.address.city}</td>
              <td>${bakery.owner.address.state}</td>
              <td>${bakery.owner.address.phone}</td>
              
            </tr>
        </c:forEach>
          </tbody>
        
        </table> 
        <jsp:include page="bootstrapfoot.jsp" />
      </main> 
</body>
</html>