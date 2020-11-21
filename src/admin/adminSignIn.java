package admin;

import java.io.IOException;




import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import beans.admin;
import dao.ApiController;

/**
 * Servlet implementation class adminSignIn
 */
@WebServlet("/adminSignIn")
public class adminSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }
    final static Logger logger = Logger.getLogger(adminSignIn.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String type=request.getParameter("type");
        if(type.equals("admin")) {
        	
        
       admin admin = new admin();
        ApiController apiController = new ApiController();
        logger.info("111111111111");
        int id=0;
        
        Boolean status = false;
        
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name="";
        
        admin.setEmail(email);
        admin.setPassword(password);
         
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
        String logintime = String.valueOf(sdf.format(cal.getTime()));
        try {
        	logger.info("2222222222222");
      	status = apiController.checkAdmin(admin);
      	logger.info("33333333333");
        	id = admin.getId();
        	email = admin.getEmail();
        	password = admin.getPassword();
        	name=admin.getName();
        	
        	 if (status == true) {
        		 logger.info("444444444444");
        		 apiController.logTimingDetails(id, logintime);
        		 logger.info("55555555555");
                 HttpSession admin_session = request.getSession();

                 admin_session.setAttribute("id", id);
                 admin_session.setAttribute("email", email);
                 admin_session.setAttribute("password", password);
                 admin_session.setAttribute("admin_name", name);
                 
                 response.sendRedirect("admin/dashboard.jsp?clr=home&act=home1");
             
               out.println("</body>");
               out.println("</html>");
        		 
        	 }else{ 
        		 
        		 status = false;
        		 
        		 String message = "Login Failed,Please try again";
        		 request.setAttribute("message", message);
                // request.getRequestDispatcher("admin/adminlogin.jsp").include(request, response);
                 response.sendRedirect("admin/adminlogin.jsp");
                 
                   out.println("</body>");
                   out.println("</html>");
        	 }
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
processRequest(request, response);	
}

}
