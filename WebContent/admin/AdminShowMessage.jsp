<!DOCTYPE html>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.InetAddress"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | DataTables</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <style>
 .messaging {
    background-color: #e4e4e4;
    padding: 20px;
    margin-top: 20px;
}
.class.sent_msg p {
    background-color: #fff;
    padding: 10px;
    width: 100%;
    border-radius: 4px;
    margin-top: 11px;
}
.class.time_date {
    background-color: #fff;
    padding: 10px;
    text-align: right;
    width: 16%;
    display: block;
    border-radius: 4px;
    margin-left: 60em;
}
.type_msg {
    background-color: #fff;
    padding: 20px;
    margin-top: 20px;
}
#btn-input {
    width: 87%;
    padding: 10px;
    border: 1px solid #ccc;
}
#btn-chat {
    padding: 13px;
    border: 1px solid #ccc;
}
div#drop {
    width: 5%;
    /* height: 62%; */
}
 </style>
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
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%@include file="header.jsp" %>
<%@include file="sidebar.jsp" %>
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
String uipddress=(localip+systemipaddress).replace(".", "");
 %>
  <!-- Content Wrapper. Contains page content -->
  <input type="hidden" id="adminid" value="<%=admin_id%>">
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>DataTables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">DataTables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <!-- /.card -->
<%
String chatid=request.getParameter("chatid");
String actionn=request.getParameter("action");
 %>
            <div class="card">
            <div class="messaging">
  <div class="inbox_msg">
  <input type="hidden" id="chatid" value="<%=chatid%>">
  <input type="hidden" id="adminid" value="<%=admin_id%>">
  <input type="hidden" id="admin_name" value="<%=admin_name%>">
  
	<div class="mesgs">
	  <div class="msg_history" id="listdiv">
	  </div>
	  <%
	  System.out.println("admin nameee==="+admin_name);
	  if(actionn.equals("chat")){
	  %>
	  <div class="type_msg">
		<div class="input_msg_write" id="input_div_id">
		  <input type="text" class="write_msg" placeholder="Type a message" id="btn-input" name="btn-input" required="true" >
		  <button class="msg_send_btn" type="button" id="btn-chat" onclick="savemessage();"><i class="fa fa-paper-plane" aria-hidden="true" ></i></button>
	
		</div>
	  </div>
	  <%} %>
	</div>
  </div>
</div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.1.0-pre
    </div>
    <strong>Copyright &copy; 2014-2020 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
			integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	</script>

			<script>
	var input = document.getElementById("btn-input");

	input.addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
	 
   event.preventDefault();
   var inval= document.getElementById("btn-input").value ;
   if(inval.trim()==''){
	  //alert("Please Fill the blank"); 
   }else{
	   document.getElementById("btn-chat").click();
   }
  
  }
});
</script>
		
		 <script>
 

  var databaseRef = firebase.database().ref('messageuser/<%=chatid%>/');

  var rowIndex = 1;
  var rowIndex1 = 1;
  
 window.checkfirst=true;
  
 databaseRef.once('value', function(snapshot) {
	  
    snapshot.forEach(function(childSnapshot) {
    
    	
    	var childKey = childSnapshot.key;
		var childData = childSnapshot.val();
    	var listdiv = document.getElementById("listdiv");
		
		  var userid=childData.userid;
		  var adminid=childData.admin_id;
		  var default_msg=childData.default_msg;
		  var session_admin_id=document.getElementById('adminid').value;

		  if(userid==0){
			  var divoutgoing = document.createElement("div");
			  divoutgoing.classList.add("class", "outgoing_msg");
			  var divSend = document.createElement("div");
			  divSend.classList.add("class", "sent_msg");
			  var p = document.createElement("p");
			  p.appendChild(document.createTextNode(childData.message));
			  p.style.wordWrap ="break-word";
			  divSend.appendChild(p);
			 
			  var span = document.createElement("span");
			  span.classList.add("class", "time_date");
			  span.appendChild(document.createTextNode(childData.datetime));
			  divSend.appendChild(span);
			  divoutgoing.appendChild(divSend);
			  listdiv.appendChild(divoutgoing);
			 /* if(default_msg==0){
			  if(adminid!=session_admin_id){
				  document.getElementById('input_div_id').style.display='none';
			  }else {
				  document.getElementById('input_div_id').style.display='block';
			  }
		  }*/
			  var checkstatus=childData.status;
			  if(checkstatus==0){
				  var data = {
						  	datetime: childData.datetime,
						  	message: childData.message,
						  	userid: childData.userid,
						  	datetime1:childData.datetime1,
						    status: 1,
						    admin_id:childData.admin_id,

						   }
						   
				 var updates = {};
				 updates['/messageuser/<%=chatid%>/' + childKey] = data;
				firebase.database().ref().update(updates);
			  }
					   
			
		  }else{
			
			  var divincome = document.createElement("div");
					  divincome.classList.add("class", "incoming_msg");
							
						  var divrecive = document.createElement("div");
						  divrecive.classList.add("class", "received_msg");
					  var divrecived = document.createElement("div");
					  divrecived.classList.add("class", "received_withd_msg");
					  var p = document.createElement("p");
					  p.appendChild(document.createTextNode(childData.message));
					  p.style.wordWrap ="break-word";
					   var span = document.createElement("span");
					  span.classList.add("class", "time_date");
					  span.appendChild(document.createTextNode(childData.datetime));
					  divrecived.appendChild(p);
					  divrecived.appendChild(span);
					  divrecive.appendChild(divrecived)
					  divincome.appendChild(divrecive)
			  		  listdiv.appendChild(divincome);
					  var checkstatus=childData.status;
					  if(checkstatus==0){
						  var data = {
								  	datetime: childData.datetime,
								  	message: childData.message,
								  	userid: childData.userid,
								  	datetime1:childData.datetime1,
								    status: 1,
								    admin_id:childData.admin_id,
								   }
								   
						 var updates = {};
						 updates['/messageuser/<%=chatid%>/' + childKey] = data;
						firebase.database().ref().update(updates);
					  }
					  
					
			  			 
		  }
		 
		
		
   
    });
    window.checkfirst=false;
    listdiv.scrollTop = listdiv.scrollHeight;
  });
	
		databaseRef.orderByChild('timestamp').limitToLast(1).on("value", function(snapshot) {
			  ////alert(window.checkfirst);
			
			  snapshot.forEach(function(childSnapshot) {
				  var childKey = childSnapshot.key;
				  window.uchildKey=childKey;
				  var childData = childSnapshot.val();
					var listdiv = document.getElementById("listdiv");
				  var userid=childData.userid;
				  if(window.checkfirst==false){
					  if(window.uchildKey==window.uchildKey1){
						  
					  }else{
					  window.uchildKey1=childKey;
					  if(userid==0){
						  var divoutgoing = document.createElement("div");
						  divoutgoing.classList.add("class", "outgoing_msg");
						  var divSend = document.createElement("div");
						  divSend.classList.add("class", "sent_msg");
						  var p = document.createElement("p");
						  p.appendChild(document.createTextNode(childData.message));
						  p.style.wordWrap ="break-word";
						  divSend.appendChild(p);
						  var span = document.createElement("span");
						  span.classList.add("class", "time_date");
						  span.appendChild(document.createTextNode(childData.datetime));
						  divSend.appendChild(span);
						  divoutgoing.appendChild(divSend);
						  listdiv.appendChild(divoutgoing);
						  var checkstatus=childData.status;
						  if(checkstatus==0){
							  var data = {
									  	datetime: childData.datetime,
									  	message: childData.message,
									  	userid: childData.userid,
									  	datetime1:childData.datetime1,
									    status: 1,
									    admin_id:childData.admin_id,
									   }
									   
							 var updates = {};
							 updates['/messageuser/<%=chatid%>/' + childKey] = data;
							firebase.database().ref().update(updates);
						  }
						
					  }else{
						
						  var divincome = document.createElement("div");
								  divincome.classList.add("class", "incoming_msg");
										
									  var divrecive = document.createElement("div");
									  divrecive.classList.add("class", "received_msg");
								  var divrecived = document.createElement("div");
								  divrecived.classList.add("class", "received_withd_msg");
								  var p = document.createElement("p");
								  p.appendChild(document.createTextNode(childData.message));
								  p.style.wordWrap ="break-word";
								   var span = document.createElement("span");
								  span.classList.add("class", "time_date");
								  span.appendChild(document.createTextNode(childData.datetime));
								  divrecived.appendChild(p);
								  divrecived.appendChild(span);
								  divrecive.appendChild(divrecived)
								  divincome.appendChild(divrecive)
						  		listdiv.appendChild(divincome);
								  var checkstatus=childData.status;
								  if(checkstatus==0){
									  
									  var data = {
											  	datetime: childData.datetime,
											  	message: childData.message,
											  	userid: childData.userid,
											  	datetime1:childData.datetime1,
											    status: 1,
											    admin_id:childData.admin_id,
											   }
											   
									 var updates = {};
									 updates['/messageuser/<%=chatid%>/' + childKey] = data;
									firebase.database().ref().update(updates);
								  }
						  			 
					  }
					  listdiv.scrollTop = listdiv.scrollHeight;
				  }
				  }
				    });
			  
			 
			});
	
		 
	
 
	  
  
  function savemessage(){

	  //alert("working");
   var message = document.getElementById('btn-input').value;
   var chatid = document.getElementById('chatid').value;
   //alert("message=="+message+"===chatid=="+chatid);
  	if(message.trim()==""){
  		 //alert("Please Fill the blank"); 
  	//	document.getElementById('btn-input').setCustomValidity('Please Fill the blank');
  		//document.getElementById('input_div_id').style.borderColor="red";
  		return false;
  	}
  	updateDb(chatid);
   var uid = firebase.database().ref().child('messageuser/<%=chatid%>').push().key;
   var currentdate = new Date(); 
   var datetime =  currentdate.getFullYear() + "/"

			   + (currentdate.getMonth()+1)  + "/" 
			
			   + currentdate.getDate() + " @ "  
			
			   + currentdate.getHours() + ":"  
			
			   + currentdate.getMinutes() + ":" 
			
			   + currentdate.getSeconds();
		var d = Date.parse(datetime)+"";
	              
   var data = {
	userid: 0,
    message: message,
    datetime: datetime,
    datetime1:d,
    status:1,
    default_msg:0,
    admin_id:document.getElementById('adminid')
   }
   
   var updates = {};
   updates['/messageuser/<%=chatid%>/' + uid] = data;
   firebase.database().ref().update(updates);
   document.getElementById('btn-input').value="";
//   //alert('The user is created successfully!');
  
  }
  
  function reload_page(){
   window.location.reload();
  }
  
 </script>
 <script>
function updateDb(chatid){
	
	
	var adminid=document.getElementById('adminid').value;
	var admin_name=document.getElementById('admin_name').value;
	 $(document).ready(function() {
	        
	        
	        $.ajax({
	        url: "../save_chat_initiate_details.jsp?action=updateByAdmin",
	        type: "post",
	        data: {
	        	chatid:chatid,
	        	adminid:adminid,
	        	admin_name:admin_name,
	        	
	        	
	        success : function(data){
	       // //alert(data);
	        	//document.getElementById("chatform").reset();
	    		//document.getElementById("chatbot").style.display='block';
	        }
	        }
	        });
	        
	        });	
}
</script>
 

<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="plugins/jszip/jszip.min.js"></script>
<script src="plugins/pdfmake/pdfmake.min.js"></script>
<script src="plugins/pdfmake/vfs_fonts.js"></script>
<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page specific script -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
			integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	</script>

		<script>
	var input = document.getElementById("btn-input");

	input.addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
	 
   event.preventDefault();
   var inval= document.getElementById("btn-input").value ;
   if(inval==''){
	  //alert("Please Fill the blank"); 
   }else{
	   document.getElementById("btn-chat").click();
   }
  
  }
});
</script>
		<script>
		var arrayList = [];
  var databaseRef = firebase.database().ref('messageuser/');

  var rowIndex = 1;
  var rowIndex1 = 1;
  
 window.checkfirst=true;
 window.rowid=1;
 var firbasedata = [];
 var date1="2019/1/9 @ 14:30:44";
 var k=0;
 databaseRef.orderByChild('timestamp').once('value', function(snapshot) {
	
    snapshot.forEach(function(childSnapshot) {
    	var k1=snapshot.numChildren();
    	 
    	
    	  window.rowid= window.rowid+1;
    	var childKey = childSnapshot.key;
		var childData = childSnapshot.val();
		
		 
		  var userdatabaseRef = firebase.database().ref('messageuser/'+childKey+"/");
		  userdatabaseRef.orderByChild('timestamp').limitToLast(1).on("value", function(snapshot) {
			  
			  k++;
			  snapshot.forEach(function(childSnapshot) {
				  var childKey1 = childSnapshot.key;
				  var childData = childSnapshot.val();
				 var userid=childData.userid;
				
				  if(window.checks){
					  for (var i = 0; i < arrayList.length; i++) {
							if(arrayList[i].id==childKey){
								arrayList[i].message=childData.message;
								arrayList[i].datetime=childData.datetime;
								arrayList[i].status=childData.status;
								arrayList[i].datetime1=childData.datetime1;
							}
							 
							}
					  sortdata(JSON.stringify(arrayList));
					
					//  //alert(x.rowIndex);
					
				  }else{
					  var employeeObject1 = new Employee(childKey, childData.message, childData.datetime,childData.status,childData.datetime1);
					  arrayList.push(employeeObject1);
					  console.log(JSON.stringify(arrayList)); 
				  }
				  if(k==k1){
				   		 console.log("There are "+snapshot.numChildren()+" messages");
				   		sortdata(JSON.stringify(arrayList));
				   	 }
				  
					  var checkstatus=childData.status;
					 
					 // date1=childData.datetime;
					
					
				    });
			  
			 
			});
		 
		 
			  
    });
    window.checkfirst=false;
  });
 console.log(JSON.stringify(arrayList));
 
 function Employee(id, message, datetime,status,datetime1) {
	
	    this.id = id;
	    this.message = message;
	    this.datetime = datetime;
	    this.status = status;
	    this.datetime1 = datetime1;
	}
 function sortdata(myJSON) {
	window.checks=true;

	 var xhttp = new XMLHttpRequest();
	 xhttp.onreadystatechange = function() {
	   if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("example2").innerHTML = this.responseText;
	   //  //alert(document.getElementById("demo").innerHTML);
	   }
	 };
	 xhttp.open("POST", "getFirebasedat.jsp", true);
	 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	 xhttp.send("firbasedata="+myJSON);
}
  function reload_page(){
   window.location.reload();
  }
  if(window.checks){
	  //alert("kjfhkds"+window.checks);
	  databaseRef.orderByChild('timestamp').once('value', function(snapshot) {
			
		    snapshot.forEach(function(childSnapshot) {
		    	var k1=snapshot.numChildren();
		    	 
		    	 var table = document.getElementById("example1");
		    	  //var row = table.insertRow(window.rowid);
		    	//  var cell1 = row.insertCell(0);
		    	 // var cell2 = row.insertCell(1);
		    	 // var cell3 = row.insertCell(2);
		    	  window.rowid= window.rowid+1;
		    	var childKey = childSnapshot.key;
				var childData = childSnapshot.val();
				
				 
				  var userdatabaseRef = firebase.database().ref('messageuser/'+childKey+"/");
				  userdatabaseRef.orderByChild('timestamp').limitToLast(1).on("value", function(snapshot) {
					  
					  k++;
					  snapshot.forEach(function(childSnapshot) {
						  var childKey1 = childSnapshot.key;
						  var childData = childSnapshot.val();
						 var userid=childData.userid;
						 var employeeObject1 = new Employee(childKey, childData.message, childData.datetime,childData.status,childData.datetime1);
						  arrayList.push(employeeObject1);
						  console.log(JSON.stringify(arrayList));
						
						  if(k==k1){
						   		 console.log("There are "+snapshot.numChildren()+" messages");
						   		sortdata(JSON.stringify(arrayList));
						   	 }
						   	 //alert(k==k1);
						 
							  var checkstatus=childData.status;
							 
							 // date1=childData.datetime;
							
							
						    });
					  
					 
					});
				 
				 
					  
		    });
		    window.checkfirst=false;
		  });
  }
 </script>

</body>
</html>
