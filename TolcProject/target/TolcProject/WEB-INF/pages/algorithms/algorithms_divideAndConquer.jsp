<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>Divide and Conquer Algorithms</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	</head>
	<body>

		<!-- Header -->
			<div id="header" class="alt">
				<div class="logo"><a href="../userHomepage?id=${employee.id}">welearn <span>by PAA</span></a></div>
				<jsp:include page="../headerBar.jsp" />
				

			</div>

		<!-- Nav -->
				
				
			<nav id="menu"  style="width: 400px;overflow-y: scroll;">
			<jsp:include page="../ticker.jsp" />
			</nav>

		<!-- Banner -->
		<!--
			To use a video as your background, set data-video to the name of your video without
			its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
			formats to work correctly.
		-->
			<section id="banner" data-video="../resources/images/algo/bannerAlgo">
				<div class="inner">
					<h1>The World of Divide and Conquer</h1>
					<p style="color:white;">Have you wondered how Divide and Conquer works?<br />
					Learn more about <a href="https://templated.co/">Divide and Conquer</a> and become a master at <a href="https://templated.co/license">Divide and Conquer algorithms</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="../resources/images/algo/algo_03.jpg" alt="" width="42" height="400"/>
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Divide and Conquer Algorithms</h2>
									<p>Introduction to Divide and Conquer algorithms</p>
								</header>
								<hr />
								<p>In divide and conquer approach, the problem in hand, is divided into smaller sub-problems and then each problem is solved independently. When we keep on dividing the subproblems into even smaller sub-problems, we may eventually reach a stage where no more division is possible. Those "atomic" smallest possible sub-problem (fractions) are solved. The solution of all sub-problems is finally merged in order to obtain the solution of an original problem.</p>
								<p>Divide step involves breaking the problem into smaller sub-problems. Sub-problems should represent a part of the original problem. This step generally takes a recursive approach to divide the problem until no sub-problem is further divisible. At this stage, sub-problems become atomic in nature but still represent some part of the actual problem.</p>
								<p>Conquer step receives a lot of smaller sub-problems to be solved. Generally, at this level, the problems are considered 'solved' on their own.</p>
							
								
								
								<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 
									<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed" style="margin-left: 43%"/>
									<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic" style="margin-left: 38%"/>
									<input type="hidden" name="courseName" path="courseName" value="Algorithms" />
									<input type="hidden" name="courseLevel" path="courseLevel" value='3' />
									<input type="hidden" name="topicName" path="topicName" value="Divide And Conquer" />
									<input type="hidden" name="topicUrl" path="topicUrl" value="algorithms/divideAndConquer" />
					
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<div id="flexgrid">
						<div>
						<header>
								<h3>Greedy Algorithms</h3>
							</header>
							<p>Sometimes, being greedy is not so bad at all, especially if you're solving optimization problems </p>
							
							<ul class="actions">
								<li><a href="greedyApproach?id=${employee.id}" class="button alt">Previous topic</a></li>
							</ul>
							
							
						</div>
						<div>
						<br><br><br><br><br><br><br>
							<ul class="actions">
								<li><a class="button alt" href="../courseList?id=${employee.id}">Go back to courses list page</a></li><!-- End Btn2 -->
							</ul>
						
						</div>
						<div>
						<header>
								<h3>Dynamic Programming</h3>
							</header>
							<p>Good to remember things to optimally solve problems</p>
							
							<ul class="actions">
								<li><a href="dynamicProgramming?id=${employee.id}" class="button alt">Next topic</a></li>
							</ul>
							
						</div>
					</div>
				</div>
			</section>

		
		

		<!-- Scripts -->
			<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
			<script src="<c:url value="/resources/js/jquery.scrolly.min.js"/>"></script>
			<script src="<c:url value="/resources/js/jquery.scrollex.min.js" />"></script>
			<script src="<c:url value="/resources/js/skel.min.js" />"></script>
			<script src="<c:url value="/resources/js/util.js" />"></script>
			<script src="<c:url value="/resources/js/main.js" />"></script>
			
			
<jsp:include page="../inCourseChat.jsp" />
<script type="text/javascript">
var thisPageUrl = "algorithms/divideAndConquer";
var subTopic = true;
var globalTopicName = "Divide And Conquer";
var globalCourseName = "Algorithms";
</script>
	</body>
</html>