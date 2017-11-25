<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<style>
a {
color: #2b8cbe;
}


<style>
@charset "utf-8";
/* CSS Document */

/* ---------- GENERAL ---------- */
a {
color: #2b8cbe;
}
body {
	background: #e9e9e9;
	color: #9a9a9a;
	font: 100%/1.5em "Droid Sans", sans-serif;
	margin: 0;
}

 
fieldset {
	border: 0;
	margin: 0;
	padding: 0;
}

h4, h5 {
	line-height: 1.5em;
	margin: 0;
	color: #2B8CE8;
}

hr {
	background: #e9e9e9;
    border: 0;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    height: 1px;
    margin: 0;
    min-height: 1px;
}

img {
    border: 0;
    display: block;
    height: auto;
    max-width: 100%;
}

input {
	border: 0;
	color: inherit;
    font-family: inherit;
    font-size: 100%;
    line-height: normal;
    margin: 0;
}


.clearfix {
    font-size: 14px;
}
.clearfix:before, .clearfix:after {
    content: "";
    display: table;
}
.clearfix:after { clear: both; }

.markAsComplete{
    background: #2ecc71;
    width: 150px;
    height: 39px;
    border-radius: 4px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: white;
    border: #27ae60 1px solid;
    float: left;
    font-weight: 800;
    font-size: 12px;
    margin: 50px 0px 0px 230px;
}

/* ---------- ticker-notification ---------- */

#ticker-notification {
	bottom: 0;
	font-size: 12px;
	right: 0px;
	position: fixed;
	width: 19%;
	/* height:100%; */
	    height: 99%;
    margin-top: 56px;
	
}

#ticker-notification header {
	background: #293239;
	border-radius: 5px 5px 0 0;
	color: #fff;
	cursor: pointer;
	padding: 7px 9px 9px 5px;
	
}

#ticker-notification h4:before {
	background: #1a8a34;
	border-radius: 50%;
	content: "";
	display: inline-block;
	height: 8px;
	margin: 0 8px 0 0;
	width: 8px;
}

#ticker-notification h4 {
	font-size: 12px;
	
}

#ticker-notification h5 {
	font-size: 14px;
	color: #2b8cbe;
	
}

#ticker-notification form {
	padding: 24px;
}

#ticker-notification input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 8px;
	outline: none;
	width: 97%;
}

.notification-message-counter {
	background: #e62727;
	border: 1px solid #fff;
	border-radius: 50%;
	display: none;
	font-size: 12px;
	font-weight: bold;
	height: 28px;
	left: 0;
	line-height: 28px;
	margin: -15px 0 0 -15px;
	position: absolute;
	text-align: center;
	top: 0;
	width: 28px;
}

.notification-close {
	background: #1b2126;
	border-radius: 50%;
	color: #fff;
	display: block;
	float: right;
	font-size: 10px;
	height: 16px;
	line-height: 16px;
	margin: 2px 0 0 0;
	text-align: center;
	width: 16px;
}

.notification {
	background: #e9e9e900;
}

.notification-history {
	height: 815px;
    padding: 5px 5px;
    overflow: auto;
    margin-top: 56px;
    margin-left: -27px;
    color: #fff;
    width: 373px;
}

.notification-message {
	margin: 2px 0px 0px 0px;
	display: block;
}

.notification-message img {
	border-radius: 20%;
	float: left;
}

.notification-message-content {
	    margin-left: 2px;
    width: 333px;
    align-content: left;
}

.notification-time {
	float: right;
	font-size: 8px;
	margin-right: 0px;
}

.notification-feedback {
	font-style: italic;	
	margin: 0 0 0 80px;
}

.clickableFirstName{
    font-size: 14px;
    color: #2B8CE8;
    float: left;
    font-weight: bold;
	cursor: pointer;
}
</style>
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
</head>

<body>

	<!-- <div id="ticker-notification"> -->
		
		<!-- <header class="clearfix">
			
			<a href="#" class="notification-close">x</a>

			<h4>notification N Learn</h4>

			<span class="notification-message-counter">3</span>

		</header>
 -->
		<div class=notification>
			<div class="notification-history" id="notification-history">
			<c:set var="tickerUpdate" value="${0}" scope="request"/>
				<c:forEach var="ticker" items="${allNotifications}">
				<c:if test="${employee.id != ticker.employee.id }">
				<c:if test="${ticker.courseName == tickerCourse}">
				<c:if test="${currCourseLevel <= ticker.courseLevel}">
				<c:set var="tickerUpdate" value="${tickerUpdate+1}" scope="request"/>
				<div class="notification-message clearfix" id="tickerUpdate${tickerUpdate}">
					<img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32">
					<div class="notification-message-content clearfix">
					<div class="clickableFirstName" onclick="clickableFirstName(this)">${ticker.employee.firstName}</div>	&nbsp;completed ${ticker.topicName}  from the course  ${ticker.courseName}
					<div class="getTickerUserId" hidden="hidden">${ticker.employee.id}</div>
					<span class="notification-time">${ticker.timeStamp}</span>
					</div>
					
				</div>
				<hr>
				</c:if>
				</c:if>
				</c:if>
				</c:forEach>

			</div> <!-- end notification-history -->

			<!-- <p class="notification-feedback">Your partner is typing…</p> -->

			
		</div> <!-- end notification -->

	<!-- </div>  --><!-- end ticker-notification -->

	
	<script type="text/javascript">
	var courseLevelOfTickerUpdate;
	var firstNameFromTicker;
	var userId = ${employee.id};
	var courseNameObtainedHere = "${tickerCourse}";
	var courseLevelOfCurrentEmployee = ${currCourseLevel};
	var counter = 0;  
	var markAsCompleted = ${markAsCompleted};
	//wow//tickkkkerrrr

	 $(document).ready(function() {
		 //$('.notification-history').scrollTop($('.notification-history')[0].scrollHeight);
		 //t1
		 $(".getTickerUserId").hide();
		
		 $('.completedCourse').hide();
		 
		 /* function completedTopicOrNot(){ */
		 if(markAsCompleted){
			 $('.markAsComplete').hide();
			 $('.completedCourse').show();
		 } else {
			 $('.markAsComplete').show();
			 $('.completedCourse').hide();
		 }
	 /* } */
		 
		 //t2
		 $('#notificationAddition').submit(function(e) {
             e.preventDefault();
			 var postData = $(this).serializeArray();
			 var formURL = $(this).attr("action");
             $.ajax({
                 url : formURL,
				 type: 'POST',
                 data : postData,
				  success: function(data, textStatus, jqXHR){   
							/* location.reload();   */  
							},
					error: function(jqXHR, textStatus, errorThrown){   
							console.log("error");
							}
         });
	 });
		 
		 //t3
		  $('.markAsComplete').click(function(){
			$('.markAsComplete').hide();  
			$('.completedCourse').show(); 
		 });
		 
	
		 
         //$('.notification-history').scrollTop($('.notification-history')[0].scrollHeight);
	 });
	
	var eventSource = new EventSource('http://localhost:7080/TolcProject/tickerNotification');
	eventSource.addEventListener('tickNotifcication',function(event){
		console.log(event.data)
		var objectData = JSON.parse(event.data);
		courseLevelOfTickerUpdate = objectData.courseLevel 
		console.log(objectData)
		console.log(courseLevelOfTickerUpdate)
		if(userId != objectData.employee.id){
				if(objectData.courseName == courseNameObtainedHere){
					if(courseLevelOfCurrentEmployee <= courseLevelOfTickerUpdate){
					setTimeout(function(){
					var newNotification = '<div class="notification-message clearfix animated" id="tickerUpdate' +counter +'"><img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32"><div class="notification-message-content clearfix"><div class="clickableFirstName" onclick="clickableFirstName(this)">'+ objectData.employee.firstName + "</div>	&nbsp;completed "+ objectData.topicName + " from the course "+ objectData.courseName +'<div class="getTickerUserId" hidden="hidden" style="display: none;">'+objectData.employee.id+'</div><span class="notification-time">'+ objectData.timeStamp +'</span></div></div><hr>'
					counter++;
					$(newNotification).prependTo('.notification-history').hide().slideDown(250);
					}, 50);
				}
			}
		}
	});

	</script>
</body>
</html>