<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>

	<div align="center">
        
       <form:form action="validateUser" method="post">  
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			Username:<input type="text" name="userName"/><br/><br/>  
			Password:<input type="password" name="password"/><br/><br/>  
			<input type="submit" value="login"/>
		</form:form>  
        
    </div>
    </body>
    </html>