<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Bakeries</title>
</head>
<body>
<h5>Showing bakeries here..... maybe.</h5> 






 <table class="table table-hover table-md thead-dark tbody-grey table-striped">
         
           <thead>
            <tr>
      
               <th scope="col">Business Name</th>
              <th scope="col">Website</th>
              <th scope="col">Hours</th>
              <th scope="col">City</th>  
              <th scope="col">State</th>                           
            </tr>
          </thead>
        
          <tbody>
        <c:forEach var="bakery" items="${bakery}">
            <tr>
              <th>${bakery.name}</th>
              <td>${bakery.websiteUrl}</td>
              <td>${bakery.hoursOfOperation}</td>
              <td>${bakery.owner.address.city}</td>
              <td>${bakery.owner.address.state}</td>
              
              
            </tr>
        </c:forEach>
          </tbody>
        
        </table> 
</body>
</html>