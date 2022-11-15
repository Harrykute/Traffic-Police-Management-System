package com.source;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

/**
 * Servlet implementation class AddComplaint
 */
@WebServlet("/AddComplaint")
public class AddComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;

	public void init(ServletConfig config) throws ServletException {
		try {

			con = DbConnection.getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddComplaint() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String vehicleId = request.getParameter("vehicleId");

		System.out.println("Adding customer complaint : " + vehicleId);

		try {
			ps = con.prepareStatement("UPDATE `user_vehicles` SET `stolen`= '1',`status`='1' WHERE id = '"+vehicleId+"'");

			int result = ps.executeUpdate();
			if (result > 0) {
				System.out.println("Registration Successfully");
				response.sendRedirect("viewUsers.jsp?success");
			} else {
				System.out.println("Adding failed");
				response.sendRedirect("viewUsers.jsp?failure");
			}
		} catch (Exception e) {
			System.out.println("Exception Occure:- " + e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
