<%@page import="dao.ApiController"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
div#usertime {
 
    margin-top: 1px;

   
    color:#ff7f66;
}
div#admintime {
    margin-top: 1px;
    margin-left: 3px;
    color: grey;
}

.col-cn {
    margin: 0 auto;
}
.d-flex.flex-row.align-items-center.justify-content-between a {
    background-color: #f76c51;
    padding: 10px 26px;
    border-radius: 5px;
    color: #fff;
    margin: 0 auto;
    text-align: center;
    margin-top: 15px;
    display: block;
    margin-bottom: 43px;
}

#chatform_send {
    /*background-color: #f76c51;*/
    padding: 10px 26px;
    border-radius: 5px;
    color: #fff;
    margin: 0 auto;
    text-align: center;
    margin-top: 15px;
    display: block;
    margin-bottom: 43px;
}
.title_top {
    color: #8e8e8e;
    font-size: 18px;
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
        margin-top: 10px;
}

.logo {
    color: #f76c51;
    font-size: 20px;
    font-weight: 800;
    text-align: center;
    padding-top: 50px;
}


.card{
  border: 0.40rem solid #f8f9fa;
  top: 10%;
}
.form-control{    margin-top: 10px;
  background-color: #f8f9fa;
  padding: 20px;
  padding: 25px 15px;
  margin-bottom: 1.3rem;
}

.form-control:focus {

    color: #000000;
    background-color: #ffffff;
    border: 3px solid #da5767;
    outline: 0;
    box-shadow: none;

}

.btn{
  padding: 0.6rem 1.2rem;
  background: #da5767;
  border: 2px solid #da5767;
}
.btn-primary:hover {

    
    background-color: #df8c96;
    border-color: #df8c96;
  transition: .3s;

}


*:focus {
    outline: none !important;
}

.input-group .material-icons svg {
    width: 26px;
    height: 26px;
}
.btn.btn-info.btn-lg {
    position: relative;
    left: 55em;
    top: 20px;
}
  .btn.btn-info.btn-lg {
    background: #f76c51;
    width: 53px;
    height: 50px;
    border-radius: 24px;
    border: none;
    box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.rp {
    background-color: #f76c51;
    display: block;
    padding: 10px;
}
  .col-lr {
    padding-left: 0px;
    padding-right: 0px;
}
.col-rm {
    padding-left: 0px;
}
.col-cm .btn.btn-primary.dropdown-toggle {
    float: right;
    padding-top: 0px;
}
.col-cm {
    padding-right: 0;
}
.modal-header {
    padding: 0px;
    border-bottom: 0px solid #e5e5e5;
    float: left;
    margin-left: 30px;
    margin-top: 6px;
}
.btn-primary {
    color: #fff;
    background-color: transparent;
    border-color: transparent;
}
.btn-primary:hover {
    color: #fff;
    background-color: transparent;
    border-color: transparent;
}
.btn-primary.active, .btn-primary:active, .open>.dropdown-toggle.btn-primary {
    color: #fff;
    background-color: transparent !important;
    background-image: none;
    border-color: transparent !important;
}
.modal-header .close {
    margin-top: -10px;
    font-size: 30px;
    color: #000 !important;
}
.fa-ellipsis-v:before {
    content: "\f142";
    font-size: 20px;
}
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
    top: 46px;
}


.main-card {
  background:white;
  color:white;
  width: 80%;
  height: calc(100% - 32px);
  margin: 16px auto;
  border-radius: 8px;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  display:flex;
  flex-direction:column;
  overflow: hidden;
}


.main-title {
    background-color: #ff7f66;
    font-size: large;
    font-weight: bold;
    padding-top: 20px;
    padding-bottom: 10px;
}
.main-title svg{
  height: 16px;
   margin: 0px 8px
}

.chat-area {
  flex-grow: 1;
  overflow: auto;
  border-radius: 8px;
  padding: 16px;
  display: flex;
  flex-direction: column;
}
.input-message {
  padding: 8px 24px;
  flex-grow: 1;
  margin: 0px 8px 0px 0px;
  border-radius: 24px;
  border: none;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  color: #000;
}
.input-message:focus{
  outline :none;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
}
.input-div {
  height: 48px;
  width: calc(100% - 32px);
  margin-bottom: 44px;
  display: flex;
  
}

.input-send {
  background :#ff7f66;
  width: 48px;
  height: 48px;
  border-radius: 24px;
  border: none;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.input-send:hover{
  cursor:pointer;  
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
}
.input-send svg{
  fill:white;
  margin:11px 8px;
}
.chat-message-div {
  display: flex;
}

.chat-message {
  background-color: white;
  margin: 8px 16px;
  padding: 16px 24px;
  animation-name: fadeIn;
  animation-iteration-count: 1;
  animation-timing-function: ease-in;
  animation-duration: 100ms;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.11);
  color:black;
  border-radius: 50px;
}
.chat-response-message {
  background-color: #ff7f66;
  margin: 8px 16px;
  padding: 16px 24px;
  animation-name: fadeIn;
  animation-iteration-count: 1;
  animation-timing-function: ease-in;
  animation-duration: 100ms;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.11);
  color:black;
  border-radius: 50px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}
::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
::-webkit-scrollbar-thumb {
  background: #888; 
}

::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  

 <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>

<script>
  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyCQ8_qoEK_8VPvmxfVL_0l74-XJqNeNkCw",
    authDomain: "vnsdmmtestchatbot.firebaseapp.com",
    databaseURL: "https://vnsdmmtestchatbot.firebaseio.com",
    projectId: "vnsdmmtestchatbot",
    storageBucket: "vnsdmmtestchatbot.appspot.com",
    messagingSenderId: "56333904124",
    appId: "1:56333904124:web:007d1585b541ebc5050f79",
    measurementId: "G-94V9SY89TM"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>

 <%

InetAddress localhost = InetAddress.getLocalHost(); 

String localip=(localhost.getHostAddress()).trim();

// Find public IP address 

String systemipaddress = ""; 

try

{ 

    URL url_name = new URL("http://bot.whatismyipaddress.com"); 

    BufferedReader sc = new BufferedReader(new InputStreamReader(url_name.openStream())); 

    systemipaddress = sc.readLine().trim(); 

} 

catch (Exception e) 

{ 

    systemipaddress = "Cannot Execute Properly"; 

} 

///out.println(localip+systemipaddress);

//String uipddress=(localip+systemipaddress).replace(".", "");

session.setMaxInactiveInterval(30*60);
/*SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
Date date = new Date();
System.out.println(formatter.format(date));
String uipddress=formatter.format(date).toString();*/
String uipddress=session.getId();

ApiController apiController=new ApiController();
boolean check=apiController.checkChatInitiatedOrNot(uipddress);
HttpSession admin_session = request.getSession(false);
System.out.println("chatidbysession==="+admin_session.getAttribute("chatid"));
boolean session_check=false;
if(admin_session.getAttribute("chatid")!=null){
	session_check=true;
}

 %>
 <input type="hidden" id="chatid" value="<%=uipddress%>">
  <input type="hidden" id="chatidbysession" value="<%=session_check%>">
 
 <div id="checkvalue" style="display:none">
 
 </div>
 <script type="text/javascript">
 function checkLastMessageTime(){
	 var chatid=document.getElementById('chatid').value;
	 //////alert("working function==11");
	 checkTime(chatid);
	 
	
 }
 $(document).ready(function(){
	    myVar = setInterval("checkLastMessageTime()", 100000);
	});
 </script>
</head>
<body onload="checkCondition(<%=check%>,<%=session_check%>)">


<div class="container" id="chatbox" style="display:none">
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#ChatMsgs" id="chatModal"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
     <div class="modal fade" id="ChatMsgs" role="dialog">
    <div class="modal-dialog">
         
<div class="main-card">
  <div class="main-title">
    <div class="col-md-4">VNS.DMM</div>
    <div class="col-md-3 col-cm">Hi there &nbsp;<i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
    <div class="col-md-4 col-cm">
      <div class="dropdown">
         <!-- <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
        </button>
        <ul class="dropdown-menu">
          <li><a href="#">D1</a></li>
          <li><a href="#">D2</a></li>
          <li><a href="#">D3</a></li>
        </ul>-->
      </div>
    </div>


    <div class="col-md-5 col-rm">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
    </div>
    
  </div>
<div class="col-md-12 col-sm-12 col-lr">
      <span class="rp"><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;We reply immediately</span>
    </div>
  <div class="chat-area" id="message-box">
  </div>
 

 <!--  <div class="col-md-12 col-sm-12">
<button type="button" class="material-icons ripple fade-appear-done fade-enter-done" aria-label="Attach file button" style="color: rgb(0, 125, 252);"><svg id="ic_attachFile" fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5c0-1.38 1.12-2.5 2.5-2.5s2.5 1.12 2.5 2.5v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5c0 1.38 1.12 2.5 2.5 2.5s2.5-1.12 2.5-2.5V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z"></path><path d="M0 0h24v24H0z" fill="none"></path></svg></button>



 </div>-->
  <div class="input-div">
    <input class="input-message" name="message" type="text" id="message" />
    <button class="input-send" onclick="send()">
   <svg style="width:24px;height:24px">
    <path d="M2,21L23,12L2,3V10L17,12L2,14V21Z" />
    </svg>
    </button>
  </div>
</div>
 </div>
  </div>
  
</div>
<!-- ------------------formmmmmmmm -->
<div class="container" id="chatFirstForm" style="display:none">
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#ChatFormm"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
     <div class="modal fade" id="ChatFormm" role="dialog">
    <div class="modal-dialog">
         
<div class="main-card">
  <div class="main-title">
    <div class="col-md-4">VNS.DMM</div>
    <div class="col-md-3 col-cm">Hi there &nbsp;<i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
    <div class="col-md-4 col-cm">
      <div class="dropdown">
         <!-- <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
        </button>
       <ul class="dropdown-menu">
          <li><a href="#">D1</a></li>
          <li><a href="#">D2</a></li>
          <li><a href="#">D3</a></li>
        </ul> -->
      </div>
    </div>


    <div class="col-md-5 col-rm">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
    </div>
    
  </div>
<div class="col-md-12 col-sm-12 col-lr">
      <span class="rp"><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;We reply immediately</span>
    </div>
  
 
  <div class="col-sm-12 col-md-12">
    <div class="logo" style="padding-top:20px !important;">VNS.DMM</div>
    <h1 class="title_top">Please introduce yourself:</h1>

 </div>

 <div class="col-sm-10 col-md-10 col-cn">
      <div class="card-body py-md-4">
       <form _lpchecked="1">
       <div class="form-group">
             <input type="name" class="form-control" id="name_in_form" placeholder="enter your name">
        </div>
        <div class="form-group">
             <input type="email" class="form-control" id="email_in_form" placeholder="enter your email">
        </div>                                                 
       <div class="form-group">
         <input type="text" class="form-control" id="phone_in_form" placeholder="Enter your phone">
       </div>
       <div class="form-group">
             <input type="message" class="form-control" id="message_in_form" placeholder="enter your message">
        </div>
       
      <!-- <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">&nbsp;<b style="color: #868686;
    font-weight: 500;">Sign up for our newsletter</b> --> 
     </form>
       <div class="d-flex flex-row align-items-center justify-content-between">
         <button id="chatform_send" onclick="sendByForm()">Send</button>
        </div>
      
     </div>
</div>
</div>
 </div>
  </div>
  
</div>

</body>
<style>
*:focus {
    outline: none !important;
}
.flex-row #chatform_send {
    background-color: #f35255;
    width: 100%;
    font-size: 15px;
    margin-bottom: 50px;
}
#chatform_send {
    
    padding: 10px 8px;
    border-radius: 5px;
    color: #fff;
    margin: 0 auto;
    text-align: center;
    margin-top: 15px;
    display: block;
    margin-bottom: 0px;
    border: 0px solid;
    font-size: 15px;
}
.input-group .material-icons svg {
    width: 26px;
    height: 26px;
}
.btn.btn-info.btn-lg {
    position: relative;
    left: 55em;
    top: 20px;
}
  .btn.btn-info.btn-lg {
    background: #f76c51;
    width: 53px;
    height: 50px;
    border-radius: 24px;
    border: none;
    box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.rp {
    background-color: #f76c51;
    display: block;
    padding: 10px;
}
  .col-lr {
    padding-left: 0px;
    padding-right: 0px;
}
.col-rm {
    padding-left: 0px;
}
.col-cm .btn.btn-primary.dropdown-toggle {
    float: right;
    padding-top: 0px;
}
.col-cm {
    padding-right: 0;
}
.modal-header {
    padding: 0px;
    border-bottom: 0px solid #e5e5e5;
    float: left;
    margin-left: 30px;
    margin-top: 6px;
}
.btn-primary {
    color: #fff;
    background-color: transparent;
    border-color: transparent;
}
.btn-primary:hover {
    color: #fff;
    background-color: transparent;
    border-color: transparent;
}
.btn-primary.active, .btn-primary:active, .open>.dropdown-toggle.btn-primary {
    color: #fff;
    background-color: transparent !important;
    background-image: none;
    border-color: transparent !important;
}
.modal-header .close {
    margin-top: -10px;
    font-size: 30px;
    color: #000 !important;
}
.fa-ellipsis-v:before {
    content: "\f142";
    font-size: 20px;
}
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
    top: 46px;
}


.main-card {
  background:white;
  color:white;
  width: 80%;
  height: calc(100% - 32px);
  margin: 16px auto;
  border-radius: 8px;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  display:flex;
  flex-direction:column;
  overflow: hidden;
}


.main-title {
    background-color: #ff7f66;
    font-size: large;
    font-weight: bold;
    padding-top: 20px;
    padding-bottom: 10px;
}
.main-title svg{
  height: 16px;
   margin: 0px 8px
}

.chat-area {
  flex-grow: 1;
  overflow: auto;
  border-radius: 8px;
  padding: 16px;
  display: flex;
  flex-direction: column;
}
.input-message {
  padding: 8px 24px;
  flex-grow: 1;
  margin: 0px 8px 0px 0px;
  border-radius: 24px;
  border: none;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  color: #000;
}
.input-message:focus{
  outline :none;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
}
.input-div {
  height: 48px;
  width: calc(100% - 32px);
  margin: 16px;
  display: flex;
}

.input-send {
  background :#ff7f66;
  width: 48px;
  height: 48px;
  border-radius: 24px;
  border: none;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.input-send:hover{
  cursor:pointer;  
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
}
.input-send svg{
  fill:white;
  margin:11px 8px;
}
.chat-message-div {
  display: flex;
}

.chat-message {
  background-color: white;
  margin: 8px 16px;
  padding: 16px 24px;
  animation-name: fadeIn;
  animation-iteration-count: 1;
  animation-timing-function: ease-in;
  animation-duration: 100ms;
  box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.11);
  color:black;
  border-radius: 50px;
  word-break: break-word;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}
::-webkit-scrollbar {
  width: 10px;
}
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
::-webkit-scrollbar-thumb {
  background: #888; 
}

::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
</style>

		 <script>

 



  var databaseRef = firebase.database().ref('messageuser/<%=uipddress%>/');



  var rowIndex = 1;

  var rowIndex1 = 1;

  

 window.checkfirst=true;

  

 databaseRef.once('value', function(snapshot) {

	  

    snapshot.forEach(function(childSnapshot) {

    


    	var childKey = childSnapshot.key;

		var childData = childSnapshot.val();
  var userid=childData.userid;
		  if(userid==1){
			  addMsg(childData.message,childData.time);
			  //////alert("1111111111");


		  }else{
			  addResponseMsg(childData.message,childData.time);
			  //////alert("0000000000");
		  }
    });

    window.checkfirst=false;

  });



		databaseRef.orderByChild('timestamp').limitToLast(1).on("value", function(snapshot) {

		//	//////alert("nnnnn22==>"+window.checkfirst);
			  snapshot.forEach(function(childSnapshot) {

				  var childKey = childSnapshot.key;

				  var childData = childSnapshot.val();
				 //  window.uchildKey=childKey;
				  var userid=childData.userid;

				  if(window.checkfirst==false){
       
					 

					  if(userid==1){

						//  addMsg(childData.message);
		 

					  }else{

						  addResponseMsg(childData.message,childData.time);
						  //////alert("00000000000222222222");
					    	

					  }
					 /* if(window.uchildKey==window.uchildKey1){
						  
					  }else{
					  window.uchildKey1=childKey;
					  }*/
				  }



				    });

			  

			 

			});

		

  function savemessage(message){

	  

	   if(message.trim()==''){

		  alert("Please Fill the blank"); 

	   }else{


		   var chatid=document.getElementById('chatid').value;
		  updateDb(chatid);
		  
		   var uid = firebase.database().ref().child('messageuser/<%=uipddress%>').push().key;
		   alert("uid=="+uid);

		   var currentdate = new Date(); 

		   var datetime =  currentdate.getFullYear() + "/"

				           + (currentdate.getMonth()+1)  + "/" 
				
				           + currentdate.getDate() + " "  
				
				           + currentdate.getHours() + ":"  
				
				           + currentdate.getMinutes() + ":" 
				
				           + currentdate.getSeconds();
			var d = Date.parse(datetime)+"";
			var hr=currentdate.getHours();
			var mins=currentdate.getMinutes();
			if(hr.toString().length==1){
				hr='0'+hr.toString();
			}if(mins.toString().length==1){
				mins='0'+mins.toString();
			}
			var time=hr+':'+mins;
		   var data = {

			userid: 1,
			message: message,
			datetime:datetime,
		    datetime1:d,
		    status:0,
		    default_msg:0,
		    admin_id:'none',
		    time:time

		   }

		   

		   var updates = {};

		   updates['/messageuser/<%=uipddress%>/' + uid] = data;

		   firebase.database().ref().update(updates);

		   document.getElementById('message').value="";

		//   //////alert('The user is created successfully!');

	   }

  }

  

  function reload_page(){

   window.location.reload();

  }

  

 </script>

  <script type="text/javascript">

 	function sendbtnclick() {

 		document.getElementById("sendbtnid").style.display = "none";

 		document.getElementById("msgDivId").style.display = "block";

	}

 	function hideMsgFnc() {

 		document.getElementById("msgDivId").style.display = "none";

 		document.getElementById("sendbtnid").style.display = "block";

	}
 	

 </script>
 <script type="text/javascript">
 function validateform()
	{
		
		var email = document.getElementById("inputEmail").value;
		
		
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(email.match(mailformat))
	{
		
	}
	else
	{
	//////alert("You have entered an invalid email address!");
	document.getElementById("inputEmail").focus();
	return false;
	}

	
	}
 </script>
 <script>
 function sendByForm() {
	  //alert("sendByForm");
      
	  var message=document.getElementById('message_in_form').value;
       //////alert("msg==="+msg);
       if (message == ""){
           return
       }else{
      // running = true
      var d = new Date();
      var time=d.getHours()+':'+d.getMinutes();
       addMsg(message,time)
       window.setTimeout(savemessageByForm, 800, message)
       }
   }
 </script>
<script>
  var running = false
    function send() {
	  //////alert("nn");
       
        var msg = document.getElementById("message").value
        //////alert("msg==="+msg);
        if (msg == ""){
            return
        }else{
       // running = true
         var d = new Date();
      var time=d.getHours()+':'+d.getMinutes();
        addMsg(msg,time)
        window.setTimeout(savemessage, 800, msg)
        }
    }
    function addMsg(msg,time) {
        var div = document.createElement("div");
        div.innerHTML = "<span style='flex-grow:1'></span><div class='chat-message' id='usermsg'>" + msg + "</div>"
        div.className = "chat-message-div"
        document.getElementById("message-box").appendChild(div)
         var div = document.createElement("div");
       
        div.innerHTML = "<div id='usertime'>" + time + "</div>"
       
        	document.getElementById("usermsg").appendChild(div)
        	
        //alert("addMsg");
    }
     function addResponseMsg(msg,time) {
        var div = document.createElement("div");
        div.innerHTML = "<div class='chat-response-message' id='admin_msg'>" + msg + "</div>"
        div.className = "chat-message-div"
        document.getElementById("message-box").appendChild(div)
        var time_div = document.createElement("div");
       
        time_div.innerHTML = "<div id='admintime'>" + time + "</div>"
        time_div.setAttribute("style", "color: green; align:center;");
       
        	document.getElementById("admin_msg").appendChild(time_div)
        	
        running = false
    }
    document.getElementById("message").addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            send()
        }
    });
</script>
<script>
function checkCondition(check,session_check){
	//////alert("condition==="+check);
	if(session_check){
		if(check==true){
			document.getElementById("chatbox").style.display='block';
		}else if(check==false){
			document.getElementById("chatFirstForm").style.display='block';

		}
	}else{
		document.getElementById("chatFirstForm").style.display='block';
	}
	
	console.log("check==="+check);
}
</script>
<script>
function savemessageByForm(message){

	//alert("savemessageByForm");
	  var name=document.getElementById('name_in_form').value;
	  var email=document.getElementById('email_in_form').value;
	  var phone=document.getElementById('phone_in_form').value;

	   if(message.trim()==''){

		  alert("Please Fill the blank"); 

	   }else{
		 var chatid=document.getElementById('chatid').value

		   
		   saveInDb(name,email,phone,message,chatid);	
		   var uid = firebase.database().ref().child('messageuser/<%=uipddress%>').push().key;

		   var currentdate = new Date(); 

		   var datetime =  currentdate.getFullYear() + "/"

				           + (currentdate.getMonth()+1)  + "/" 
				
				           + currentdate.getDate() + " "  
				
				           + currentdate.getHours() + ":"  
				
				           + currentdate.getMinutes() + ":" 
				
				           + currentdate.getSeconds();
			var d = Date.parse(datetime)+"";
			var hr=currentdate.getHours();
			var mins=currentdate.getMinutes();
			if(hr.toString().length==1){
				hr='0'+hr.toString();
			}if(mins.toString().length==1){
				mins='0'+mins.toString();
			}
			var time=hr+':'+mins;
			
		   var data = {

			userid: 1,
			message: message,
			datetime:datetime,
		    datetime1:d,
		    status:0,
		    default_msg:0,
		    admin_id:'none',
		    time:time

		   }

		   

		   var updates = {};

		   updates['/messageuser/<%=uipddress%>/' + uid] = data;

		   firebase.database().ref().update(updates);

		   document.getElementById('message').value="";
		   var chatidd=document.getElementById('chatid').value;
		   ////alert("chatidddddd=="+chatidd);
		   sendDefaultMessageByAdmin(chatidd,name);
		//   //////alert('The user is created successfully!');

	   }

}

</script>
<script>
function saveInDb(name,email,phone,usermessage,chatid){
	//alert("saveInDb");
	 $(document).ready(function() {
	        
	        
	        $.ajax({
	        url: "save_chat_initiate_details.jsp?action=save",
	        type: "post",
	        data: {
	        	name:name,
	        	email:email,
	        	phone:phone,
	        	usermessage:usermessage,
	        	chatid:chatid,
	        	
	        	
	        success : function(data){
	       //alert("saveInDb== saved");
	        	//document.getElementById("chatform").reset();
	    		//document.getElementById("chatbot").style.display='block';
	        }
	        }
	        });
	        
	        });	
}
</script>
<script>
function updateDb(chatid){
	//alert("working==="+chatid);
	 $(document).ready(function() {
	        
	        
	        $.ajax({
	        url: "save_chat_initiate_details.jsp?action=updateByUser",
	        type: "post",
	        data: {
	        	chatid:chatid,
	       	
	        success : function(data){
	       //alert(data);
	        	//document.getElementById("chatform").reset();
	    		//document.getElementById("chatbot").style.display='block';
	        }
	        }
	        });
	        
	        });	
}
</script>

<script>
function sendDefaultMessageByAdmin(chatid,name){
	//alert("sendDefaultMessageByAdmin");
	var message="Hi!"+name+".One of our executives will soon reply you.Please wait!";
    ////alert("chatidddddddddddddddddddddddddddddd="+chatid);
	var cid=document.getElementById('chatid').value;
	updateDbByDefault(chatid);
var uid = firebase.database().ref().child('messageuser/<%=uipddress%>').push().key;

var currentdate = new Date(); 

var datetime =  currentdate.getFullYear() + "/"

		           + (currentdate.getMonth()+1)  + "/" 
		
		           + currentdate.getDate() + " "  
		
		           + currentdate.getHours() + ":"  
		
		           + currentdate.getMinutes() + ":" 
		
		           + currentdate.getSeconds();
	var d = Date.parse(datetime)+"";
	var hr=currentdate.getHours();
	var mins=currentdate.getMinutes();
	if(hr.toString().length==1){
		hr='0'+hr.toString();
	}if(mins.toString().length==1){
		mins='0'+mins.toString();
	}
	var time=hr+':'+mins;
	
var data = {

		userid: 0,
	    message: message,
	    datetime: datetime,
	    datetime1:d,
	    status:1,
	    default_msg:1,
	    admin_id:'none',
	    time:time

}



var updates = {};

updates['/messageuser/<%=uipddress%>/' + uid] = data;

firebase.database().ref().update(updates);

//alert("updatedddd");
changeModal();
////document.getElementById('message').value="";
//////alert("message==="+document.getElementById('message').value);
////$("#ChatFormm").modal('hide');
////document.getElementById('chatFirstForm').style.display='none';
////document.getElementById('chatbox').style.display='block';
//var chatModalButton=document.getElementById('chatModal');
////$("#ChatMsgs").modal('show');
//alert("function ended");
//chatModalButton.click();


}
</script>
<script>
function changeModal()
{
	//alert("changeModal");
	console.log("hyfyufuf");
	$("#ChatFormm").modal('hide');
	document.getElementById('chatFirstForm').style.display='none';
	document.getElementById('chatbox').style.display='block';
	//var chatModalButton=document.getElementById('chatModal');
	$("#ChatMsgs").modal('show');
	}
</script>

<script>
function sendWaitingMessage(chatid){
	////alert("third function working=3");
	var message="Please wait! We are assigning you other executive to continue the conversation";

	
	updateDbByDefault(chatid);
var uid = firebase.database().ref().child('messageuser/<%=uipddress%>').push().key;

var currentdate = new Date(); 

var datetime =  currentdate.getFullYear() + "/"

		           + (currentdate.getMonth()+1)  + "/" 
		
		           + currentdate.getDate() + " "  
		
		           + currentdate.getHours() + ":"  
		
		           + currentdate.getMinutes() + ":" 
		
		           + currentdate.getSeconds();
	var d = Date.parse(datetime)+"";
	var hr=currentdate.getHours();
	var mins=currentdate.getMinutes();
	if(hr.toString().length==1){
		hr='0'+hr.toString();
	}if(mins.toString().length==1){
		mins='0'+mins.toString();
	}
	var time=hr+':'+mins;
	
var data = {

		userid: 0,
	    message: message,
	    datetime: datetime,
	    datetime1:d,
	    status:1,
	    time:time

}



var updates = {};

updates['/messageuser/<%=uipddress%>/' + uid] = data;

firebase.database().ref().update(updates);

document.getElementById('message').value="";
/*$("#ChatFormm").modal('hide');

document.getElementById('chatFirstForm').style.display='none';
document.getElementById('chatbox').style.display='block';
var chatModalButton=document.getElementById('chatModal');
$("#ChatMsgs").modal('show');*/
//chatModalButton.click();


}
</script>
<script>
function updateDbByDefault(chatid){
	////alert("update working=="+chatid);
	//alert("updateDbByDefault==");
	 $(document).ready(function() {
	        
	        
	        $.ajax({
	        url: "save_chat_initiate_details.jsp?action=updateByDefault",
	        type: "post",
	        data: {
	        	chatid:chatid,
	        	
	        	
	        success : function(data){
	       //alert("update donee");
	        	//document.getElementById("chatform").reset();
	    		//document.getElementById("chatbot").style.display='block';
	    		//changeModal();
	        }
	        }
	        });
	        
	        });	
}
</script>
<script>
function checkTime(chatid){
	////////alert(email);
	 //////alert("working function==22");
	$.ajax({
	url: "checkLastMsgTime.jsp?chatid="+chatid,
	type: 'GET',
	data: null,
	success: function(data) {
	////alert(data);
	document.getElementById('checkvalue').innerHTML=data;
	////////alert(document.getElementById('EmailcorrectOrNot').value);
	//spots_names_yes2();
	//disableEnableSubmit();
	var check_value=document.getElementById('check_value').value;
	 ////alert("check_value="+check_value);
	 if(check_value=="true"){
		 ////alert("check_value in if=="+check_value);
	sendWaitingMessage(chatid);
	 }
	}
	});
}
</script>
</html>