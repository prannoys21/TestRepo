<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta charset="utf-8">
<title>Schemas Tutorial</title>
<meta name="Description" content="Data Structures and Algorithms (DSA) Tutorial for Beginners - Learn Data Structures and Algorithm using c, C++ and Java in simple and easy steps starting from basic to advanced concepts with examples including Overview, Environment Setup, Algorithm, Asymptotic Analysis, Greedy Algorithms, Divide and Conquer, Dynamic Programming, Data Structures, Array, Linked List, Doubly Linked List, Circular List, Stack, Parsing Expression, Queue, Priority queue, Linear, Binary, Interpolation Search, Tree, Tree Traversal, Binary Search Tree, B+, AVL, Spanning, Tower of Hanoi, Hash Table, Heap, Graph, Depth, Breadth First Traversal, Search techniques, Sorting techniques, Sorting Algorithm, Bubble, Merge Sort Algorithm, Insertion, Selection, Shell, Quick Sort, Recursion, Fibonacci Series." />
<meta name="Keywords" content="Overview, Environment Setup, Algorithm, Asymptotic Analysis, Greedy Algorithms, Divide and Conquer, Dynamic Programming, Data Structures, Array, Linked List, Doubly Linked List, Circular List, Stack, Parsing Expression, Queue, Priority queue, Linear, Binary, Interpolation Search, Tree, Tree Traversal, Binary Search Tree, B+, AVL, Spanning, Tower of Hanoi, Hash Table, Heap, Graph, Depth, Breadth First Traversal, Search techniques, Sorting techniques, Sorting Algorithm, Bubble, Merge Sort Algorithm, Insertion, Selection, Shell, Quick Sort, Recursion, Fibonacci Series." />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes">
<meta property="og:locale" content="en_US" />
<meta property="og:type" content="website" />
<meta property="fb:app_id" content="471319149685276" />
<meta property="og:site_name" content="www.tutorialspoint.com" />
<meta name="robots" content="index, follow"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="author" content="tutorialspoint.com">
<script type="text/javascript" src="https://www.tutorialspoint.com/theme/js/script-min-v4.js"></script>
<!-- <link rel="stylesheet" href="https://www.tutorialspoint.com/theme/css/style-min.css"> -->
<!-- Head Libs -->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="/theme/css/ie8.css">
<![endif]-->
<style>
pre.prettyprint.tryit {min-height:37px; background: #eee url(data_structures_algorithms/images/try-it.jpg) top right no-repeat !important}select{ border:0 !important; outline: 1px inset black !important; outline-offset: -1px !important; }
ul.nav-list.primary>li a.videolink{    background: none; margin: 0px; padding: 0px; border: 1px solid #d6d6d6;}
div.feature-box div.feature-box-icon, .col-md-3 .course-box, li.heading, div.footer-copyright { background: #cd3300 url(/images/pattern.png) repeat center center !important;}
.sub-main-menu .sub-menuu div:hover, .sub-main-menu .viewall, header nav ul.nav-main li a:hover, button.btn-responsive-nav, header div.search button.btn-default { background: #cd3300 !important;}
.submenu-item{ border-bottom: 2px solid #cd3300 !important; border-top: 2px solid #cd3300 !important }
.ace_scroller{overflow: auto!important;}
header {background: #e9e9e9;}
input {border:2px;}
.completedCourse {
    background: #54278f;
    width: 200px;
    height: 39px;
    border-radius: 4px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: white;
    border: #756bb1 1px solid;
    float: left;
    font-weight: 800;
    font-size: 12px;
    margin: 50px 0px 0px 207px;
}
</style>
<script>
$(document).ready(function() {
  $('input[name="q"]').keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});
</script>
</head>
<body onload="prettyPrint()">
<div class="wrapLoader">
   <div class="imgLoader">
      <img  src="/images/loading-cg.gif" alt="" width="70" height="70" />
   </div>
</div>
<header>
   <div class="container" style="margin-left:200px; background: #e9e9e9; color: #9a9a9a; font: 100%/1.5em Droid Sans sans-serif;">			
      <h1 class="logo">
      <a href="index.htm" title="tutorialspoint">
      <img alt="welearn" src="https://image.ibb.co/cPU8qb/welearn.png">
      </a>
      </h1>			
      
         <!-- search code here  --> 
   </div>
  
   
</header>
<div style="clear:both;"></div>
<div role="main" class="main">
<div class="container" style="margin-left:200px;margin-right: 736px;">
<div class="row">
<div class="col-md-2">
<aside class="sidebar">
<div class="mini-logo">
<img src="https://image.ibb.co/fF1ciw/learn.jpg" alt="Databases" />
</div>

<ul class="nav nav-list primary left-menu">
<li class="heading">Databases</li>   
<li>Architecture</a></li>
<li>Data Models</a></li>
<li>Data Schemas</a></li>
</ul>



</aside>
</div>
<!-- PRINTING STARTS HERE -->
<div class="row">
<div class="content">
<div class="col-md-7 middle-col">
<div class="cover">
<img class="img-responsive" src="https://image.ibb.co/jzUnWR/dbms.jpg" alt="Data Structures & Algorithms (DSA) Tutorial" />
</div>
<hr />

<hr />
<h1>Data Schemas</h1>
<div class="center-aligned tutorial-menu">
<form action="/job_search.php" method="POST">
<input type="hidden" name="search_string" value="Data Structures" />

</form>
</div>
<p> A database schema is the skeleton structure that represents the logical view of the entire database. It defines how the data is organized and how the relations among them are associated. It formulates all the constraints that are to be applied on the data.

A database schema defines its entities and the relationship among them. It contains a descriptive detail of the database, which can be depicted by means of schema diagrams. Itâs the database designers who design the schema to help programmers understand the database and make it useful.</p>
<h1>Database Instance</h1>
<p>It is important that we distinguish these two terms individually. Database schema is the skeleton of database. It is designed when the database doesn't exist at all. Once the database is operational, it is very difficult to make any changes to it. A database schema does not contain any data or information.

A database instance is a state of operational database with data at any given time. It contains a snapshot of the database. Database instances tend to change with time. A DBMS ensures that its every instance (state) is in a valid state, by diligently following all the validations, constraints, and conditions that the database designers have imposed.</p>


<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 

					<c:if test="${markAsCompleted == false}">
					<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed"/>
					</c:if>
					<c:if test="${markAsCompleted == true}">
					<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic"/>
					</c:if>
					<input type="hidden" name="courseName" path="courseName" value="Databases" />
					<input type="hidden" name="courseLevel" path="courseLevel" value="4" />
					<input type="hidden" name="topicName" path="topicName" value="Schemas" />
					<input type="hidden" name="topicUrl" path="topicUrl" value="databases/schemas" />
					
</form:form>


<div class="pre-btn">
<a href="http://localhost:7080/TolcProject/databases/models?id=${employee.id}"><i class="icon icon-arrow-circle-o-left big-font"></i> Previous Page</a>
</div>

<jsp:include page="../backToCourses.jsp" />
<jsp:include page="../tickers/tickerDatabases.jsp" />
<jsp:include page="../inCourseChat.jsp" />
</body>
</html>
