<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>Greedy Algorithms</title>
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
			<section id="banner" data-video="../resources/images/algo/bannerAlgo2">
				<div class="inner">
					<h1>The World of Greedy Algorithms</h1>
					<p style="color:white;">Have you wondered how Greedy Algorithms are designed?<br />
					Learn more about <a href="https://templated.co/">Greedy Algorithms</a> and become a master at <a href="https://templated.co/license">Greedy Algorithms</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="../resources/images/algo/algo_02.gif" alt="" width="42" height="400"/>
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Greedy Algorithms</h2>
									<p>Introduction to Greedy Algorithm Design</p>
								</header>
								<hr />
								<p>An algorithm is designed to achieve optimum solution for a given problem. In greedy algorithm approach, decisions are made from the given solution domain. As being greedy, the closest solution that seems to provide an optimum solution is chosen.</p>
								<p>Greedy algorithms try to find a localized optimum solution, which may eventually lead to globally optimized solutions. However, generally greedy algorithms do not provide globally optimized solutions.</p>
								
								
								<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 
									<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed" style="margin-left: 43%"/>
									<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic" style="margin-left: 38%"/>
									<input type="hidden" name="courseName" path="courseName" value="Algorithms" />
									<input type="hidden" name="courseLevel" path="courseLevel" value='2' />
									<input type="hidden" name="topicName" path="topicName" value="Greedy Approach" />
									<input type="hidden" name="topicUrl" path="topicUrl" value="algorithms/greedyApproach" />
					
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
								<h3>Introduction to Algorithms</h3>
							</header>
							<p>Lets begin with the basics</p>
							
							<ul class="actions">
								<li><a href="intro?id=${employee.id}" class="button alt">Previous topic</a></li>
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
								<h3>Divide And Conquer</h3>
							</header>
							<p>DNC text Sometimes, being greedy is not so bad at all, especially if you're solving optimization problems </p>
							<ul class="actions">
								<li><a href="divideAndConquer?id=${employee.id}" class="button alt">Next topic</a></li>
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
var thisPageUrl = "algorithms/greedyApproach"
	var subTopic = true;
	var globalTopicName = "Greedy Approach";
	var globalCourseName = "Algorithms";
</script>
	</body>
</html>