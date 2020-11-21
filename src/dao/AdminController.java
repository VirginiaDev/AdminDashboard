package dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import beans.edit_homepage_images;
import manager.ApiManager;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger log = Logger.getLogger(AdminController.class);
	
	private static final int ACTION_GET_LINK_BY_ID = 1;
	private static final int ACTION_UPDATE_LINK_BY_ID = 2;	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userAction = Integer.parseInt(request.getParameter("userAction"));
		
		switch(userAction) {
		case ACTION_GET_LINK_BY_ID:
			getLinkById(request, response);
			break;
			
		case  ACTION_UPDATE_LINK_BY_ID:
			updateLinkById(request, response);
			break;
		}
	}

	private void getLinkById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		ApiManager manager = new ApiManager();
		edit_homepage_images eh = manager.getLinkByID(id);
		request.setAttribute("edit_homepage", eh);
		request.getRequestDispatcher("admin/EditLink.jsp").forward(request, response);
	}


	private void updateLinkById(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String link = request.getParameter("link");
		
	}
}
