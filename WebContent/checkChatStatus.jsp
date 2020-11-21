<%@page import="dao.ApiController"%>
<%
String uipddress=request.getParameter("chatid");
ApiController apiController=new ApiController();
String status=apiController.ChatStatus(uipddress);
System.out.println("statusstatusstatus=="+status);

%>
	<input type="hidden" id="chatstatus" value="<%=status%>">

