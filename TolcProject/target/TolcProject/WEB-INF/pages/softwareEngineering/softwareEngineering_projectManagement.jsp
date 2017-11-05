<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta charset="utf-8">
<title>Project Management</title>
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
<link rel="stylesheet" href="https://www.tutorialspoint.com/theme/css/style-min.css">
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
      <button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse" id="pull" style="top: 24px!important"> <i class="icon icon-bars"></i> </button>
   </div>
  
   
</header>
<div style="clear:both;"></div>
<div role="main" class="main">
<div class="container" style="margin-left:200px;">
<div class="row">
<div class="col-md-2">
<aside class="sidebar">
<div class="mini-logo">
<img src="https://image.ibb.co/bOTgrR/software_engineering.jpg" alt="Software Engineering Tutorial" />
</div>


<ul class="nav nav-list primary left-menu">
<li class="heading">Software Engineering</li>   
<li>Software Design</a></li>
<li>Software Requirements</a></li>
<li>Software Security</a></li>
</ul>



</aside>
</div>
<!-- PRINTING STARTS HERE -->
<div class="row">
<div class="content">
<div class="col-md-7 middle-col">
<div class="cover">
<img class="img-responsive" src="https://image.ibb.co/bOTgrR/software_engineering.jpg" alt="Data Structures & Algorithms (DSA) Tutorial" />
</div>
<hr />

<hr />
<h1>Software Project Management</h1>
<div class="center-aligned tutorial-menu">
<form action="/job_search.php" method="POST">
<input type="hidden" name="search_string" value="Data Structures" />

</form>
</div>
<p></p>
<h1>Software Project</h1>
<p>A Software Project is the complete procedure of software development from requirement gathering to testing and maintenance, carried out according to the execution methodologies, in a specified period of time to achieve intended software product.</p>
<h1>Need of Software Project Management</h1>
<p>Software is said to be an intangible product. Software development is a kind of all new stream in world business and thereâs very little experience in building software products. Most software products are tailor made to fit clientâs requirements. The most important is that the underlying technology changes and advances so frequently and rapidly that experience of one product may not be applied to the other one. All such business and environmental constraints bring risk in software development hence it is essential to manage software projects efficiently.</p>

<p>Please enter your first name and accept the below line to finish this topic.<p>
<br>
<p>I hereby declare that I clearly understood the content and state that no changes are required for this content and I successfully  finished this topic.<p> 
<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 

					<input type="text" name="notificationgenerator" path="notificationgenerator" placeholder="Enter your Firstname…" autofocus/>
					<input type="hidden" name="courseName" path="courseName" value="Algorithms" />
					<input type="hidden" name="topicName" path="topicName" value="Introduction to Algorithms" />
					
</form:form>




<div class="pre-btn">
<a href="http://localhost:7080/TolcProject/softwareEngineering/design?id=${employee.id}"><i class="icon icon-arrow-circle-o-left big-font"></i> Previous Page</a>
</div>
<div class="nxt-btn">
<a href="http://localhost:7080/TolcProject/softwareEngineering/maintenance?id=${employee.id}">Next Page <i class="icon icon-arrow-circle-o-right big-font"></i>&nbsp;</a>
</div>
<jsp:include page="../backToCourses.jsp" />
<jsp:include page="../ticker.jsp" />


</body>
</html>
