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
    <title>Master Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7fa;
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
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            transform: translateY(-5px);
        }
        .header {
            background-color: #1d2b64;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome, Master Admin - <%= username %></h1>
        <p>Central Control Dashboard</p>
    </div>

    <div class="container dashboard">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Manage Shops</h5>
                        <p class="card-text">Create, Edit or Deactivate Shops</p>
                        <a href="#" class="btn btn-light">Manage</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Stock Distribution</h5>
                        <p class="card-text">Assign Inventory to Shops</p>
                        <a href="#" class="btn btn-light">Assign</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Vendor Management</h5>
                        <p class="card-text">Add/Edit Vendor Details & Ledger</p>
                        <a href="#" class="btn btn-light">View Vendors</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-info">
                    <div class="card-body">
                        <h5 class="card-title">System Users & Roles</h5>
                        <p class="card-text">Manage Access Levels for Staff</p>
                        <a href="#" class="btn btn-light">Configure Roles</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-dark">
                    <div class="card-body">
                        <h5 class="card-title">Reports</h5>
                        <p class="card-text">Sales, Stock, and Purchase Analytics</p>
                        <a href="#" class="btn btn-light">Generate</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5 class="card-title">Backup & Security</h5>
                        <p class="card-text">Manage Backups and Settings</p>
                        <a href="#" class="btn btn-light">Backup Now</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
