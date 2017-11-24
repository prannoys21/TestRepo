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
    margin-top: 3%;
}
.img {
    max-width: 50%;
    max-height: 1%;
}
.header2 {
	width: 96%; 
	height:56px; 
	position:fixed; 
	overflow: hidden; 
	/* background: #fd8d3c; */ 
	/* color: #9a9a9a; */ 
	box-shadow: 0px 3px 9px #888888; 
	font: 100%/1.5em Droid Sans sans-serif;
}
.headerInfo {
font: status-bar;
font-size: 25px;
color:white;
width: 90px;
float:left;
margin-right:0%;
margin-top: 1.95%;
margin-left: 14%;
cursor: pointer;
}

.message {
/* background: #6baed6; */
}

.message-history {
	
    /* height: 300px;
    padding: 8px 8px 0px 25px;
    width: 340px;
    float: right;
    margin-right: 10%;
     */
   /*  background: rgba(0, 0, 0, 0.75);
    color: #a6a6a6;
    height: 300px;
    padding: 8px 8px 0px 25px;
    position: fixed;
    width: 340px;
    margin-right: 10%;
    z-index: 10001;
    float:right;
    overflow: auto; */
        background: rgba(0, 0, 0, 0.75);
    color: #a6a6a6;
    height: 300px;
    padding: 0px 0px 4px 4px;
    /* position: fixed; */
    width: 340px;
    margin-right: 10%;
    z-index: 10001;
    float: right;
    overflow: auto;
	
}

.message-request{
	margin: 11px;
}

.message-request-icon{
width: 100px;
float:left;
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
.iconAndName {
    margin-left: 74%;
}
</style>
<title></title>
</head>

<body>
<!-- <div class="header2"> -->
	<!-- <div> -->
	    <a style="width:100px;float:left;" href="../userHomepage?id=${employee.id}">
	        <!-- <img src="https://image.ibb.co/cPU8qb/welearn.png" class="img_resize_fit"  alt="Learn"> --> 
	    </a>
	    <div class="iconAndName">
	    <div id="message-request-icon" class="message-request-icon"><img id="messageRqstIcon"src="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-2/48/new-message-icon.png" class="img_resize_fit"  alt="Learn"></div>
	    <div class="headerInfo">${employee.firstName}</div>
	    </div>
	    <a href="#menu" class="toggle" style="margin-right: 2%;"><span>Menu</span></a>
	    <br>
	    <!-- start chat-history -->
    <div class="message" id="message"> 
    	<div class="message-history" id="message-history">
    	<c:set var="messageCounter" value="${0}" scope="request"/>
    	<c:forEach var="messageRequest" items="${messageRequestsListRefined}">
    	<c:set var="messageCounter" value="${messageCounter+1}" scope="request"/>
    		<div class="message-request messagefix" id="message-request${messageCounter}">
				<div class="message-request-content messagefix">
					<div class="clickableMessageRequestName">${messageRequest.sender.firstName}</div> wants to chat with you!
					<div class="getMessageRequestSenderId" style="display:none;">${messageRequest.sender.id}</div>
				&nbsp; &nbsp; <span class="message-request-time">${messageRequest.timeStamp}</span>
				</div>
				 <hr>
			</div> 
		</c:forEach>
		</div>
	</div>
	<!-- end chat-history -->
	   
    <!-- </div> -->
<!-- </div> -->

 <script type="text/javascript">
 //1
 $(document).on('click',".clickableMessageRequestName", function(){
	 messageRequestDivId = $(this).parent().parent().attr('id');
	 messageRequestDivId = "#" + messageRequestDivId;
		$("#live-chat").show();
		firstNameFromMessageRequest = $( messageRequestDivId ).find('div.clickableMessageRequestName').text();
		firstNameFromMessageRequest.replace(" ", ""); 
		$(".headerTitle").html("<h4>"+ firstNameFromMessageRequest +"</h4>");
		idFromMessageRequestDiv=  $( messageRequestDivId ).find('div.getMessageRequestSenderId').text()
		$("#recipient").val(idFromMessageRequestDiv);
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