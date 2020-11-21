package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

import beans.GeneralInquiries;
import beans.Quote;
import beans.SmsApiData;
import beans.TalkToSales;
import beans.admin;
import beans.call_back;
import beans.careers;
import beans.chat;
import beans.chat_initiate_request;
import beans.consultations;
import beans.contact;
import beans.edit_homepage_images;
import beans.free_audit;
import beans.quick_enquiry;
import connection.DbConnection;

public class ApiController {
	final static Logger log = Logger.getLogger(ApiController.class);

public ArrayList<Quote> fetchQuote() {
	ArrayList<Quote> q = new ArrayList<Quote>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from quote  order by id desc");
		while(rs.next()) {
			q.add(parseQuote(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} 
	return q;
}	
public ArrayList<GeneralInquiries> fetchGeneralInquiries() {
	ArrayList<GeneralInquiries> gi = new ArrayList<GeneralInquiries>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from general_inquiries  order by id desc");
		while(rs.next()) {
			gi.add(parseGeneralInquiries(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} 
	return gi;
}	
public ArrayList<SmsApiData> fetchSmsApiData() {
	ArrayList<SmsApiData> sad = new ArrayList<SmsApiData>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from sms_api_data  order by id desc");
		while(rs.next()) {
			sad.add(parseSmsApiData(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} 
	return sad;
}	
public ArrayList<TalkToSales> fetchTalkToSales() {
	ArrayList<TalkToSales> ts = new ArrayList<TalkToSales>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from talk_to_sales  order by id desc");
		while(rs.next()) {
			ts.add(parseTalkToSales(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} 
	return ts;
}	

public ArrayList<edit_homepage_images> fetchHomepageImages() {
	ArrayList<edit_homepage_images> eh = new ArrayList<edit_homepage_images>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from edit_homepage_images  order by id desc");
		while(rs.next()) {
			eh.add(parseHomeageImages(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} return eh;
}	

public ArrayList<careers> fetchCareers() {
	ArrayList<careers> c = new ArrayList<careers>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from careers  order by id desc");
		while(rs.next()) {
			c.add(parseCareers(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} return c;
}	
public ArrayList<consultations> fetchConsultations() {
	ArrayList<consultations> c = new ArrayList<consultations>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from consultations  order by id desc");
		while(rs.next()) {
			c.add(parseConsultations(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} return c;
}

	
public ArrayList<call_back> callBackData() {
	ArrayList<call_back> cb = new ArrayList<call_back>();
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
	try {
		conn=DbConnection.getInstance().getConnection();
		st=conn.createStatement();
		rs=st.executeQuery("select * from callback  order by id desc");
		while(rs.next()) {
			cb.add(parseCallBack(rs));
		}
	} catch(Exception e) {
		e.printStackTrace();
	}finally {
		try {
			if(conn!=null) {
				conn.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
		}
	} return cb;
}

public ArrayList<chat_initiate_request> fetchChatStatus(String chatid){

		
		ArrayList<chat_initiate_request> ae=new ArrayList<>();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			rs=st.executeQuery("select * from chat_initiate_request where chatid='"+chatid+"'");
			while(rs.next()) {
				ae.add(parseChatInitiateRequests(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(rs!=null) {
					rs.close();
				}if(st!=null) {
					st.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return ae;

	}
public int updateChatDetailsByUser(String chatid,String last_reply_by,String last_reply_time,String chat_status)
{
        int i=0;
		Connection conn=null;
		PreparedStatement pst=null;
	//	Statement st=null;
		ResultSet rs=null;
		
		
		try {
			conn=DbConnection.getInstance().getConnection();
	//		st=conn.createStatement();
			pst=conn.prepareStatement("update chat_initiate_request set last_reply_by = '"+last_reply_by+"',last_reply_time='"+last_reply_time+"',chat_status='"+chat_status+"' where chatid='"+chatid+"'");
			System.out.println(pst.toString());
			i=pst.executeUpdate();
			if(i>0) {
				System.out.println("Successfull==="+pst.toString());
			}
			else {
				System.out.println("Some rror occured");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(pst!=null) {
					pst.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return i;
}
	
	public ArrayList<quick_enquiry> fetchQuickEnquiries(String search,int start,int total){

		
		ArrayList<quick_enquiry> co=new ArrayList<>();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();

				if(search.equals("0")) {
					rs=st.executeQuery("select * from quick_enquiry order by id desc limit "+(start-1)+","+total);
					System.out.println("select * from quick_enquiry order by id desc limit "+(start-1)+","+total);

				}else {
					rs=st.executeQuery("select * from quick_enquiry where name LIKE '%"+search+"%' or email LIKE '%"+search+"%' or phone LIKE '%"+search+"%' or company LIKE '%"+search+"%' order by id desc limit "+(start-1)+","+total);
					System.out.println("select * from quick_enquiry where name LIKE '%"+search+"%' or email LIKE '%"+search+"%' or phone LIKE '%"+search+"%' or company LIKE '%"+search+"%' order by id desc limit "+(start-1)+","+total);
		 
				}
			
			
			while(rs.next()) {
				co.add(parseQuickEnquiry(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(st!=null) {
					st.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return co;
	}
public quick_enquiry parseQuickEnquiry(ResultSet rs)throws Exception{
		
		quick_enquiry qe=new quick_enquiry();
		qe.setCompany(rs.getString("company"));
		qe.setConfirmation_status(rs.getString("confirmation_status"));
		qe.setEmail(rs.getString("email"));
		qe.setId(rs.getInt("id"));
		qe.setMessage(rs.getString("message"));
		qe.setName(rs.getString("name"));
		qe.setPhone(rs.getString("phone"));
		qe.setSubmission_date(rs.getString("submission_date"));
		qe.setTrashed_status(rs.getString("trashed_status"));
		qe.setLatest_confirmation_email_sent_time(rs.getString("latest_confirmation_email_sent_time"));
	
		return qe;
	}
public ArrayList<contact> fetchContactRequests(String search,int start,int total){

		
		ArrayList<contact> co=new ArrayList<>();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			if(search.equals("0")) {
				rs=st.executeQuery("select * from contact order by id desc limit "+(start-1)+","+total);
				System.out.println("select * from contact order by id desc limit "+(start-1)+","+total);

			}else {
				rs=st.executeQuery("select * from contact where name LIKE '%"+search+"%' or email LIKE '%"+search+"%' or phn LIKE '%"+search+"%' or company_name LIKE '%"+search+"%' order by id desc limit "+(start-1)+","+total);
				System.out.println("select * from contact where name LIKE '%"+search+"%' or email LIKE '%"+search+"%' or phn LIKE '%"+search+"%' or company_name LIKE '%"+search+"%' order by id desc limit "+(start-1)+","+total);
	 
			}
			while(rs.next()) {
				co.add(parseContacts(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(st!=null) {
					st.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return co;
	}
public contact parseContacts(ResultSet rs)throws Exception{
	
	contact co=new contact();
	
	co.setApps(rs.getString("apps"));
	co.setBranding(rs.getString("branding"));
	co.setBudget(rs.getString("budget"));
	co.setCompany_name(rs.getString("company_name"));
	co.setContent(rs.getString("content"));
	co.setDesign(rs.getString("design"));
	co.setEcommerce(rs.getString("ecommerce"));
	co.setEmail(rs.getString("email"));
	co.setId(rs.getInt("id"));
	co.setMessage(rs.getString("message"));
	co.setName(rs.getString("name"));
	co.setPerformance(rs.getString("performance"));
	co.setPhn(rs.getString("phn"));
	co.setPrint(rs.getString("print"));
	co.setVr(rs.getString("vr"));
	co.setWebbdev(rs.getString("webbdev"));
	co.setConfirmation_status(rs.getString("confirmation_status"));
	co.setLatest_confirmation_email_sent_time(rs.getString("latest_confirmation_email_sent_time"));
	co.setConfirmation_url(rs.getString("confirmation_url"));
	
	
    return co;
}
public ArrayList<free_audit> fetchFreeAuditRequests(String search,int start,int total){
		
		ArrayList<free_audit> fa=new ArrayList<>();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			if(search.equals("0")) {
				rs=st.executeQuery("select * from free_audit order by id desc limit "+(start-1)+","+total);
				System.out.println("select * from free_audit order by id desc limit "+(start-1)+","+total);

			}else {
				rs=st.executeQuery("select * from free_audit where name LIKE '%"+search+"%' or email LIKE '%"+search+"%' or phone LIKE '%"+search+"%' order by id desc limit "+(start-1)+","+total);
				System.out.println("select * from free_audit where name LIKE '%"+search+"%' or email LIKE '%"+search+"%' or phone LIKE '%"+search+"%' order by id desc limit "+(start-1)+","+total);
	 
			}
			while(rs.next()) {
				fa.add(parseFreeAudits(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(st!=null) {
					st.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return fa;
	}
public Quote parseQuote(ResultSet rs)throws Exception{
	Quote q = new Quote();
	q.setId(rs.getInt("id"));
	q.setName(rs.getString("name"));
	q.setEmail(rs.getString("email"));
	q.setPhone(rs.getString("phone"));
	q.setServices(rs.getString("services"));
	q.setRequirement(rs.getString("requirement"));
	q.setTrashed(rs.getString("trashed"));
	q.setSubmissionDate(rs.getString("submission_date"));
	
	return q;
}
public GeneralInquiries parseGeneralInquiries(ResultSet rs)throws Exception{
	GeneralInquiries gi = new GeneralInquiries();
	gi.setId(rs.getInt("id"));
	gi.setName(rs.getString("name"));
	gi.setEmail(rs.getString("email"));
	gi.setPhone(rs.getString("phone"));
	gi.setCompanyWebsite(rs.getString("company_website"));
	gi.setDropALine(rs.getString("drop_a_line"));
	gi.setTrashed(rs.getString("trashed"));
	gi.setSubmissionDate(rs.getString("submission_date"));
	
	return gi;
}
public SmsApiData parseSmsApiData(ResultSet rs) throws Exception{
	SmsApiData sad = new SmsApiData();
	
	sad.setId(rs.getInt("id"));
	sad.setSenderId(rs.getString("sender_id"));
	sad.setMobile(rs.getString("mobile"));
	sad.setClientId(rs.getString("client_id"));
	sad.setMessage(rs.getString("message"));
	sad.setApiKey(rs.getString("apikey"));
	sad.setSubmissionTime(rs.getString("submission_time"));
	
	return sad;
}
public TalkToSales parseTalkToSales(ResultSet rs)throws Exception{
	TalkToSales tos = new TalkToSales();
	
	tos.setId(rs.getInt("id"));
	tos.setCountry(rs.getString("country"));
	tos.setName(rs.getString("name"));
	tos.setEmail(rs.getString("email"));
	tos.setPhone(rs.getString("phone"));
	tos.setSubmission(rs.getString("submission"));
	tos.setTrashed_status(rs.getString("trashed_status"));
	
	return tos;
}
public edit_homepage_images parseHomeageImages(ResultSet rs)throws Exception{
	edit_homepage_images eh = new edit_homepage_images();
	
	eh.setId(rs.getInt("id"));
	eh.setFileName(rs.getString("filename"));
	eh.setLast_updated(rs.getString("last_updated"));
	eh.setLinks(rs.getString("links"));
	
	return eh;
}
public careers parseCareers(ResultSet rs)throws Exception{
	careers c = new careers();
	
	c.setId(rs.getInt("id"));
	c.setName(rs.getString("name"));
	c.setEmail(rs.getString("email"));
	c.setPhone(rs.getString("phone"));
	c.setPosition(rs.getString("position"));
	c.setFilepath(rs.getString("filepath"));
	c.setSubmission_date(rs.getString("submission_date"));
	
	return c;
}
public consultations parseConsultations(ResultSet rs)throws Exception{
	consultations c = new consultations();
	
	c.setId(rs.getInt("id"));
	c.setName(rs.getString("name"));
	c.setEmail(rs.getString("email"));
	c.setPhone(rs.getString("phone"));
	c.setCountry(rs.getString("country"));
	c.setServices(rs.getString("services"));
	c.setBudget(rs.getString("budget"));
	c.setWebEmail(rs.getString("webEmail"));
	c.setMsg(rs.getString("msg"));
	c.setTrashed(rs.getString("trashed"));
	c.setSubmission(rs.getString("submission"));
	
	return c;
}
public call_back parseCallBack(ResultSet rs)throws Exception{
	call_back cb=new call_back();
	
	cb.setId(rs.getInt("id"));
	cb.setName(rs.getString("name"));
	cb.setEmail(rs.getString("email"));
	cb.setPhone(rs.getString("phone"));
	cb.setTimeslot_one(rs.getString("timeslot_one"));
	cb.setTimeslot_two(rs.getString("timeslot_two"));
	cb.setTimeslot_three(rs.getString("timeslot_three"));
	cb.setEmail_confirmation(rs.getString("email_confirmation"));
	cb.setTrashed(rs.getString("trashed"));
	cb.setSubmission_date(rs.getString("submission_date"));
	cb.setLatest_confirmation_email_sent_time(rs.getString("latest_confirmation_email_sent_time"));
	cb.setConfirmation_url(rs.getString("confirmation_url"));
	
	return cb;
}
public free_audit parseFreeAudits(ResultSet rs)throws Exception{
	 free_audit fa=new free_audit();
	 
	 fa.setId(rs.getInt("id"));
	 fa.setName(rs.getString("name"));
	 fa.setEmail(rs.getString("email"));
	 fa.setPhone(rs.getString("phone"));
	 fa.setMsg(rs.getString("msg"));
	 fa.setSource_page(rs.getString("source_page"));
	 fa.setSubmission_date(rs.getString("submission_date"));
	 fa.setConfirmation_status(rs.getString("confirmation_status"));
	 fa.setTrashed_status(rs.getString("trashed_status"));
	 fa.setConfirmation_url(rs.getString("confirmation_url"));
	 fa.setLatest_confirmation_email_sent_time(rs.getString("latest_confirmation_email_sent_time"));
	
	return fa;
	
}
public ArrayList<chat_initiate_request> fetchChatInitiateRequestsByChatId(String chatid){

		
		ArrayList<chat_initiate_request> ae=new ArrayList<>();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			conn=DbConnection.getInstance().getConnection();
			st=conn.createStatement();
			rs=st.executeQuery("select * from chat_initiate_request where chatid='"+chatid+"'");
			while(rs.next()) {
				ae.add(parseChatInitiateRequests(rs));
			}
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(rs!=null) {
					rs.close();
				}if(st!=null) {
					st.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return ae;

	}
public chat_initiate_request parseChatInitiateRequests(ResultSet rs)throws Exception{
	
	chat_initiate_request c=new chat_initiate_request();
	c.setChat_status(rs.getString("chat_status"));
	c.setChatid(rs.getString("chatid"));
	c.setEmail(rs.getString("email"));
	c.setId(rs.getInt("id"));
	c.setLast_reply_by(rs.getString("last_reply_by"));
	c.setLast_reply_time(rs.getString("last_reply_time"));
	c.setLatest_admin_replying_id(rs.getString("latest_admin_replying_id"));
	c.setLatest_admin_replying_name(rs.getString("latest_admin_replying_name"));
	c.setMessage(rs.getString("message"));
	c.setMobile(rs.getString("mobile"));
	c.setName(rs.getString("name"));
	c.setChat_request_status(rs.getString("chat_request_status"));
	
	return c;
}
	public Boolean checkAdmin(admin admin){ 
//		TrippleDes td= new TrippleDes();
		
		 String password;
		 String email;
		 String name;
		 Boolean status =false;
		 int count=0;
		 int id=0;
		 Connection conn=DbConnection.getInstance().getConnection();
		 Statement stmt=null;
		 Statement stmt1=null;
		 ResultSet rs = null;
		 ResultSet rs1 = null;
		 
	   	  email = admin.getEmail();
	   	  password =admin.getPassword();
	   	  name=admin.getName();
	   	  
//	   	password=td.encrypt(password);
	   	 
	   	  try {
	         	
	         	stmt=conn.createStatement();
	         	String query = "select count(*) from adminlogin where email='"+email+"' and password='"+password+"'";
	         	rs = stmt.executeQuery(query);
	         	 while (rs.next()) {
	         		 count=rs.getInt(1);
	         	 }
	         		 if(count!=0){
	         			stmt1=conn.createStatement();
	         			String query1 = "select * from adminlogin where email='"+email+"' and password='"+password+"'";
	         			rs1 = stmt1.executeQuery(query1);
	                	 while (rs1.next()) {
	                		 
	                		 id=rs1.getInt("id");
	                		 email=rs1.getString("email");
	                		 password=rs1.getString("password");
	                		 name=rs1.getString("name");
	                		 admin.setId(id);
	                		 admin.setEmail(email);
	                		 admin.setPassword(password);
	                		 admin.setName(name);
	         		 
	         		 status=true;
	         		 
	                	 }
	         		 }else{
	         			 status=false;
	         		 }
	    			conn.close();

	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally
	         {
	        	 try {
	        	         if (conn != null)
	        	      	conn.close();
	        	      } catch (SQLException ignore) {} // no point handling

	        	      try {
	        	         if (stmt != null)
	        	             stmt.close();
	        	      } catch (SQLException ignore) {} // no point handling

	        	   try {
	        	         if (stmt1 != null)
	        	        	 stmt1.close();
	        	      } catch (SQLException ignore) {} // no point handling
	        	 }
	   	  
	   	  
	     return status; 
	   }
	public int logTimingDetails(int id,String logintime){
		int status1=0;
		Connection conn=DbConnection.getInstance().getConnection();
		PreparedStatement  ps1=null;
//		logger.info("enter in function");
	    
	     try{
//	    	 logger.info("enter in try");
	         ps1=conn.prepareStatement("update adminlogin set online_status='1' where id='"+id+"' ");
//	         logger.info(ps1);
	         status1 = ps1.executeUpdate();
//	         logger.info("status1.function=>>"+status1);
//	         logger.info("execute query done");
	         
				conn.close();
	    }
	     catch(Exception e){
//	         logger.info(e);
	     }finally
	     {
	    	 try {
	    	         if (conn != null)
	    	      	conn.close();
	    	      } catch (SQLException ignore) {} // no point handling

	    	   try {
	    	         if (ps1 != null)
	    	      	ps1.close();
	    	      } catch (SQLException ignore) {} // no point handling
	    	 }
		
//		logger.info("out of try");
		return status1;
	}
public boolean checkChatInitiatedOrNot(String chatid) {
		
		boolean check=false;
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=DbConnection.getInstance().getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select * from chat_initiate_request where chatid='"+chatid+"'");
			while(rs.next()) {
				check=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(con!=null) {
					con.close();
				}if(rs!=null) {
					rs.close();
				}if(st!=null) {
					st.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	return check;
	}
public int updateChatDetailsByAdmin(String chatid,String latest_admin_replying_id,String latest_admin_replying_name,String chat_status,String last_reply_by,String last_reply_time,String chat_request_status)
{
        int i=0;
		Connection conn=null;
		PreparedStatement pst=null;
	//	Statement st=null;
		ResultSet rs=null;
		
		
		try {
			conn=DbConnection.getInstance().getConnection();
	//		st=conn.createStatement();
			pst=conn.prepareStatement("update chat_initiate_request set latest_admin_replying_id='"+latest_admin_replying_id+"',latest_admin_replying_name='"+latest_admin_replying_name+"',chat_status='"+chat_status+"',last_reply_by = '"+last_reply_by+"',last_reply_time='"+last_reply_time+"',chat_request_status='"+chat_request_status+"' where chatid='"+chatid+"'");
			System.out.println(pst.toString());
			i=pst.executeUpdate();
			if(i>0) {
				System.out.println("Successfull==="+pst.toString());
			}
			else {
				System.out.println("Some error occured==="+pst.toString());
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(pst!=null) {
					pst.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return i;
}
public String ChatStatus(String chatid) {
		
		String status="";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
			try {
			con=DbConnection.getInstance().getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select * from chat_initiate_request where chatid='"+chatid+"'");
			while(rs.next()) {
				status=rs.getString("chat_status");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) {
					con.close();
				}if(rs!=null) {
					rs.close();
				}if(st!=null) {
					st.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	return status;
	}

public String firebaseTrigger(String chatid) {
	
	String check="false";
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	
	Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
    String server_datetime = String.valueOf(sdf.format(cal.getTime()));
    System.out.println("server_datetime=>>"+server_datetime);
	
	try {
		con=DbConnection.getInstance().getConnection();
		st=con.createStatement();
		rs=st.executeQuery("select * from chat_initiate_request where chatid='"+chatid+"'");
		while(rs.next()) {
			
				 System.out.println("last_reply_time=>>"+rs.getString("last_reply_time"));
					Date d1=sdf.parse(server_datetime);
					Date d2=sdf.parse(rs.getString("last_reply_time"));
					 long difference_In_Time 
		             = d1.getTime() - d2.getTime();

			          long diffMinutes = difference_In_Time / (60 * 1000) % 60;

			         System.out.println("difference in minutes==="+diffMinutes);
			          final int MILLI_TO_MIN = 1000 * 60;
			          int mins=(int) (d1.getTime() - d2.getTime()) / MILLI_TO_MIN;
			          System.out.println("difference in minsminss==="+mins);
			          /*if(rs.getString("last_reply_by").equals("user") && rs.getString("chat_status").equals("in_process") && mins>=5) {
			        	  check="true";
			          }*/
			          if(rs.getString("last_reply_by").equals("user") || rs.getString("last_reply_by").equals("defaultt")) {
			        	  System.out.println("firsttttt iffffff");
			        	  if(rs.getString("chat_status").equals("in_process") || rs.getString("chat_status").equals("on_hold")) {
			        		  System.out.println("seconddddd iffffff");
			        		  if(mins>=3) {
			        			  System.out.println("thirdddddd iffffff");
			        			  check="true";  
			        		  }
			        	  }
			          }
	
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		try {
			if(con!=null) {
				con.close();
			}if(rs!=null) {
				rs.close();
			}if(st!=null) {
				st.close();
			}
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
	}
return check;
}
public int insertIntoChatInitiate(String name,String email,String phn,String message,String chatid)
{
int id=0;
		Connection conn=null;
		PreparedStatement pst=null;
	//	Statement st=null;
		ResultSet rs=null;
		
		 Calendar cal = Calendar.getInstance();
	     SimpleDateFormat sdf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
	     String submission_time = String.valueOf(sdf.format(cal.getTime()));
		
		try {
			conn=DbConnection.getInstance().getConnection();
	//		st=conn.createStatement();
			pst=conn.prepareStatement("insert into chat_initiate_request(name,email,mobile,message,chatid) values ('"+name+"','"+email+"','"+phn+"','"+message+"','"+chatid+"')",Statement.RETURN_GENERATED_KEYS);
			System.out.println(pst.toString());
			int i=pst.executeUpdate();
			if(i>0) {
				ResultSet gen=pst.getGeneratedKeys();
				if(gen.next()) {
					id=gen.getInt(1);
				}
				
			}
			else {
				System.out.println("Some rror occured");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}if(pst!=null) {
					pst.close();
				}if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			e2.printStackTrace();
			}
		}
		return id;
}



}
