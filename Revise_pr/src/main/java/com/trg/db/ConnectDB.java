package com.trg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectDB {

	public static void connect() throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost/3306/demo","root","root");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	  public static boolean authenticateUser(String uname, String pass) {
	        boolean isAuthenticated = false;

	        try {
	        	Connection con= DriverManager.getConnection("jdbc:mysql://localhost/3306/demo","root","root");
	            if (con == null) {
	                System.out.println("❌ Database connection failed.");
	                return false;
	            }

	            String sql = "SELECT * FROM user WHERE uname = ? AND pass = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, uname);
	            ps.setString(2, pass);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {

	            	System.out.println(rs.getString(1)+rs.getString(2));
	                isAuthenticated = true;
	            }

	            rs.close();
	            ps.close();
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return isAuthenticated;
	    }
}
