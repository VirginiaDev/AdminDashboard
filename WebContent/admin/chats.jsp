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

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1"  class="table table-bordered table-striped">
                  <thead>
                  <tr>
                 		<th>Date Time</th>
						<th>Message</th>
						<th>Admin in conversation</th>
						<th>Chat Status</th>
						<th>Action</th>
						<th>Chat Actions</th>
                  </tr>
                  </thead>
                  <tbody id="example2">

					</tbody>
            
                  
                </table>
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
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
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
	  alert("Please Fill the blank"); 
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
	   //  alert(document.getElementById("demo").innerHTML);
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
	  alert("kjfhkds"+window.checks);
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
						   	 alert(k==k1);
						 
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
