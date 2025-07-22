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
    <title>Cashier Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7fafd;
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
            background-color: #344955;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome, Cashier - <%= username %></h1>
        <p>Billing & Receipt Operations</p>
    </div>

    <div class="container dashboard">
        <div class="row g-4">
            <div class="col-md-6">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Create Bill</h5>
                        <p class="card-text">Generate a new bill with customer and product details</p>
                        <a href="#" class="btn btn-light">New Bill</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Previous Receipts</h5>
                        <p class="card-text">View or reprint previous bills and receipts</p>
                        <a href="#" class="btn btn-light">View Receipts</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Pending Payments</h5>
                        <p class="card-text">Track customer bills with pending payments</p>
                        <a href="#" class="btn btn-light">Check Dues</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-white bg-dark">
                    <div class="card-body">
                        <h5 class="card-title">Customer Details</h5>
                        <p class="card-text">Lookup and save customer contact information</p>
                        <a href="#" class="btn btn-light">Customers</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
