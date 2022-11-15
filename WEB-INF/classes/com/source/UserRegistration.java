package com.source;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	

	
	public void init(ServletConfig config) throws ServletException 
	{
		try {

			con = DbConnection.getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(); 
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String phoneNum=request.getParameter("phoneNum");
		String email = request.getParameter("email");
		//String password = request.getParameter("password");
		String password=" ";
		System.out.println("Adding customer : "+fname+" "+lname +" "+dob + " "+gender+" "+phoneNum+" "+email+" "+password);
		
		try
		{
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `user_info` where email='"+email+"' OR phone_num = '"+phoneNum+"'");
			ResultSet rs =ps1.executeQuery();
			if(!rs.next())
			{
				ps=con.prepareStatement("INSERT INTO `user_info`"
						+ "(`first_name`, `last_name`, `dob`, `address`, `gender`, `email`, `phone_num`, `password`)"
						+ " VALUES "
						+ "('"+fname+"','"+lname+"','"+dob+"','"+address+"','"+gender+"','"+email+"','"+phoneNum+"','"+password+"')");
						
				int result=ps.executeUpdate();
				if(result>0)
				{
					Statement st=con.createStatement();
					String query="select * from user_info where email='"+email+"';";
					ResultSet rs1=st.executeQuery(query);
				    rs1.next();
				    System.out.println(rs1.getString("id"));
				    System.out.println(rs1.getString("first_name"));
							    session.setAttribute("UserId", rs1.getString("id"));
							    session.setAttribute("name", rs1.getString("first_name"));
				
					System.out.println("Registration Successfully");
					response.sendRedirect("CustomerVehicle.jsp");
				}
				else 
				{
					System.out.println("Adding failed");
					response.sendRedirect("CustomerSignUp.jsp?failure");
				}
			}
			else{
				System.out.println("Customer already exists. ");
				response.sendRedirect("CustomerSignUp.jsp?alreadyExist");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		

	
	}

}
