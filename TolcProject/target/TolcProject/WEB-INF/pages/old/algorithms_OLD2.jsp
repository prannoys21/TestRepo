
<!doctype html> 
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Algorithms Tutorial</title>
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
<li class="heading">Data Structures &amp; Algorithms</li>
<li><a href="/data_structures_algorithms/index.htm">Algorithms-Home</a></li>
<li><a href="/data_structures_algorithms/data_structure_overview.htm">Algorithms - Overview</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Algorithm</li>   
<li>Algorithms Basics</a></li>
<li>Asymptotic Analysis</a></li>
<li>Greedy Algorithms</a></li>
<li>Divide and Conquer</a></li>
<li>Dynamic Programming</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Data Structures</li>
<li>Data Structure Basics</a></li>
<li>Array Data Structure</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Linked Lists</a></li>
<li>Linked List Basics</a></li>
<li>Doubly Linked List</a></li>
<li>Circular Linked List</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Stack &amp; Queue</li>
<li>Stack</a></li>
<li>Expression Parsing</a></li>
<li>Queue</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Searching Techniques</li>
<!--<li style="background:yellow;"><a href="/data_structures_algorithms/searching_algorithms.htm">DSA - Searching Algorithms</a></li>-->
<li>Linear Search</a></li>
<li>Binary Search</a></li>
<li>Interpolation Search</a></li>
<li>Hash Table</a></li>
</ul>
<ul class="nav nav-list primary left-menu">
<li class="heading">Sorting Techniques</li>
<li>Sorting Algorithms</a></li>
<li>Bubble Sort</a></li>
<li>Insertion Sort</a></li>
<li>Selection Sort</a></li>
<li>Merge Sort</a></li>
<li>Shell Sort</a></li>
<li>Quick Sort</a></li>
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
<h1>Data Structure and Algorithms Tutorial</h1>
<div class="center-aligned tutorial-menu">
<form action="/job_search.php" method="POST">
<input type="hidden" name="search_string" value="Data Structures" />

</form>
</div>
<p>Data Structures are the programmatic way of storing data so that data can be used efficiently. Almost every enterprise application uses various types of data structures in one or the other way. This tutorial will give you a great understanding on Data Structures needed to understand the complexity of enterprise level applications and need of algorithms, and data structures.</p>
<h1>Audience</h1>
<p>This tutorial is designed for Computer Science graduates as well as Software Professionals who are willing to learn data structures and algorithm programming in simple and easy steps.</p>
<p>After completing this tutorial you will be at intermediate level of expertise from where you can take yourself to higher level of expertise.</p>
<h1>Prerequisites</h1>
<p>Before proceeding with this tutorial, you should have a basic understanding of C programming language, text editor, and execution of programs, etc.</p>
<h1>Compile and Execute C Online</h1>
<p>For most of the examples given in this tutorial you will find <b>Try it</b> option, so just make use of this option to execute your programs on the spot and enjoy your learning.</p>
<p>Try the following example using the Try it option available at the top right corner of the following sample code box &minus;</p>
<pre class="prettyprint notranslate tryit">
#include &lt;stdio.h&gt;

int main(){
   /* My first program in C */
   printf("Hello, World! \n");
   
   return 0;
}
</pre>
<hr />

<hr />

</body>
</html>
