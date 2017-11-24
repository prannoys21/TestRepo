<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Live Chat</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700">

<style type="text/css">
body {
	background: #e9e9e9;
	color: #9a9a9a;
	font: 100%/1.5em "Droid Sans", sans-serif;
	margin: 0;
}

a { text-decoration: none; }

fieldset {
	border: 0;
	margin: 0;
	padding: 0;
}

h4, h5 {
	line-height: 1.5em;
	margin: 4px 0px -15px 6px;
}

p {
    margin-left: 6px;
    font-size: 16px;
}

hr {
	background: #fecc5c36;
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
	width: 290px;
	margin-right: 350px;
}

#live-chat header {
	background: #293239;
	border-radius: 5px 5px 0 0;
	color: #fff;
	cursor: pointer;
    padding: 7px 12px 12px 10px;}

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
	color: white;
}

#live-chat h5 {
	font-size: 12px;
}

#live-chat form {
	padding: 17px;
}

#live-chat input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 8px;
	outline: none;
	width: 234px;
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
	height: 300px;
	padding: 8px 8px 0px 25px;
	overflow-y: scroll;
}

.chat-message {
	margin: 0px 0;
}

.chat-message img {
	border-radius: 50%;
	float: left;
	margin-left: -20px;
}

.chat-message-content {
	margin-left: 15px;
}

.chat-time {
	float: right;
	font-size: 10px;
}

.chat-feedback {
	font-style: italic;	
	margin: 0 0 0 80px;
}
.chatMessageWindowText {
	 margin-left: 6px;
    font-size: 11px;
}
</style>
<script type="text/javascript">
(function() {

	$('#live-chat header').on('click', function() {

		$('.chat').slideToggle(300, 'swing');
		$('.chat-message-counter').fadeToggle(300, 'swing');

	});

	$('.chat-close').on('click', function(e) {

		e.preventDefault();
		$('#live-chat').fadeOut(300);

	});

}) ();
</script>
</head>
<body>
<div id="live-chat">
		
		<header class="clearfix">
			
			<a href="#" class="chat-close">x</a>

			<div class="headerTitle"></div>


		</header>

		<div class="chat">
			
			<div class="chat-history" id="chat-history">
				
				<c:forEach var="chat" items="${allMessages}">
				<c:set var = "empId" value = "${chat.sender.id}"/>
				<c:set var = "messageWith999" value = "${chat.message}"/>
				<c:set var = "recipientOfTheMessage" value = "$( tickerDivId ).find('div.clickableFirstName').text()"/>
				<c:if test="${chat.sender.id == employee.id}">
				<c:if test="${chat.recipient.firstName == recipientOfTheMessage}">
				<div class="chat-message clearfix">
					<img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32">

					<div class="chat-message-content clearfix">
						
						<span class="chat-time">${chat.timeStamp}</span>

						<h5>${chat.sender.firstName}</h5>
					<c:set var = "finalMessageWithEmpId" value = "${fn:replace(messageWith999,999, empId)}" />

						<p class="chatMessageWindowText">${finalMessageWithEmpId}</p>

					</div> 
					
				</div>
				 <hr>
				 </c:if>
				 </c:if>
				</c:forEach>
				
				
			</div> <!-- end chat-history -->

<form:form action="sendMessageInCourse?id=${employee.id}" method="post" modelAttribute="chat" name="messageAddition" id="messageAddition"> 

					<input type="hidden" name="id"  path="id"/>
					<input type="hidden" name="sender" path="sender" id="sender" value="${employee.id}" />
					<input type="hidden" name="recipient" path="recipient" id="recipient" value="" />
					<input type="hidden" name="globalTopicName" path="globalTopicName" id="globalTopicName" value="" />
					<input type="hidden" name="globalCourseName" path="globalCourseName" id="globalCourseName" value="" />
					<input type="hidden" name="thisPageUrl" path="thisPageUrl" id="thisPageUrl" value="" />
					<input type="text" name="actualMessage" path="actualMessage" id="actualMessage" placeholder="Type your message…" autocomplete="off" autofocus/>
					
			</form:form>	
		
		</div> <!-- end chat -->

	</div> <!-- end live-chat -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	//wow//incourse
	var inCourseMessage =[];
	var firstNameFromTicker;
	var idFromTicker;
	var tickerDivId;
	 $(document).ready(function() {
		 //1
		 $("#live-chat").hide();
		 
		 //2
		 $(".getTickerUserId").hide();
		 
		 //3
		 $(document).on('click',".clickableFirstName", function(){
			tickerDivId = $(this).parent().parent().attr('id');
			tickerDivId = "#" + tickerDivId;
			//$('.chat').slideToggle(300, 'swing');
			//$('.chat-message-counter').fadeToggle(300, 'swing');
			$("#live-chat").show();
			firstNameFromTicker = $( tickerDivId ).find('div.clickableFirstName').text();
			firstNameFromTicker.replace(" ", "");
			$(".headerTitle").html("<h4>"+ firstNameFromTicker +"</h4>");
			idFromTicker=  $( tickerDivId ).find('div.getTickerUserId').text()
			$("#recipient").val(idFromTicker);
			$("#thisPageUrl").val(thisPageUrl);
			$("#globalTopicName").val(globalTopicName);
			$("#globalCourseName").val(globalCourseName);
			 var formURL = "../getInCourseSenderObject/"+userId+"/"+idFromTicker;
			 /* if(formURL.includes("algorithms")){
				 formURL.replace("algorithms/","");
			 } else if (formURL.includes("databases")){
				 formURL.replace("databases/","");
			 } else if (formURL.includes("operatingSystems")){
				 formURL.replace("operatingSystems/","");
			 } */
			/*  if(subTopic == true){
				 formURL = "../" + formURL;
			 } */
	         $.ajax({
	             url :  formURL,
				 type: 'GET',
	             data : null,
				  success: function(data, textStatus, jqXHR){ 
					  inCourseMessage=[];
					  $('#chat-history').empty()
					  		$.each(data, function(index, currRecipient) {
					  			inCourseMessage.push(currRecipient);
				         }); 
				  		  for(i=0;i<inCourseMessage.length;i++){
				  			var parsedMessage = inCourseMessage[i].message.replace(999, userId);
				  			if((inCourseMessage[i].sender.id == userId)) {
				  				inCourseMessage[i].sender.firstName = "You";
				  			}
				        	// console.log("crazy  "+  inCourseMessage[i].timeStamp + " " +   inCourseMessage[i].sender.firstName + " " + inCourseMessage[i].message);
				        	 if(inCourseMessage[i].message != ""){
				 				$('#chat-history').append('<div class="chat-message clearfix"><img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32"><div class="chat-message-content clearfix"><span class="chat-time">'+ inCourseMessage[i].timeStamp +'</span><h5>'+ inCourseMessage[i].sender.firstName +'</h5><p class="chatMessageWindowText">'+ parsedMessage +'</p></div></div><hr>')
				 			}
				 			$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
				 			$('input[type="text"], textarea').val('');
				         } 
					},
					error: function(jqXHR, textStatus, errorThrown){   
							console.log("error");
							}
	     		});	
		 });
		 
		 //4
		 $('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
		 //5
		$(".chat-close").click(function(){
				//e.preventDefault();
				//$('#live-chat').animate(300);
				$("#live-chat").hide();
		 }); 
		 
		 //6 
		 $('#messageAddition').submit(function(e) {
		     e.preventDefault();
			 var postData = $(this).serializeArray();
			 var formURL = $(this).attr("action");
			/*  if(subTopic == true){
				 formURL = "../" + formURL;
			 } */
		        $.ajax({
		            url : "../" + formURL,
				 type: 'POST',
		            data : postData,
				  success: function(data, textStatus, jqXHR){   
							/* location.reload();  */
							updateSenderWindow();
							
							},
					error: function(jqXHR, textStatus, errorThrown){   
							console.log("error");
							}
		    		});
		      
		        
		        
		        
				});
		 
		 
		 //7
     $('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
		 
		 
		 
	 });
	 
	 //8
	 function updateSenderWindow(){
		  formURL = "../getInCourseSenderObject/"+userId+"/"+idFromTicker;
		  /* if(subTopic == true){
				 formURL = "../" + formURL;
			 } */
	        $.ajax({
	             url : formURL,
				 type: 'GET',
	             data : null,
				  success: function(data, textStatus, jqXHR){ 
					  inCourseMessage=[];
					  $('#chat-history').empty()
					  		$.each(data, function(index, currRecipient) {
					  			inCourseMessage.push(currRecipient);
				         }); 
				  		  for(i=0;i<inCourseMessage.length;i++){
				  			var parsedMessage = inCourseMessage[i].message.replace(999, userId);
				  			if((inCourseMessage[i].sender.id == userId)) {
				  				inCourseMessage[i].sender.firstName = "You";
				  			}
				        	// console.log("crazy  "+  inCourseMessage[i].timeStamp + " " +   inCourseMessage[i].sender.firstName + " " + inCourseMessage[i].message);
				        	 if(inCourseMessage[i].message != ""){
				 				$('#chat-history').append('<hr><div class="chat-message clearfix"><img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32"><div class="chat-message-content clearfix"><span class="chat-time">'+ inCourseMessage[i].timeStamp +'</span><h5>'+ inCourseMessage[i].sender.firstName +'</h5><p class="chatMessageWindowText">'+ parsedMessage +'</p></div></div><hr>')
				 			}
				 			$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
				 			$('input[type="text"], textarea').val('');
				         } 
					},
					error: function(jqXHR, textStatus, errorThrown){   
							console.log("error");
							}
	     		});	
	 }
	 
	 var userId = ${employee.id};
		var eventSource = new EventSource('http://localhost:7080/TolcProject/inCoursechatMessages');
		eventSource.addEventListener('inCourseChatAdd',function(event){
			console.log(event.data)
			var objectData = JSON.parse(event.data);
			console.log(objectData)
			var parsedMessage = objectData.message.replace(999, userId);
			if(objectData.sender.id == userId) {
				objectData.sender.firstName = "You";
  			}
			$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
			if(objectData.message != ""){
				if(objectData.sender.id == idFromTicker && objectData.recipient.id == userId){
					$('#chat-history').append('<hr><div class="chat-message clearfix"><img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32"><div class="chat-message-content clearfix"><span class="chat-time">'+ objectData.timeStamp +'</span><h5>'+ objectData.sender.firstName +'</h5><p class="chatMessageWindowText">'+ parsedMessage +'</p></div></div><hr>')
				}
			}
			$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
			$('input[type="text"], textarea').val('');
		});

		$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
		
		//Again
		//3
		 $(document).on('click',".clickableFirstName", function(){
			tickerDivId = $(this).parent().parent().attr('id');
			tickerDivId = "#" + tickerDivId;
			//$('.chat').slideToggle(300, 'swing');
			//$('.chat-message-counter').fadeToggle(300, 'swing');
			$("#live-chat").show();
			firstNameFromTicker = $( tickerDivId ).find('div.clickableFirstName').text();
			firstNameFromTicker.replace(" ", "");
			$(".headerTitle").html("<h4>"+ firstNameFromTicker +"</h4>");
			idFromTicker=  $( tickerDivId ).find('div.getTickerUserId').text()
			$("#recipient").val(idFromTicker);
			$("#thisPageUrl").val(thisPageUrl);
			$("#thisPageUrl").val(thisPageUrl);
			$("#globalTopicName").val(globalTopicName);
			$("#globalCourseName").val(globalCourseName);
			 var formURL = "../getInCourseSenderObject/"+userId+"/"+idFromTicker;
			 /* if(formURL.includes("algorithms")){
				 formURL.replace("algorithms/","");
			 } else if (formURL.includes("databases")){
				 formURL.replace("databases/","");
			 } else if (formURL.includes("operatingSystems")){
				 formURL.replace("operatingSystems/","");
			 } */
			/*  if(subTopic == true){
				 formURL = "../" + formURL;
			 } */
	         $.ajax({
	             url :  formURL,
				 type: 'GET',
	             data : null,
				  success: function(data, textStatus, jqXHR){ 
					  inCourseMessage=[];
					  $('#chat-history').empty()
					  		$.each(data, function(index, currRecipient) {
					  			inCourseMessage.push(currRecipient);
				         }); 
				  		  for(i=0;i<inCourseMessage.length;i++){
				  			var parsedMessage = inCourseMessage[i].message.replace(999, userId);
				  			if((inCourseMessage[i].sender.id == userId)) {
				  				inCourseMessage[i].sender.firstName = "You";
				  			}
				        	// console.log("crazy  "+  inCourseMessage[i].timeStamp + " " +   inCourseMessage[i].sender.firstName + " " + inCourseMessage[i].message);
				        	 if(inCourseMessage[i].message != ""){
				 				$('#chat-history').append('<hr><div class="chat-message clearfix"><img src="https://image.ibb.co/mhsTqb/anonymous.jpg" alt="" width="32" height="32"><div class="chat-message-content clearfix"><span class="chat-time">'+ inCourseMessage[i].timeStamp +'</span><h5>'+ inCourseMessage[i].sender.firstName +'</h5><p class="chatMessageWindowText">'+ parsedMessage +'</p></div></div><hr>')
				 			}
				 			$('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
				 			$('input[type="text"], textarea').val('');
				         } 
					},
					error: function(jqXHR, textStatus, errorThrown){   
							console.log("error");
							}
	     		});	
		 });
		 
	</script>
</body>
</html>