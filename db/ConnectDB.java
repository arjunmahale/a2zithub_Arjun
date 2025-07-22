package com.trg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectDB {

    public static Connection connect() throws SQLException {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ Correct driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useSSL=false&serverTimezone=UTC", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static boolean authenticateUser(String uname, String pass, String role) {
        boolean isAuthenticated = false;

        try (Connection con = connect()) {
            if (con == null) {
                System.out.println("❌ DB connection failed");
                return false;
            }

            String sql = "SELECT * FROM user WHERE uname = ? AND pass = ? AND role = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("✅ Authenticated: " + uname);
                isAuthenticated = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAuthenticated;
    }
}
