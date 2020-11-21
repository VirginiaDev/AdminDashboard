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
</head>
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
<body>
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
%>
<button onclick="showmsgs()">Click</button>
</body>
<script>
function showmsgs(){
	var databaseRef = firebase.database().ref('messageuser/<%=uipddress%>/');

 databaseRef.orderByChild('timestamp').once('value', function(snapshot) {
	 var k1=snapshot.numChildren();
	alert("there are "+k1+" messages");
   snapshot.forEach(function(childSnapshot) {
    	//var k1=snapshot.numChildren();
    	 
    	
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
				alert(childData.message);
				  
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
}

</script>
</html>