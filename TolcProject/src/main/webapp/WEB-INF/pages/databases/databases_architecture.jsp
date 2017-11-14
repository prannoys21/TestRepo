<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<meta charset="utf-8">
<title>Algorithms Tutorial</title>
<meta name="Description" content="Data Structures and Algorithms (DSA) Tutorial for Beginners - Learn Data Structures and Algorithm using c, C++ and Java in simple and easy steps starting from basic to advanced concepts with examples including Overview, Environment Setup, Algorithm, Asymptotic Analysis, Greedy Algorithms, Divide and Conquer, Dynamic Programming, Data Structures, Array, Linked List, Doubly Linked List, Circular List, Stack, Parsing Expression, Queue, Priority queue, Linear, Binary, Interpolation Search, Tree, Tree Traversal, Binary Search Tree, B+, AVL, Spanning, Tower of Hanoi, Hash Table, Heap, Graph, Depth, Breadth First Traversal, Search techniques, Sorting techniques, Sorting Algorithm, Bubble, Merge Sort Algorithm, Insertion, Selection, Shell, Quick Sort, Recursion, Fibonacci Series." />
<meta name="Keywords" content="Overview, Environment Setup, Algorithm, Asymptotic Analysis, Greedy Algorithms, Divide and Conquer, Dynamic Programming, Data Structures, Array, Linked List, Doubly Linked List, Circular List, Stack, Parsing Expression, Queue, Priority queue, Linear, Binary, Interpolation Search, Tree, Tree Traversal, Binary Search Tree, B+, AVL, Spanning, Tower of Hanoi, Hash Table, Heap, Graph, Depth, Breadth First Traversal, Search techniques, Sorting techniques, Sorting Algorithm, Bubble, Merge Sort Algorithm, Insertion, Selection, Shell, Quick Sort, Recursion, Fibonacci Series." />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes">
<meta name="robots" content="index, follow"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="author" content="tutorialspoint.com">
<script type="text/javascript" src=""></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://www.tutorialspoint.com/theme/css/style-min.css"> -->
<!-- Head Libs -->
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="/theme/css/ie8.css">
<![endif]-->
<style>
body {
	color: #000;
}
pre.prettyprint.tryit {min-height:37px; background: #eee url(data_structures_algorithms/images/try-it.jpg) top right no-repeat !important}select{ border:0 !important; outline: 1px inset black !important; outline-offset: -1px !important; }
ul.nav-list.primary>li a.videolink{    background: none; margin: 0px; padding: 0px; border: 1px solid #d6d6d6;}
div.feature-box div.feature-box-icon, .col-md-3 .course-box, li.heading, div.footer-copyright { background: #cd3300 url(/images/pattern.png) repeat center center !important;}
.sub-main-menu .sub-menuu div:hover, .sub-main-menu .viewall, header nav ul.nav-main li a:hover, button.btn-responsive-nav, header div.search button.btn-default { background: #cd3300 !important;}
.submenu-item{ border-bottom: 2px solid #cd3300 !important; border-top: 2px solid #cd3300 !important }
.ace_scroller{overflow: auto!important;}
/* header {background: #e9e9e9;} */
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
.middle-col {
min-height: 1171px;
}
.img_resize_fit{
    max-width:9%;
    max-height:11%;
    vertical-align: middle;
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
<body>
<div class="container" style="width: 100%; height:56px; position:fixed; overflow: hidden; background: #fd8d3c; color: #9a9a9a; box-shadow: 0px 3px 9px #888888; font: 100%/1.5em Droid Sans sans-serif;">
<div class="logo">
            <a href="../userHomepage?id=${employee.id}">
                <img src="https://image.ibb.co/cPU8qb/welearn.png" class="img_resize_fit"  alt="Learn"> 
                <img src="https://image.ibb.co/cPU8qb/welearn.png" class="img_resize_fit" alt="Collolearn">
            </a>
        </div>
</div>

<div role="main" class="main" style="padding: 92px 0px 0px 0px;">
<div class="container" style="margin-left:200px;margin-right: 736px;">
<div class="row">
<div class="col-md-2">
<aside class="sidebar">
<div class="mini-logo">
<img src="https://image.ibb.co/epH6bG/database.jpg" style="width: 50%;" alt="Databases" />
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
<!-- <img class="img-responsive" src="https://image.ibb.co/jzUnWR/dbms.jpg" alt="Data Structures & Algorithms (DSA) Tutorial" /> -->
</div>
<hr />

<hr />
<h1>Architecture</h1>
<div class="center-aligned tutorial-menu">
<form action="/job_search.php" method="POST">
<input type="hidden" name="search_string" value="Data Structures" />

</form>
</div>
<p>The design of a DBMS depends on its architecture. It can be centralized or decentralized or hierarchical. The architecture of a DBMS can be seen as either single tier or multi-tier. An n-tier architecture divides the whole system into related but independent n modules, which can be independently modified, altered, changed, or replaced.

In 1-tier architecture, the DBMS is the only entity where the user directly sits on the DBMS and uses it. Any changes done here will directly be done on the DBMS itself. It does not provide handy tools for end-users. Database designers and programmers normally prefer to use single-tier architecture.

If the architecture of DBMS is 2-tier, then it must have an application through which the DBMS can be accessed. Programmers use 2-tier architecture where they access the DBMS by means of an application. Here the application tier is entirely independent of the database in terms of operation, design, and programming.</p>
<h1>3-Tier Architecture</h1>
<p>A 3-tier architecture separates its tiers from each other based on the complexity of the users and how they use the data present in the database. It is the most widely used architecture to design a DBMS.</p>


<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 

					<c:if test="${markAsCompleted == false}">
					<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed"/>
					</c:if>
					<c:if test="${markAsCompleted == true}">
					<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic"/>
					</c:if>
					<input type="hidden" name="courseName" path="courseName" value="Databases" />
					<input type="hidden" name="courseLevel" path="courseLevel" value="2" />
					<input type="hidden" name="topicName" path="topicName" value="Architecture" />
					<input type="hidden" name="topicUrl" path="topicUrl" value="databases/architecture" />
					
</form:form>

<div class="pre-btn">
<a href="http://localhost:7080/TolcProject/databases/intro?id=${employee.id}"><i class="icon icon-arrow-circle-o-left big-font"></i> Previous Page</a>
</div>
<div class="nxt-btn">
<a href="http://localhost:7080/TolcProject/databases/models?id=${employee.id}">Next Page <i class="icon icon-arrow-circle-o-right big-font"></i>&nbsp;</a>
</div>
<jsp:include page="../backToCourses.jsp" />
<jsp:include page="../ticker.jsp" />
<jsp:include page="../inCourseChat.jsp" />
<script type="text/javascript">
var thisPageUrl = "databases/architecture";
var subTopic = true;
var globalTopicName = "Architecture";
var globalCourseName = "Databases";
</script>

</div></div></div></div></div></div>
</body>
</html>
