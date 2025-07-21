package com.trg.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.trg.db.ConnectDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        boolean connected = false;
        boolean isAuthenticated = false;

        try {
            ConnectDB cn =new  ConnectDB(); // Get DB connection

            connected = (cn != null);

            if (connected) {


            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (connected && ConnectDB.authenticateUser(username, password)) {
            // Save login info in session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirect based on role
            switch (role) {
                case "master":
                    response.sendRedirect("masterDashboard.jsp");
                    break;
                case "shop":
                    response.sendRedirect("shopDashboard.jsp");
                    break;
                case "cashier":
                    response.sendRedirect("cashierDashboard.jsp");
                    break;
                case "stock":
                    response.sendRedirect("stockDashboard.jsp");
                    break;
                default:
                    response.sendRedirect("index.html");
            }

        } else {
            // Show error
            request.setAttribute("error", "Invalid credentials or role.");
            RequestDispatcher rd = request.getRequestDispatcher("404.html");
            rd.forward(request, response);
        }
    }
}
