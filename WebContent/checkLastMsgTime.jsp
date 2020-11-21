<%@page import="dao.ApiController"%>
<%
String uipddress=request.getParameter("chatid");
ApiController apiController=new ApiController();
String checkk=apiController.firebaseTrigger(uipddress);
System.out.println("checkkkkk=="+checkk);

%>
	<input type="hidden" id="check_value" value="<%=checkk%>">

