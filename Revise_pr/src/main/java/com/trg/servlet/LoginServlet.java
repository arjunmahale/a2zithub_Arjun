package com.trg.servlet;

import java.io.IOException;
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

        // Retrieve input from form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Debug logs
        System.out.println("➡️ Username: " + username + ", Role: " + role);

        boolean isAuthenticated = false;

        try {
            // Validate credentials
            //isAuthenticated = ;
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (ConnectDB.authenticateUser(username, password)) {
            // ✅ Authentication successful
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // ✅ Redirect to respective dashboard
            switch (role.toLowerCase()) {
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
                    // Invalid role provided
                    request.setAttribute("error", "Invalid role selected.");
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
            }

        } else {
            // ❌ Invalid credentials
            request.setAttribute("error", "Invalid username or password.");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); // or loginError.jsp
            rd.forward(request, response);
        }
    }
}
