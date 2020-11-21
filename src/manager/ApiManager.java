package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.log4j.Logger;

import beans.edit_homepage_images;
import connection.DbConnection;
import dao.ApiController;

public class ApiManager {

	final static Logger log = Logger.getLogger(ApiManager.class);

	public boolean updateLinkByID(int id, String link) {
		boolean status = false;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DbConnection.getInstance().getConnection();
			String query = "update edit_homepage_images set links = ? where id ="+id;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, link);
			
			status = true;
			
			ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return status;
	}
	
	public edit_homepage_images getLinkByID(int id) {
		edit_homepage_images eh = new edit_homepage_images();
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			conn = DbConnection.getInstance().getConnection();
			st = conn.createStatement();
			String query = "select * from edit_homepage_images where id="+id;
			rs = st.executeQuery(query);
			while(rs.next()) {
				eh = new ApiController().parseHomeageImages(rs);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
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
		return eh;
	}
}
