<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<head>
		<title>Database Architecture</title>
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
			<section id="banner" data-video="../resources/images/db/bannerDb">
				<div class="inner">
					<h1>The World of Database Architecture</h1>
					<p style="color:white;">Have you wondered how the Database is architected?<br />
					Learn more about <a href="https://templated.co/">Database Architecture</a> and become a master at <a href="https://templated.co/license">Designing Databases</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="../resources/images/db/db2.jpg" alt="" width="42" height="400"/>
							</div>
							<div class="content">
								<header class="align-center">
									<h2>Database Architecture</h2>
									<p>Introduction to Database Architecture</p>
								</header>
								<hr />
								
								<p>The design of a DBMS depends on its architecture. It can be centralized or decentralized or hierarchical. The architecture of a DBMS can be seen as either single tier or multi-tier. An n-tier architecture divides the whole system into related but independent n modules, which can be independently modified, altered, changed, or replaced.</p>

								<p>In 1-tier architecture, the DBMS is the only entity where the user directly sits on the DBMS and uses it. Any changes done here will directly be done on the DBMS itself. It does not provide handy tools for end-users. Database designers and programmers normally prefer to use single-tier architecture.</p>

								<p>A 3-tier architecture separates its tiers from each other based on the complexity of the users and how they use the data present in the database. It is the most widely used architecture to design a DBMS.</p>

								<form:form action="../sendNotification?id=${employee.id}" method="post" modelAttribute="ticker" name="notificationAddition" id="notificationAddition"> 
									<input class="markAsComplete" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="Mark as Completed" style="margin-left: 43%"/>
									<input class="completedCourse" id="notificationgenerator" name="notificationgenerator" path="notificationgenerator" type="submit" value="You Completed This Topic" style="margin-left: 38%"/>
									<input type="hidden" name="courseName" path="courseName" value="Databases" />
									<input type="hidden" name="courseLevel" path="courseLevel" value="2" />
									<input type="hidden" name="topicName" path="topicName" value="Architecture" />
									<input type="hidden" name="topicUrl" path="topicUrl" value="databases/architecture" />
					
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
								<h3>Introduction to Databases</h3>
							</header>
							<p>Lets begin with the basics of databases </p>
						
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
								<h3>Models</h3>
							</header>
							<p>Understand the different database models</p>
						
							<ul class="actions">
								<li><a href="models?id=${employee.id}" class="button alt">Next topic</a></li>
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
var thisPageUrl = "databases/architecture";
var subTopic = true;
var globalTopicName = "Architecture";
var globalCourseName = "Databases";
</script>
	</body>
</html>