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
    <title>Stock Manager Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e8f0fe;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .dashboard {
            padding: 30px;
        }
        .card {
            border-radius: 12px;
            transition: 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
        }
        .header {
            background-color: #263238;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome, Stock Manager - <%= username %></h1>
        <p>Handle Inventory Activities</p>
    </div>

    <div class="container dashboard">
        <div class="row g-4">
            <div class="col-md-6">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Received Stock</h5>
                        <p class="card-text">Record new stock received from purchase or transfer</p>
                        <a href="#" class="btn btn-light">Record Stock</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Current Inventory</h5>
                        <p class="card-text">Check available stock and details by product</p>
                        <a href="#" class="btn btn-light">View Inventory</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Adjustments</h5>
                        <p class="card-text">Log stock damage, expiry or adjustments</p>
                        <a href="#" class="btn btn-light">Adjust Stock</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Low Stock Alerts</h5>
                        <p class="card-text">Monitor and respond to low stock notifications</p>
                        <a href="#" class="btn btn-light">Check Alerts</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
