
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    .admin-navbar {
        background-color: #2c3e50;
        border: none;
        border-radius: 0;
        margin-bottom: 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .admin-navbar .navbar-brand {
        color: #fff !important;
        font-size: 20px;
        font-weight: 600;
        padding: 15px 20px;
    }
    
    .admin-navbar .navbar-nav > li > a {
        color: #ecf0f1 !important;
        font-size: 15px;
        padding: 15px 20px;
        transition: all 0.3s ease;
    }
    
    .admin-navbar .navbar-nav > li > a:hover,
    .admin-navbar .navbar-nav > li > a:focus {
        background-color: #34495e !important;
        color: #fff !important;
    }
    
    .admin-navbar .navbar-nav > li.active > a {
        background-color: #3498db !important;
        color: #fff !important;
    }
    
    .admin-navbar .navbar-nav > li:last-child > a {
        background-color: #e74c3c;
    }
    
    .admin-navbar .navbar-nav > li:last-child > a:hover {
        background-color: #c0392b !important;
    }
    
    @media (max-width: 767px) {
        .admin-navbar .navbar-nav {
            margin: 0 -15px;
        }
        
        .admin-navbar .navbar-nav > li > a {
            padding: 12px 20px;
        }
    }
</style>

<nav class="navbar navbar-default admin-navbar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#admin-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">商城后台管理</a>
        </div>
        
        <div class="collapse navbar-collapse" id="admin-navbar-collapse">
            <ul class="nav navbar-nav">
                <li <c:if test="${param.flag==1}">class="active"</c:if>>
                    <a href="/admin/order_list">
                        <i class="glyphicon glyphicon-list-alt"></i> 订单管理
                    </a>
                </li>
                <li <c:if test="${param.flag==2}">class="active"</c:if>>
                    <a href="/admin/user_list">
                        <i class="glyphicon glyphicon-user"></i> 客户管理
                    </a>
                </li>
                <li <c:if test="${param.flag==3}">class="active"</c:if>>
                    <a href="/admin/goods_list">
                        <i class="glyphicon glyphicon-shopping-cart"></i> 商品管理
                    </a>
                </li>
                <li <c:if test="${param.flag==4}">class="active"</c:if>>
                    <a href="/admin/type_list">
                        <i class="glyphicon glyphicon-th-list"></i> 类目管理
                    </a>
                </li>
                <li>
                    <a href="/user_logout">
                        <i class="glyphicon glyphicon-log-out"></i> 退出系统
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 添加Bootstrap的JavaScript文件,用于响应式菜单 -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
