<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .dashboard {
            padding: 30px;
        }
        .card {
            border-radius: 12px;
            transition: 0.3s;
        }
        .card:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
            transform: translateY(-4px);
        }
        .header {
            background-color: #00796b;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome, Shop Admin - <%= username %></h1>
        <p>Manage Your Shop</p>
    </div>

    <div class="container dashboard">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card bg-primary text-white">
                    <div class="card-body">
                        <h5 class="card-title">Stock Management</h5>
                        <p class="card-text">View & update current shop stock</p>
                        <a href="#" class="btn btn-light">Manage Stock</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <h5 class="card-title">Billing</h5>
                        <p class="card-text">Generate new bills & view receipts</p>
                        <a href="#" class="btn btn-light">Start Billing</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card bg-warning text-dark">
                    <div class="card-body">
                        <h5 class="card-title">Payments</h5>
                        <p class="card-text">View shop payments & receipts</p>
                        <a href="#" class="btn btn-dark">Track Payments</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card bg-info text-white">
                    <div class="card-body">
                        <h5 class="card-title">Reports</h5>
                        <p class="card-text">Check shop-specific sales & stock reports</p>
                        <a href="#" class="btn btn-light">View Reports</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card bg-dark text-white">
                    <div class="card-body">
                        <h5 class="card-title">User Access</h5>
                        <p class="card-text">Manage Cashiers & Stock Managers</p>
                        <a href="#" class="btn btn-light">Manage Users</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
