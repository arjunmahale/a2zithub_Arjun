package com.trg.servlet;

import java.io.IOException;

import com.trg.db.ConnectDB;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        boolean isValid = ConnectDB.authenticateUser(username, password, role);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

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
                    response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid credentials or role.");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}
