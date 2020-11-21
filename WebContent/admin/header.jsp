 <%
HttpSession admin_session = request.getSession(false);

int admin_id=0;
String admin_email="";
String admin_name="";
if (admin_session.getAttribute("email") != null) {
	System.out.println("Enter in if"); 
	admin_id=(int)admin_session.getAttribute("id");
	admin_email = (String)admin_session.getAttribute("email");
	admin_name=(String)admin_session.getAttribute("admin_name");
	
		

	}else { 
response.sendRedirect("adminlogin.jsp");
}

%>
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
 <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span id="notifications_count" class="badge badge-danger navbar-badge"></span>
        </a>
  
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <script type="text/javascript">
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
		   	 alert(k==k1);
		 
			  var checkstatus=childData.status;
			 
			 // date1=childData.datetime;
			
			
		    });
	  
	 
	});

  </script>
<!--

//-->
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
 databaseRef.orderByChild('timestamp').limitToLast(3).on('value', function(snapshot) {
	alert("working");
    snapshot.forEach(function(childSnapshot) {
    	var k1=snapshot.numChildren();
    //	alert("k11==="+k1);
    	 
    	
    	  window.rowid= window.rowid+1;
    	var childKey = childSnapshot.key;
		var childData = childSnapshot.val();
		
		 
		  var userdatabaseRef = firebase.database().ref('messageuser/'+childKey+"/");
		  userdatabaseRef.orderByChild('timestamp').on("value", function(snapshot) {
			  
			  k++;
			 // alert("kkkk===="+k);
			  snapshot.forEach(function(childSnapshot) {
				  var childKey1 = childSnapshot.key;
				  var childData = childSnapshot.val();
				 var userid=childData.userid;
				 
				 alert("messages==="+childKey+"=="+childData.message);
				 notifications(childKey,childData.name,childData.message,4);
				
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
					
					//  alert(x.rowIndex);
					
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
 </script>
 <script type="text/javascript">
 function notifications(chatid,name,message,hours){
	 alert("notificatuiaz working");
	 var count=0;
	
	 
	 databaseRef.orderByChild('timestamp').on('value', function(snapshot) {
		 snapshot.forEach(function(childSnapshot) {
			 var k1=snapshot.numChildren();
			    //	alert("k11==="+k1);
			    	 
			    	
			    	  window.rowid= window.rowid+1;
			    	var childKey = childSnapshot.key;
					var childData = childSnapshot.val();
					
					 
					  var userdatabaseRef = firebase.database().ref('messageuser/'+childKey+"/");
					  userdatabaseRef.orderByChild('timestamp').once("value", function(snapshot) {
						  k++;
						//  alert("kkkk===="+k);
						  snapshot.forEach(function(childSnapshot) {
							  var childKey1 = childSnapshot.key;
							  var childData = childSnapshot.val();
							 var userid=childData.userid;
							 
							 if(childData.message_status=='on_hold'){
								 count=k;
							 }
						//	 alert("There are "+k+" notifications");
							  
								 // date1=childData.datetime;
								
								
							    });
					  });
	 });
	 });
	 alert("There are "+k+" notifications===22");
	 document.getElementById('notifications_count').innerHTML=k;	 
	 var div = document.createElement("div");
	 div.innerHTML = "<a href='#' class='dropdown-item'><div class='media' id='chat-notifs'><img src='dist/img/user1-128x128.jpg' alt='User Avatar' class='img-size-50 mr-3 img-circle'><div class='media-body'><h3 id='chat_name"+chatid+"'class='dropdown-item-title'>" +name+ "</h3></div><span class='float-right text-sm text-danger'><i class='fas fa-star'></i></span><p id='chat_message"+chatid+"' class='text-sm'>" + msg + "</p><p id='chat_time' class='text-sm text-muted'><i class='far fa-clock mr-1'></i>" +timee+ " hours ago</p></div></a><div class='dropdown-divider'></div>"
     div.className = "dropdown-menu dropdown-menu-lg dropdown-menu-right"
     document.getElementById("chat-notifs").appendChild(div)
	 
 }
 </script>
  <!-- /.navbar -->

