package com.trg.db;

import java.sql.*;

public class ConnectDB {

//    public static Connection connect() throws SQLException {
//        Connection con = null;
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return con;
//    }

    @SuppressWarnings("unused")
	public static boolean authenticateUser(String uname, String pass) throws ClassNotFoundException {
        boolean isAuthenticated = false;

        try  {
        	Class.forName("com.mysql.jdbc.Driver");

           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "root");
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
                System.out.println("✅ Authenticated: " + rs.getString(1));
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
