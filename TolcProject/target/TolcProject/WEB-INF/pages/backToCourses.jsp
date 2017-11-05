<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<style>
a {
color: #2b8cbe;
}
.aclass{
    background: #2ecc71;
    padding: 6px;
    color: white;
    border-radius: 5px;
    border: #27ae60 1px solid;
    float: left;
    font-weight: 800;
    font-size: 0.8em;
    text-decoration: none;
    margin: 130px 0px 0px -207px;
}
</style>
<title></title>
</head>

<body>
<a class="aclass" href="http://localhost:7080/TolcProject/courseList?id=${employee.id}">Go back to courses list page</a><!-- End Btn2 -->
</body>
</html>