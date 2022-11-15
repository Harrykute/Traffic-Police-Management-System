package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	public static Connection getConnection()

	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stolen_vehicle", "root","");
			return con;
		}
		catch (Exception e) 
		{
			System.out.println("Exception is " + e);

		}
		return con;
	}

	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub  
		
		

	}

}
