<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>Memory Management</title>
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
			<section id="banner" data-video="../resources/images/os/bannerOs">
				<div class="inner">
					<h1>The World of Memory Management</h1>
					<p style="color:white;">Have you wondered how Memory is managed in an Operating System?<br />
					Learn more about <a href="https://templated.co/">Memory Management</a> and become a master at <a href="https://templated.co/license">OS Memory Management</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="../resources/images/os/os2.jpg" alt="" width="42" height="400"/>
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Memory Management</h2>
									<p>Introduction to Memory Management</p>
								</header>
								<hr />
								<p>Memory management is the functionality of an operating system which handles or manages primary memory and moves processes back and forth between main memory and disk during execution. Memory management keeps track of each and every memory location, regardless of either it is allocated to some process or it is free. </p>
								<p>It checks how much memory is to be allocated to processes. It decides which process will get memory at what time. It tracks whenever some memory gets freed or unallocated and correspondingly it updates the status.</p>
								
								<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 
									<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed" style="margin-left: 43%"/>
									<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic" style="margin-left: 38%"/>
										<input type="hidden" name="courseName" path="courseName" value="Operating Systems" />
										<input type="hidden" name="courseLevel" path="courseLevel" value='2' />
										<input type="hidden" name="topicName" path="topicName" value="Memory Management" />
										<input type="hidden" name="topicUrl" path="topicUrl" value="operatingSystems/memoryManagement" />
					
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
								<h3>Introduction to Operating Systems</h3>
							</header>
							<p>Lets begin with the basics of operating systems</p>
							
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
								<h3>Caches</h3>
							</header>
							<p>Caches are great to keep things temporarily, but not for long!</p>
							<ul class="actions">
								<li><a href="cache?id=${employee.id}" class="button alt">Next topic</a></li>
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
var thisPageUrl = "operatingSystems/memoryManagement";
var subTopic = true;
var globalTopicName = "Memory Management";
var globalCourseName = "Operating Systems";
</script>
	</body>
</html>