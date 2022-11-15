package com.source;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	/**
	 * 
	 */
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

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();

		System.out.println("1"+email+" "+pwd);

		PreparedStatement ps1;
		try {
			System.out.println("2");

			boolean success = false;
			ps1 = con
					.prepareStatement("SELECT * FROM `showroom` where username='"
							+ email + "' AND password='" + pwd + "'");
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				success = true;
				session.setAttribute("uname", "Admin");
				session.setAttribute("fname",  "Admin");
				//session.setAttribute("userId", rs.getString("id"));
			}

			if (success) {
				System.out.println("Login Done");

				response.sendRedirect("userHome.jsp?login=done");

			} else {
				System.out.println("Login fail");
				response.sendRedirect("userLogin.jsp?login=fail");
			}

		} catch (SQLException e) {
			System.out.println("Exception Occure :- " + e);
		}

	}

}
