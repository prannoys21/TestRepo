<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>Dynamic Programming</title>
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
			<section id="banner" data-video="../resources/images/algo/banner1">
				<div class="inner">
					<h1>The World of Dynamic Programming</h1>
					<p style="color:white;">Have you wondered how Dynamic Programming algorithms are designed?<br />
					Learn more about <a href="https://templated.co/">Dynamic Programming Algorithms</a> and become a master at <a href="https://templated.co/license">Designing Dynamic Programming Algorithms</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="../resources/images/algo/algo_04.png" alt="" width="42" height="400"/>
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Dynamic Programming</h2>
									<p>Introduction to Dynamic Programming algorithms</p>
								</header>
								<hr />
								<p>Dynamic programming approach is similar to divide and conquer in breaking down the problem into smaller and yet smaller possible sub-problems. But unlike, divide and conquer, these sub-problems are not solved independently. Rather, results of these smaller sub-problems are remembered and used for similar or overlapping sub-problems.</p>

								<p>Dynamic programming is used where we have problems, which can be divided into similar sub-problems, so that their results can be re-used. Mostly, these algorithms are used for optimization. Before solving the in-hand sub-problem, dynamic algorithm will try to examine the results of the previously solved sub-problems. The solutions of sub-problems are combined in order to achieve the best solution.</p>

								
								
								<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 
									<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed" style="margin-left: 43%"/>
									<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic" style="margin-left: 38%"/>
									<input type="hidden" name="courseName" path="courseName" value="Algorithms" />
									<input type="hidden" name="courseLevel" path="courseLevel" value='4' />
									<input type="hidden" name="topicName" path="topicName" value="Dynamic Programming" />
									<input type="hidden" name="topicUrl" path="topicUrl" value="algorithms/dynamicProgramming" />
					
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
							
						</div>
						<div>
							<header>
								<h3>Divide and Conquer</h3>
							</header>
							<p>Break problems into small subproblems and then solve them </p>
							
							<ul class="actions">
								<li><a href="divideAndConquer?id=${employee.id}" class="button alt">Previous topic</a></li>
							</ul>
							
							<ul class="actions">
								<li><a class="button alt" href="../courseList?id=${employee.id}">Go back to courses list page</a></li><!-- End Btn2 -->
							</ul>
						</div>
						<div>
							
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
var thisPageUrl = "algorithms/dynamicProgramming";
var subTopic = true;
var globalTopicName = "Dynamic Programming";
var globalCourseName = "Algorithms";
</script>
	</body>
</html>