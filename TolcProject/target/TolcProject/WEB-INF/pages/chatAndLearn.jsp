<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta charset="UTF-8">
<title>Chat N Learn</title>
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

p { margin: 0; }

.clearfix { *zoom: 1; } /* For IE 6/7 */
.clearfix:before, .clearfix:after {
    content: "";
    display: table;
}
.clearfix:after { clear: both; }

/* ---------- LIVE-CHAT ---------- */

#live-chat {
	bottom: 0;
	font-size: 12px;
	right: 24px;
	position: fixed;
	width: 97%;
	height:89%;
}

#live-chat header {
	background: #293239;
	border-radius: 5px 5px 0 0;
	color: #fff;
	cursor: pointer;
	padding: 7px 9px 9px 5px;
	
}

#live-chat h4:before {
	background: #1a8a34;
	border-radius: 50%;
	content: "";
	display: inline-block;
	height: 8px;
	margin: 0 8px 0 0;
	width: 8px;
}

#live-chat h4 {
	font-size: 12px;
	
}

#live-chat h5 {
	font-size: 11px;
	color: #2b8cbe;
	
}

#live-chat form {
	padding: 9px;
}

#live-chat input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 8px;
	outline: none;
	width: 97%;
}

.chat-message-counter {
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

.chat-close {
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

.chat {
	background: #fff;
}

.chat-history {
	height: 400px;
	padding: 8px 11px;
	overflow: auto;
}

.chat-message {
	margin: 2px 0px 0px 0px;
}

.chat-message img {
	border-radius: 20%;
	float: left;
}

.chat-message-content {
	margin-left: 45px;
}

.chat-time {
	float: right;
	font-size: 9px;
}

.chat-feedback {
	font-style: italic;	
	margin: 0 0 0 80px;
}

.aclass{
    background: #2ecc71;
    width: 170px;
    padding: 6px;
    color: white;
    border-radius: 5px;
    border: #27ae60 1px solid;
    margin-top: 20px;
    float: left;
    margin-left: 35px;
    font-weight: 800;
    font-size: 0.8em;
    text-decoration: none;
}
}
</style>
</head>
<body>
<a class="aclass" href="userHomepage?id=${employee.id}">Go back to homepage </a><!-- End Btn2 -->

	<div id="live-chat">
		
		<header class="clearfix">
			
			<!-- <a href="#" class="chat-close">x</a> -->

			<h4>Chat N Learn</h4>

			<span class="chat-message-counter">3</span>

		</header>

		<div class="chat">
			
			<div class="chat-history" id="chat-history">
				
				<c:forEach var="chat" items="${allMessages}">
				 <c:set var = "empId" value = "${employee.id}"/>
				 <c:set var = "messageWith999" value = "${chat.message}"/>
				
				<hr>

				<div class="chat-message clearfix">
					
					<img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32">

					<div class="chat-message-content clearfix">
						
						<span class="chat-time">${chat.timeStamp}</span>

						<h5>${chat.employee.firstName}</h5>
					<c:set var = "finalMessageWithEmpId" value = "${fn:replace(messageWith999,999, empId)}" />

						<p>${finalMessageWithEmpId}</p>

					</div> 

				</div> 

				<hr> 
			</c:forEach>
			

			</div> <!-- end chat-history -->

			<!-- <p class="chat-feedback">Your partner is typing…</p> -->

			<form:form action="sendMessage?id=${employee.id}" method="post" modelAttribute="chat" name="messageAddition" id="messageAddition"> 

					<input type="hidden" name="id"  path="id"/>
					<input type="text" name="actualMessage" path="actualMessage" placeholder="Type your message…" autocomplete="off" autofocus/>
					
			</form:form>
		</div> <!-- end chat -->

	</div> <!-- end live-chat -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
		 $('#messageAddition').submit(function(e) {
             e.preventDefault();
			 var postData = $(this).serializeArray();
			 var formURL = $(this).attr("action");
             $.ajax({
                 url : formURL,
				 type: 'POST',
                 data : postData,
				  success: function(data, textStatus, jqXHR){   
							location.reload();    
							},
					error: function(jqXHR, textStatus, errorThrown){   
							console.log("error");
							}
         });
	 });
         $('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
	 });
	var userId = ${employee.id};
	var eventSource = new EventSource('chatMessages');
	eventSource.addEventListener('chatAdd',function(event){
		console.log(event.data)
		var objectData = JSON.parse(event.data);
		console.log(objectData)
		var parsedMessage = objectData.message.replace(999, userId)
		$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
		if(objectData.message != ""){
			$('#chat-history').append('<hr><div class="chat-message clearfix"><img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32"><div class="chat-message-content clearfix"><span class="chat-time">'+ objectData.timeStamp +'</span><h5>'+ objectData.employee.firstName +'</h5><p>'+ parsedMessage +'</p></div></div><hr>')
		}
		$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
	});

	$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
	var messageCount = ${messageCount}

	</script>
	    
    </body>
    </html>