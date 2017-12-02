<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>Secondary Storage</title>
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
					<h1>The World of Secondary Storage</h1>
					<p style="color:white;">Have you wondered how Secondary Storage is maintained?<br />
					Learn more about <a href="https://templated.co/">Secondary Storage</a> and become a master at <a href="https://templated.co/license">Managing Secondary Storage</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="../resources/images/os/os4.jpg" alt="" width="42" height="400"/>
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Secondary Storage</h2>
									<p>Introduction to Secondary Storage</p>
								</header>
								<hr />
								<p>Secondary storage is used to protect inactive data written from a primary storage array to a nonvolatile tier of disk, flash or tape. Secondary storage is synonymous with the terms secondary memory, auxiliary storage and external storage.</p>
								<p>Secondary storage is a trade-off between high performance and economical long-term archiving. Because it is accessed less frequently, data can be migrated to secondary storage devices with lower performance and costs.</p>

								<p>Companies are increasingly placing a second class of storage between primary storage and archival storage as the foundation for a tiered storage environment.</p>

								
								
								<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 
									<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed" style="margin-left: 43%"/>
									<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic" style="margin-left: 38%"/>
									<input type="hidden" name="courseName" path="courseName" value="Operating Systems" />
									<input type="hidden" name="courseLevel" path="courseLevel" value='4' />
									<input type="hidden" name="topicName" path="topicName" value="Secondary Storage" />
									<input type="hidden" name="topicUrl" path="topicUrl" value="operatingSystems/secondaryStorage" />
					
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
								<h3>Caches</h3>
							</header>
							<p>Store things here temporarily for a short time.</p>
							<ul class="actions">
								<li><a href="cache?id=${employee.id}" class="button alt">Previous topic</a></li>
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
var thisPageUrl = "operatingSystems/secondaryStroage";
var subTopic = true;
var globalTopicName = "Secondary Storage";
var globalCourseName = "Operating Systems";
</script>
</body>
</html>