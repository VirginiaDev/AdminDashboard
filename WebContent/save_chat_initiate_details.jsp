<%@page import="beans.chat_initiate_request"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="dao.ApiController"%>
<%
ApiController apiController=new ApiController();
String action=request.getParameter("action");

if(action.equals("save")){
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String usermessage=request.getParameter("usermessage");
	String chatid=request.getParameter("chatid");

	int id=apiController.insertIntoChatInitiate(name,email,phone,usermessage,chatid);
	HttpSession chat_session = request.getSession();
	chat_session.setAttribute("chatid", chatid);
	if(id>0){
		%>
		<input type="hidden" id="saveFormDetails" value="saved">
	<% }else{
		%>
	<input type="hidden" id="saveFormDetails" value="failed">
		
	<%}
	
}
else if(action.equals("updateByUser")){
	
	System.out.println("updateeebyyyyuserrrr");
	
	String chat_status="";
	String chatid=request.getParameter("chatid");
	ArrayList<chat_initiate_request> cir=apiController.fetchChatStatus(chatid);
	for(int i=0;i<cir.size();i++){
		chat_status=cir.get(i).getChat_status();
	}
	
	if(chat_status.equals("on_hold")){
		String last_reply_by="user";
		chat_status="on_hold";
		
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
	    String last_reply_time = String.valueOf(sdf.format(cal.getTime()));
		
		int id=apiController.updateChatDetailsByUser(chatid,last_reply_by,last_reply_time,chat_status);
		if(id>0){
			%>
			<input type="hidden" id="updateByUser" value="updated">
		<% }else{
			%>
		<input type="hidden" id="updateByUser" value="failed">
			
		<%}
	}else{
		String last_reply_by="user";
		chat_status="in_process";
		
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
	    String last_reply_time = String.valueOf(sdf.format(cal.getTime()));
		
		int id=apiController.updateChatDetailsByUser(chatid,last_reply_by,last_reply_time,chat_status);
		if(id>0){
			%>
			<input type="hidden" id="updateByUser" value="updated">
		<% }else{
			%>
		<input type="hidden" id="updateByUser" value="failed">
			
		<%}
	}
		
}
else if(action.equals("updateByAdmin")){
	String chatid=request.getParameter("chatid");
	String latest_admin_replying_id=request.getParameter("adminid");
	String latest_admin_replying_name=request.getParameter("admin_name");
	String last_reply_by="admin";
	String chat_status="in_process";
	String chat_request_status="accepted";
	
	Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    String last_reply_time = String.valueOf(sdf.format(cal.getTime()));
	
	int id=apiController.updateChatDetailsByAdmin(chatid,latest_admin_replying_id,latest_admin_replying_name,chat_status,last_reply_by,last_reply_time,chat_request_status);
	
}else if(action.equals("updateByDefault")){
	System.out.println("update by defaulttt workinggggg");
	String chatid=request.getParameter("chatid");
	String latest_admin_replying_id="defaultt";
	String latest_admin_replying_name="defaultt";
	String last_reply_by="defaultt";
	String chat_status="on_hold";
	String chat_request_status="pending";
	System.out.println("upodayetfhgh");
	Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    String last_reply_time = String.valueOf(sdf.format(cal.getTime()));
	
	int id=apiController.updateChatDetailsByAdmin(chatid,latest_admin_replying_id,latest_admin_replying_name,chat_status,last_reply_by,last_reply_time,chat_request_status);
	if(id>0){
		%>
		<input type="hidden" id="updateByDefault" value="updated">
	<% }else{
		%>
	<input type="hidden" id="updateByDefault" value="failed">
		
	<%}
}
%>