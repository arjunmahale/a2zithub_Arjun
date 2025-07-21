package com.trg.servlet;

import java.io.IOException;

import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    // Dummy user credentials (In real-world, replace with DB authentication)
    private final HashMap<String, String> users = new HashMap<>();

    @Override
    public void init() throws ServletException {
        // Username-password-role pairs (for demo purpose)
        users.put("masteradmin:master", "admin123");
        users.put("shopadmin:shop", "shop123");
        users.put("cashier1:cashier", "cash123");
        users.put("stock1:stock", "stock123");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        String key = username + ":" + role;
        String correctPassword = users.get(key);

        if (correctPassword != null && correctPassword.equals(password)) {
            // Save login info in session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirect to role-specific dashboard
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
            request.setAttribute("error", "Invalid credentials or role.");
            RequestDispatcher rd = request.getRequestDispatcher("404.html");
            rd.forward(request, response);
        }
    }
}
