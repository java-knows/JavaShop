<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <style>
        body {
            background-color: #f5f6fa;
        }
        
        .welcome-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        
        .welcome-header {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .welcome-title {
            color: #2c3e50;
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 20px;
        }
        
        .welcome-subtitle {
            color: #7f8c8d;
            font-size: 18px;
        }
        
        .stats-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin: 30px 0;
        }
        
        .stat-box {
            flex: 0 0 200px;
            padding: 20px;
            margin: 10px;
            text-align: center;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .stat-box:hover {
            transform: translateY(-5px);
        }
        
        .stat-icon {
            font-size: 40px;
            margin-bottom: 15px;
            color: #3498db;
        }
        
        .stat-title {
            font-size: 16px;
            color: #34495e;
            margin-bottom: 10px;
        }
        
        .stat-value {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .alert-welcome {
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 20px;
            font-size: 18px;
            text-align: center;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(46, 204, 113, 0.2);
        }
        
        .quick-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 30px;
        }
        
        .quick-link {
            padding: 12px 25px;
            border-radius: 6px;
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .quick-link:hover {
            transform: translateY(-2px);
            text-decoration: none;
            color: #fff;
        }
        
        .link-orders {
            background-color: #3498db;
        }
        
        .link-products {
            background-color: #e74c3c;
        }
        
        .link-users {
            background-color: #f1c40f;
        }
        
        .link-categories {
            background-color: #9b59b6;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="welcome-container">
        <div class="welcome-header">
            <h1 class="welcome-title">欢迎使用商城后台管理系统</h1>
            <p class="welcome-subtitle">今天是个好日子，让我们开始管理工作吧！</p>
        </div>
        
        <div class="alert alert-welcome" role="alert">
            <i class="glyphicon glyphicon-ok-circle"></i> 恭喜您！登录成功
        </div>
        
        <div class="stats-container">
            <div class="stat-box">
                <div class="stat-icon">
                    <i class="glyphicon glyphicon-shopping-cart"></i>
                </div>
                <div class="stat-title">商品总数</div>
                <div class="stat-value">${goodsCount}</div>
            </div>
            
            <div class="stat-box">
                <div class="stat-icon">
                    <i class="glyphicon glyphicon-list-alt"></i>
                </div>
                <div class="stat-title">订单总数</div>
                <div class="stat-value">${orderCount}</div>
            </div>
            
            <div class="stat-box">
                <div class="stat-icon">
                    <i class="glyphicon glyphicon-user"></i>
                </div>
                <div class="stat-title">用户总数</div>
                <div class="stat-value">${userCount}</div>
            </div>
            
            <div class="stat-box">
                <div class="stat-icon">
                    <i class="glyphicon glyphicon-th-list"></i>
                </div>
                <div class="stat-title">类目总数</div>
                <div class="stat-value">${typeCount}</div>
            </div>
        </div>
        
        <div class="quick-links">
            <a href="/admin/order_list" class="quick-link link-orders">
                <i class="glyphicon glyphicon-list-alt"></i> 订单管理
            </a>
            <a href="/admin/goods_list" class="quick-link link-products">
                <i class="glyphicon glyphicon-shopping-cart"></i> 商品管理
            </a>
            <a href="/admin/user_list" class="quick-link link-users">
                <i class="glyphicon glyphicon-user"></i> 用户管理
            </a>
            <a href="/admin/type_list" class="quick-link link-categories">
                <i class="glyphicon glyphicon-th-list"></i> 类目管理
            </a>
        </div>
    </div>
</div>
</body>
</html>