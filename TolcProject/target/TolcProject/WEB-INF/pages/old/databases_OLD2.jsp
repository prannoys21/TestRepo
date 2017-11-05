

<!doctype html> 
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Database management Tutorial</title>
<meta name="Description" content="Data Structures and Algorithms (DSA) Tutorial for Beginners - Learn Data Structures and Algorithm using c, C++ and Java in simple and easy steps starting from basic to advanced concepts with examples including Overview, Environment Setup, Algorithm, Asymptotic Analysis, Greedy Algorithms, Divide and Conquer, Dynamic Programming, Data Structures, Array, Linked List, Doubly Linked List, Circular List, Stack, Parsing Expression, Queue, Priority queue, Linear, Binary, Interpolation Search, Tree, Tree Traversal, Binary Search Tree, B+, AVL, Spanning, Tower of Hanoi, Hash Table, Heap, Graph, Depth, Breadth First Traversal, Search techniques, Sorting techniques, Sorting Algorithm, Bubble, Merge Sort Algorithm, Insertion, Selection, Shell, Quick Sort, Recursion, Fibonacci Series." />
<meta name="Keywords" content="Overview, Environment Setup, Algorithm, Asymptotic Analysis, Greedy Algorithms, Divide and Conquer, Dynamic Programming, Data Structures, Array, Linked List, Doubly Linked List, Circular List, Stack, Parsing Expression, Queue, Priority queue, Linear, Binary, Interpolation Search, Tree, Tree Traversal, Binary Search Tree, B+, AVL, Spanning, Tower of Hanoi, Hash Table, Heap, Graph, Depth, Breadth First Traversal, Search techniques, Sorting techniques, Sorting Algorithm, Bubble, Merge Sort Algorithm, Insertion, Selection, Shell, Quick Sort, Recursion, Fibonacci Series." />
<base href="https://www.tutorialspoint.com/" />
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
   <div class="container">			
      <h1 class="logo">
      <a href="index.htm" title="tutorialspoint">
      <img alt="welearn" src="C:\Users\ambar\Desktop\MOOC Website\welearn.png">
      </a>
      </h1>			
      
         <!-- search code here  --> 
      <button class="btn btn-responsive-nav btn-inverse" data-toggle="collapse" data-target=".nav-main-collapse" id="pull" style="top: 24px!important"> <i class="icon icon-bars"></i> </button>
   </div>
  
   
</header>
<div style="clear:both;"></div>
<div role="main" class="main">
<div class="container">
<div class="row">
<div class="col-md-2">
<aside class="sidebar">
<div class="mini-logo">
<img src="/data_structures_algorithms/images/data-structure-mini-logo.jpg" alt="Data Structures & Algorithms Tutorial" />
</div>
<ul class="nav nav-list primary left-menu">
<li class="heading">Database Management Systems</li>
<li><a href="/data_structures_algorithms/index.htm">DBMS-Home</a></li>
<li><a href="/data_structures_algorithms/data_structure_overview.htm">DBMS - Overview</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Databases</li>   
<li>Home</a></li>
<li>Overview</a></li>
<li>Architecture</a></li>
<li>Data Models</a></li>
<li>Data Schemas</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Entity Relationship Model</li>
<li>ER Diagrams</a></li>
<li>Generalization and Aggregation</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Relational Model</a></li>
<li>Relational Data Model</a></li>
<li>Relational Algebra</a></li>
<li>ER to Relational Model</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Storage &amp; File Structure</li>
<li>Storage System</a></li>
<li>File Structure</a></li>
</ul>


</aside>
</div>
<!-- PRINTING STARTS HERE -->
<div class="row">
<div class="content">
<div class="col-md-7 middle-col">
<div class="cover">
<img class="img-responsive" src="/data_structures_algorithms/images/data-structure-algorithm.jpg" alt="Data Structures & Algorithms (DSA) Tutorial" />
</div>
<hr />

<hr />
<h1>Database Management Systems Tutorial</h1>
<div class="center-aligned tutorial-menu">
<form action="/job_search.php" method="POST">
<input type="hidden" name="search_string" value="Data Structures" />

</form>
</div>
<p>Database Management System or DBMS in short refers to the technology of storing and retrieving users’ data with utmost efficiency along with appropriate security measures. This tutorial explains the basics of DBMS such as its architecture, data models, data schemas, data independence, E-R model, relation model, relational database design, and storage and file structure and much more.</p>
<h1>Audience</h1>
<p>This tutorial will especially help computer science graduates in understanding the basic-to-advanced concepts related to Database Management Systems.</p>
<h1>Prerequisites</h1>
<p>Before you start proceeding with this tutorial, it is recommended that you have a good understanding of basic computer concepts such as primary memory, secondary memory, and data structures and algorithms.</p>

</body>
</html>
