<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
<!-- -  <script>
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
</script>-->

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
<body>
<button onclick="test()">click</button>
</body>
<script>
function test(){
	
	return firebase.database().ref('messageuser/'+childKey+"/").limitToLast(3);

}
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
			  alert("kkkk===="+k);
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
	 var count=0;
	 databaseRef.orderByChild('timestamp').once('value', function(snapshot) {
		 snapshot.forEach(function(childSnapshot) {
			 var k1=snapshot.numChildren();
			    //	alert("k11==="+k1);
			    	 
			    	
			    	  window.rowid= window.rowid+1;
			    	var childKey = childSnapshot.key;
					var childData = childSnapshot.val();
					
					 
					  var userdatabaseRef = firebase.database().ref('messageuser/'+childKey+"/");
					  userdatabaseRef.orderByChild('timestamp').on("value", function(snapshot) {
						  k++;
						  alert("kkkk===="+k);
						  snapshot.forEach(function(childSnapshot) {
							  var childKey1 = childSnapshot.key;
							  var childData = childSnapshot.val();
							 var userid=childData.userid;
							 
							 if(childData.message_status=='on_hold'){
								 count=childSnapshot.numChildren();
							 }
							 alert("There are "+count+" notifications");
							  
								 // date1=childData.datetime;
								
								
							    });
					  });
	 });
	 });
	 document.getElementById('notifications_count').innerHTML=count;	 
	 var div = document.createElement("div");
	 div.innerHTML = "<h3 id='chat_name"+chatid+"'class='dropdown-item-title'>" +name+ "</h3><span class='float-right text-sm text-danger'><i class='fas fa-star'></i></span><p id='chat_message"+chatid+"' class='text-sm'>" + msg + "</p><p id='chat_time' class='text-sm text-muted'><i class='far fa-clock mr-1'></i>" +timee+ " hours ago</p>"
     div.className = "media-body"
     document.getElementById("chat-notifs").appendChild(div)
	 
 }
 </script>
</html>