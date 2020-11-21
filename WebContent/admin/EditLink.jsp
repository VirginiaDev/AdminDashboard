<%@page import="beans.edit_homepage_images"%>
<%edit_homepage_images eh = (edit_homepage_images)request.getAttribute("edit_homepage"); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
<title>Insert title here</title>
</head>
<body>
<form action = "AdminController" method="POST" name = "uForm">
<input type = "hidden" name = "userAction">
<input type = "hidden" name = "id">
<input type = "text" name = "link" value = "<%=eh.getLinks()%>" style="width:35%;padding: 0.5%;">
<input type = "button" value = "Update Link" onclick="updateLink()" style="height: 33px;">
</form>

<script type="text/javascript">
function updateLink(){
	var currentLink = "<%=eh.getLinks()%>";
	if(document.uForm.link.value==currentLink){
		alert("Please Change Link First");
		return;
	}
	document.uForm.id.value = <%=eh.getId()%>;
	document.uForm.userAction.value = 2;
	document.uForm.submit();
}
</script>
</body>
</html>