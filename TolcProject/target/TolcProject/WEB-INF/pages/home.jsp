<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Management Screen</title>
</head>
<body>
	<div align="center">
		<h1>Employee List</h1>
		
		<table border="1">


			<c:forEach var="employee" items="${listEmployee}">
				<tr>

					<td>${employee.firstName}</td>
					<td>${employee.surName}</td>
					<td>${employee.email}</td>
					<td>${employee.mobileNumber}</td>
					<td>${employee.userName}</td>
					<td><a href="editEmployee?id=${employee.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="deleteEmployee?id=${employee.id}">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
		<h4>
			New Employee Register <a href="newEmployee">here</a>
		</h4>
		<h4>
			Existing Users login below <a href="loginPage">here</a>
		</h4>
		<h4>
			if you wanna chat, click <a href="chatAndLearn">here</a>
		</h4>
		
	</div>
	

</body>
</html>