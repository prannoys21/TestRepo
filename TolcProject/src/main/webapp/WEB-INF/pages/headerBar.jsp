<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta charset="UTF-8">
<style>
.img_resize_fit{
    max-width: 200%;
    max-height: 100%;
    margin-left: 74%;
}
.img {
    max-width: 50%;
    max-height: 1%;
}
.header {
	width: 100%; 
	height:56px; 
	position:fixed; 
	overflow: hidden; 
	background: #fd8d3c; 
	color: #9a9a9a; 
	box-shadow: 0px 3px 9px #888888; 
	font: 100%/1.5em Droid Sans sans-serif;
}
.headerInfo {
font: status-bar;
font-size: 25px;
color:black;
width: 90px;
float:right;
margin-right:26%;
margin-top:0.5%;
margin-left:2%;
}

.message {
background: #6baed6;
}

.message-history {
	
    height: 300px;
    padding: 8px 8px 0px 25px;
    overflow-y: scroll;
    width: 340px;
    float: right;
    margin-right: 20%;
    margin-top: 3%;
    overflow: scroll;
	
}

.message-request{
	margin: 11px;
}

.message-request-icon{
width: 100px;
float:right;
cursor: pointer;
}

.message-request-content {
	margin-left: 15px;
}

.message-request-time {
	font-size: 9px;
    float: right;
}

.messagefix {
font-size:14px;
}

.clickableMessageRequestName{
    font-size: 14px;
    color: #2B8CE8;
    float: left;
    font-weight: bold;
	cursor: pointer;
}
.keepItCenter{
text-align:left;
}
</style>
<title></title>
</head>

<body>
<div class="header">
	<div>
	    <a style="width:100px;float:left;" href="../userHomepage?id=${employee.id}">
	        <img src="https://image.ibb.co/cPU8qb/welearn.png" class="img_resize_fit"  alt="Learn"> 
	    </a>
	    <div class="headerInfo">${employee.firstName}</div>
	    <div class="message-request-icon"><img src="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-2/48/message-already-read-icon.png" class="img_resize_fit"  alt="Learn"></div>
	   
    </div>
</div>
 <!-- start chat-history -->
    <div class="message" id="message"> 
    	<div class="message-history" id="message-history">
    	<c:set var="messageCounter" value="${0}" scope="request"/>
    	<c:set var="messageCounter" value="${messageCounter+1}" scope="request"/>
    		<div class="message-request messagefix" id="message-request${messageCounter}">
				<div class="message-request-content messagefix">
					<div class="clickableMessageRequestName">objectData.sender.firstName</div> wants to chat with you!
					<div class="getMessageRequestSenderId" style="display:none;">objectData.sender.id</div>
				<span class="message-request-time">objectData.timeStamp</span>
				</div>
				 <hr>
			</div> 
		</div>
	</div>
	<!-- end chat-history -->

 <script type="text/javascript">
 $(document).on('click',".clickableMessageRequestName", function(){
	 messageRequestDivId = $(this).parent().parent().attr('id');
	 messageRequestDivId = "#" + messageRequestDivId;
		$("#live-chat").show();
		firstNameFromMessageRequest = $( messageRequestDivId ).find('div.clickableMessageRequestName').text();
		firstNameFromMessageRequest.replace(" ", ""); 
		$(".headerTitle").html("<h4>"+ firstNameFromMessageRequest +"</h4>");
		idFromMessageRequestDiv=  $( messageRequestDivId ).find('div.getMessageRequestSenderId').text()
		$("#recipient").val(idFromTicker);
		$("#thisPageUrl").val(thisPageUrl);
		$("#globalTopicName").val(globalTopicName);
		$("#globalCourseName").val(globalCourseName);
		 var formURL = "../getInCourseSenderObject/"+userId+"/"+idFromMessageRequestDiv;
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