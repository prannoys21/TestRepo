<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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


/
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
<jsp:include page="../headerBar.jsp" />
<div role="main" class="main" style="padding: 92px 0px 0px 0px;">
<div class="container"  style="margin-left:200px; margin-right:736px;">
<div class="row">
<div class="col-md-2">
<aside class="sidebar">
<div class="mini-logo">
<img src="http://www.geeksforgeeks.org/wp-content/uploads/Competitive-Programming-1.jpg" style="width: 50%;"alt="Data Structures & Algorithms Tutorial" />
</div>


<ul class="nav nav-list primary left-menu">
<li class="heading">Algorithm</li>   
<li>Greedy</a></li>
<li>Divide and Conquer</a></li>
<li>Dynamic Programming</a></li>
</ul>



</aside>
</div>
<!-- PRINTING STARTS HERE -->
<div class="row">
<div class="content">
<div class="col-md-7 middle-col">
<div class="cover">
<!-- <img class="img-responsive" src="C:\Users\ambar\Desktop\MOOC Website\software_engineering.jpg" alt="Data Structures & Algorithms (DSA) Tutorial" /> -->
</div>
<hr />

<hr />
<h1>Divide and Conquer</h1>
<div class="center-aligned tutorial-menu">
<form action="/job_search.php" method="POST">
<input type="hidden" name="search_string" value="Data Structures" />

</form>
</div>
<p>In divide and conquer approach, the problem in hand, is divided into smaller sub-problems and then each problem is solved independently. When we keep on dividing the subproblems into even smaller sub-problems, we may eventually reach a stage where no more division is possible. Those "atomic" smallest possible sub-problem (fractions) are solved. The solution of all sub-problems is finally merged in order to obtain the solution of an original problem.</p>
<h1>Divide</h1>
<p>This step involves breaking the problem into smaller sub-problems. Sub-problems should represent a part of the original problem. This step generally takes a recursive approach to divide the problem until no sub-problem is further divisible. At this stage, sub-problems become atomic in nature but still represent some part of the actual problem.</p>
<h1>Conquer</h1>
<p>This step receives a lot of smaller sub-problems to be solved. Generally, at this level, the problems are considered 'solved' on their own.</p>




<div class="pre-btn">
<a href="http://localhost:7080/TolcProject/algorithms/greedyApproach?id=${employee.id}"><i class="icon icon-arrow-circle-o-left big-font"></i> Previous Page</a>
</div>
<div class="nxt-btn">
<a href="http://localhost:7080/TolcProject/algorithms/dynamicProgramming?id=${employee.id}">Next Page <i class="icon icon-arrow-circle-o-right big-font"></i>&nbsp;</a>
</div>
<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 

					<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed"/>
					<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic"/>
					<input type="hidden" name="courseName" path="courseName" value="Algorithms" />
					<input type="hidden" name="courseLevel" path="courseLevel" value='3' />
					<input type="hidden" name="topicName" path="topicName" value="Divide And Conquer" />
					<input type="hidden" name="topicUrl" path="topicUrl" value="algorithms/divideAndConquer" />
					
</form:form>

<jsp:include page="../backToCourses.jsp" />
<jsp:include page="../ticker.jsp" />
<jsp:include page="../inCourseChat.jsp" />
<script type="text/javascript">
var thisPageUrl = "algorithms/divideAndConquer";
var subTopic = true;
var globalTopicName = "Divide And Conquer";
var globalCourseName = "Algorithms";
</script>
</div></div></div></div></div></div>
</body>
</html>
