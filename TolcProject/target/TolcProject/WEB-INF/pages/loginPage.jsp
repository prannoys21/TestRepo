<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<style>
body{
  font-family: 'Open Sans', sans-serif;
  background:#3498db;
  margin: 0 auto 0 auto;  
  width:100%; 
  text-align:center;
  margin: 20px 0px 20px 0px;   
  background-image: url("https://www.clipartsgram.com/image/1116146294-login-page-background-image-112.jpg");
}

p{
  font-size:12px;
  text-decoration: none;
  color:#ffffff;
}

h1{
  font-size:1.5em;
  color:#525252;
}

.box{
  background:white;
  width:650px;
  height: 450px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 70px 0px;
  border: #2980b9 4px solid; 
}

.email{
  background:#ecf0f1;
  border: #ccc 1px solid;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:#AAAAAA;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
}

.password{
  border-radius:4px;
  background:#ecf0f1;
  border: #ccc 1px solid;
  padding: 8px;
  width:250px;
  font-size:1em;
}

.btn{
  background:#2ecc71;
  width:125px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27ae60 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  float:left;
  margin-left:16px;
  font-weight:800;
  font-size:0.8em;
}

.btn:hover{
  background:#2CC06B; 
}

a{
text-decoration: none;
}

#btn2{
  float:left;
  background:#3498db;
  width:125px;  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #2980b9 1px solid;
  
  margin-top:20px;
  margin-bottom:20px;
  margin-left:10px;
  font-weight:800;
  font-size:0.8em;
}
.error {
    font-size: 12px;
    color: red;
}
#btn2:hover{ 
background:#3594D2; 
}
</style>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>

<form:form action="loginPage" modelAttribute="employee" method="post" >
<div class="box">
<h1>WeLearn</h1>
<h1>Login</h1>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
Username: <input type="text" name="userName" value="" class="email" />
<br>
<form:errors path="userName" cssClass="error" />
<br>
Passowrd: <input type="password" name="password" value="" class="email" />
<br>
<form:errors path="password" cssClass="error" />
<br>


<div style = "margin-left:200px">
<input class="btn" type="submit" value="Sign In"/>
<div id="btn2"><a href="newEmployee">Sign Up</a></div> <!-- End Btn2 --> 
  </div>
</div> <!-- End Box -->

<%--  <form:errors path="loginError" cssClass="error" /> --%>
</form:form>


  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>

</body>
</html>
