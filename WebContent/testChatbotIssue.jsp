<%@page import="beans.base_urls"%>
<%@page import="dao.ApiController"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.InetAddress"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
  <%
base_urls bu=new base_urls();
if(bu.mode.equals("live")){
%>
 <script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyCvZzDY0-AvbDiXejDucTGXag7vxTBMYdw",
    authDomain: "vnsdmmchatbot.firebaseapp.com",
    databaseURL: "https://vnsdmmchatbot.firebaseio.com",
    projectId: "vnsdmmchatbot",
    storageBucket: "vnsdmmchatbot.appspot.com",
    messagingSenderId: "112795506448",
    appId: "1:112795506448:web:9b9974a1d58f142b5b7795",
    measurementId: "G-TLLWQX189Q"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>
<%} else if(bu.mode.equals("test")) {%>
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
<%} %>
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
<div id="dbResults" style="display:none">

</div>
<!-- -------------chatform starts -->
<body onload="checkCondition(<%=check%>,<%=session_check%>)">

<div class="container">
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
     <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
         
<div class="main-card">
  <div class="main-title">
    <div class="col-md-4">VNS.DMM</div>
    <div class="col-md-4 col-cm">Hi there &nbsp;<i class="fa fa-hand-paper-o" aria-hidden="true"></i></div>
    <div class="col-md-2 col-cm">
      <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
        </button>
        <ul class="dropdown-menu">
          <li><a href="#">D1</a></li>
          <li><a href="#">D2</a></li>
          <li><a href="#">D3</a></li>
        </ul>
      </div>
    </div>


    <div class="col-md-2 col-rm">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
    </div>
    
  </div>
<div class="col-md-12 col-sm-12 col-lr">
      <span class="rp"><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;We reply immediately</span>
    </div>
  <div class="chat-area" id="chat-form-content">
 
  <div class="col-sm-12 col-md-12">
    <div class="logo">VNS.DMM</div>
    <h1 class="title_top">Please introduce yourself:</h1>

 </div>

 <div class="col-sm-8 col-md-8 col-cn">
      <div class="card-body py-md-4">
       <form _lpchecked="1">
       <div class="form-group v1">
             <input type="text" class="form-control" id="name_in_form" placeholder="Emter your name">
        </div>
        <div class="form-group v1">
             <input type="email" class="form-control" id="email_in_form" placeholder="Emter your email">
        </div>                                                 
       <div class="form-group v1">
         <input type="text" class="form-control" id="phone_in_form" placeholder="Enter your phone">
       </div>
        <div class="form-group v1">
         <input type="text" class="form-control" id="message_in_form" placeholder="Enter your message">
       </div>
       
       <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">&nbsp;<b style="color: #868686;
    font-weight: 500;">Sign up for our newsletter</b>
       <div class="d-flex flex-row align-items-center justify-content-between">
      <button style="width: 100%;" id="chatFormsendbtn" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing" type="button" class="main-btn-rect" name="text" value="Send" >
          Send</button>
        </div>
       </form>
     </div>
</div>
</div>
 <div class="chat-area" id="message-box" style="display:none">
  </div>
 <div class="input-div" id="chatBotSendBtn" style="display:none">
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
  
</div>
</body>
<!-- --------chatform ends -->




<style>
#message {
    width: 82%;
    height: 50px;
    position: relative;
    bottom: 0px;
    vertical-align: bottom;
}
.col-cn {
    margin: 0px;
    padding: 0px;
    width: 100%;
}
.v1 input {
    margin-top: 18px;
    padding: 0px;
    padding-left: 14px;
}
.d-flex.flex-row.align-items-center.justify-content-between button {
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
.title_top {
    color: #8e8e8e;
    font-size: 18px;
    text-align: center;
    font-weight: bold;
    margin-bottom: 30px;
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
.form-control{
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
    position: fixed;
    cursor: pointer;
    right: 60px;
    bottom: 28px;
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
*:focus {
    outline: none !important;
}

.input-group .material-icons svg {
    width: 26px;
    height: 26px;
}
.btn.btn-info.btn-lg {
    position: fixed;
    cursor: pointer;
    right: 70px;
    bottom: 28px;
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
}
#message {
    width: 82%;
    height: 50px;
    position: relative;
    bottom: 0px;
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
function checkCondition(check,session_check){
	//////alert("condition==="+check);
	if(session_check){
		if(check==true){
			alert("trueee");
			document.getElementById("chat-form-content").style.display='none';
			document.getElementById("message-box").style.display='block';
			document.getElementById("chatBotSendBtn").style.display='block';
		}else if(check==false){
			alert("falseee");
			document.getElementById("message-box").style.display='none';
			document.getElementById("chatBotSendBtn").style.display='none';
			document.getElementById("chat-form-content").style.display='block';

		}
	}else{
		document.getElementById("chat-form-content").style.display='block';
	}
	
	console.log("check==="+check);
}
</script>



<script>
  var running = false
    function send() {
	//alert("send");
        if (running == true)
            return
        var msg = document.getElementById("message").value
        if (msg == "")
            return
        running = true
        addMsg(msg)
        var chatidd=document.getElementById('chatid').value;
        window.setTimeout(sendByChatbot, 800, chatidd,msg)
    }
    function addMsg(msg) {
    //	alert("Addmsg===="+msg);
        var div = document.createElement("div");
        div.innerHTML = "<span style='flex-grow:1'></span><div class='chat-message'>" + msg + "</div>"
        div.className = "chat-message-div"
        document.getElementById("message-box").appendChild(div)
    }
    function addResponseMsg(msg) {
        var div = document.createElement("div");
        div.innerHTML = "<div class='chat-message'>" + msg + "</div>"
        div.className = "chat-message-div"
        document.getElementById("message-box").appendChild(div)
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
function sendByChatbot(chatid,msg){
	//alert("sendByChatbot working==="+chatid);
	 $(document).ready(function() {
	        
	       // alert("inner---1");
	        $.ajax({
	        url: "save_chat_initiate_details.jsp?action=updateByUser",
	        type: "post",
	        data: {
	        	chatid:chatid},
	       	
	        success : function(data){
	        	
	        	document.getElementById('dbResults').innerHTML=data;
	        	//alert(data);
		        	var update_status=document.getElementById('updateByUser').value;
		        	if(update_status=='updated')
		        	{
		        		
	  		      updateFirebase(1,msg,0,0,'none');
	  		
	  		       	
		        	}else if(save_status=='failed'){
		        		
		        	}
	      }
	        
	        });
	        
	        });	
}
</script>

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
			  addMsg(childData.message);
			  ////////alert("1111111111");


		  }else{
			  addResponseMsg(childData.message);
			  ////////alert("0000000000");
		  }
    });

    window.checkfirst=false;

  });



		databaseRef.orderByChild('timestamp').limitToLast(1).on("value", function(snapshot) {

		//	////////alert("nnnnn22==>"+window.checkfirst);
			  snapshot.forEach(function(childSnapshot) {

				  var childKey = childSnapshot.key;

				  var childData = childSnapshot.val();
				 //  window.uchildKey=childKey;
				  var userid=childData.userid;

				  if(window.checkfirst==false){
       
					 

					  if(userid==1){

						//  addMsg(childData.message);
		 

					  }else{

						  addResponseMsg(childData.message);
						  ////////alert("00000000000222222222");
					    	

					  }
					 /* if(window.uchildKey==window.uchildKey1){
						  
					  }else{
					  window.uchildKey1=childKey;
					  }*/
				  }



				    });

			  

			 

			});
</script>
<script type="text/javascript">

    $('#chatFormsendbtn').on('click', function() {
        var $this = $(this);
      $this.button('loading');
  	
    var email=document.getElementById('email_in_form').value;
    var name=document.getElementById('name_in_form').value;
  	var phone=document.getElementById('phone_in_form').value;
var message=document.getElementById('message_in_form').value;
var chatidd=document.getElementById('chatid').value;

  	var email_filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  	var email_check="false";
  	var phn_check="false";
  	var phoneno = /^\d{10}$/;
  	if(email.length==0 || name.length==0 || phone.length==0|| message.length==0){
      	alert("please fill all the feilds");
  		$this.button('reset');
  	}else{
  		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email) && phone.match(phoneno))
		  {
  			$.ajax({
  		        url: "save_chat_initiate_details.jsp?action=save",
  		        type: "post",
  		        data: {
  		        	name:name,
  		        	email:email,
  		        	phone:phone,
  		        	usermessage:message,
  		        	chatid:chatidd},
  		        	
  		        	
  		        success : function(data){
  		        	//alert(data);
  		        	document.getElementById('dbResults').innerHTML=data;
  		        	var save_status=document.getElementById('saveFormDetails').value;
  		        	if(save_status=='saved'){
  		        		document.getElementById("chat-form-content").style.display='none';
  	  		          document.getElementById("message-box").style.display='block';
  	  		          document.getElementById("chatBotSendBtn").style.display='block';
  	  		          
  	  		      updateFirebase(1,message,0,0,'none');
  	  		  
  			   //alert("chatidddddd=="+chatidd);
  			   addMsg(message);
  			   //alert("sendFirstDefaultMsgOnFormSubmission===chatidd,name,message="+chatidd+","+","+name+","+message);
  			   sendFirstDefaultMsgOnFormSubmission(chatidd,name);
  	  		       	
  		        	}else if(save_status=='failed'){
  		        		
  		        	}
  		        	}
  		        
  		        });
		  }else{
			  $this.button('reset');
  			  alert("please enter a valid email or phone number");
  		 
		  }
  	}

        
    });

    </script>
    <script>
function sendFirstDefaultMsgOnFormSubmission(chatid,name){
	//alert("update working=="+chatid+"===name=="+name+"===message=="+message);
	var message="Hi!"+name+".One of our executives will soon reply you.Please wait!";
	////alert("updateDbByDefault==");
	 $(document).ready(function() {
	        
	        
	        $.ajax({
	        url: "save_chat_initiate_details.jsp?action=updateByDefault",
	        type: "post",
	        data: {
	        	chatid:chatid},
	        	
	        	
	        success : function(data){
	        	document.getElementById('dbResults').innerHTML=data;
	        	//alert(data);
		        	var update_status=document.getElementById('updateByDefault').value;
		        	if(update_status=='updated'){
		        		updateFirebase(0,message,1,1,'none');	
		        	}else if(update_status=='failed'){
  		        		
  		        	}
	        }
	        
	        });
	        
	        });	
}
</script>
<script>
function sendWaitingDefaultMsg(chatid,name,message){
	//////alert("update working=="+chatid);
	////alert("updateDbByDefault==");
	 $(document).ready(function() {
	        
	        
	        $.ajax({
	        url: "save_chat_initiate_details.jsp?action=updateByDefault",
	        type: "post",
	        data: {
	        	chatid:chatid,
	        	
	        	
	        success : function(data){
	        	document.getElementById('dbResults').innerHTML=data;
		        	var update_status=document.getElementById('updateByDefault').value;
		        	if(update_status=='updated'){
		        		updateFirebase(0,message,1,1,'none');	
		        	}else if(update_status=='failed'){
  		        		
  		        	}
	        }
	        }
	        });
	        
	        });	
}
</script>
 
    <script>
    function updateFirebase(userid,message,status,default_msg,admin_id){
    	alert("updateFirebase working====="+message);
		   var uid = firebase.database().ref().child('messageuser/<%=uipddress%>').push().key;

		   var currentdate = new Date(); 

		   var datetime =  currentdate.getFullYear() + "/"

				           + (currentdate.getMonth()+1)  + "/" 
				
				           + currentdate.getDate() + " "  
				
				           + currentdate.getHours() + ":"  
				
				           + currentdate.getMinutes() + ":" 
				
				           + currentdate.getSeconds();
			var d = Date.parse(datetime)+"";
			
		   var data = {

			userid: userid,
			message: message,
			datetime:datetime,
		    datetime1:d,
		    status:status,
		    default_msg:default_msg,
		    admin_id:admin_id

		   }

		   

		   var updates = {};

		   updates['/messageuser/<%=uipddress%>/' + uid] = data;

		   firebase.database().ref().update(updates);
		   document.getElementById('message').value="";

		  
    	
    }
    </script>
    
 
