<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>客户列表</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/bootstrap.css"/> 
    <style>
        .list-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 25px;
            background: #fff;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            border-radius: 12px;
        }
        .header-actions {
            margin-bottom: 25px;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #eee;
        }
        .panel-title {
            color: #2c3e50;
            font-size: 24px;
            font-weight: 600;
            margin: 0;
        }
        .btn-success {
            padding: 8px 20px;
            font-weight: 500;
            border-radius: 6px;
        }
        .table {
            margin-bottom: 25px;
        }
        .table th {
            background: #f8f9fa;
            color: #2c3e50;
            font-weight: 600;
            padding: 15px;
        }
        .table td {
            padding: 15px;
            vertical-align: middle;
            color: #34495e;
        }
        .btn-action {
            padding: 6px 12px;
            margin: 2px;
            border-radius: 4px;
            font-size: 13px;
        }
        .alert {
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            border: none;
        }
        .alert-success {
            background-color: #2ecc71;
            color: #fff;
        }
        .alert-danger {
            background-color: #e74c3c;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="header.jsp">
        <jsp:param name="flag" value="2"></jsp:param>
    </jsp:include>

    <div class="list-container">
        <div class="header-actions">
            <h3 class="panel-title">客户管理</h3>
            <a class="btn btn-success" href="user_add.jsp">
                <i class="glyphicon glyphicon-plus"></i> 添加客户
            </a>
        </div>

        <c:if test="${!empty msg}">
            <div class="alert alert-success">
                <i class="glyphicon glyphicon-ok"></i> ${msg}
            </div>
        </c:if>
        <c:if test="${!empty failMsg}">
            <div class="alert alert-danger">
                <i class="glyphicon glyphicon-remove"></i> ${failMsg}
            </div>
        </c:if>

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="15%">用户名</th>
                    <th width="15%">邮箱</th>
                    <th width="15%">收件人</th>
                    <th width="15%">电话</th>
                    <th width="20%">地址</th>
                    <th width="15%">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${p.list}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.username}</td>
                        <td>${u.email}</td>
                        <td>${u.name}</td>
                        <td>${u.phone}</td>
                        <td>${u.address}</td>
                        <td>
                            <a class="btn btn-info btn-sm btn-action" href="/admin/user_order?id=${u.id}">
                                <i class="glyphicon glyphicon-lock"></i> 购买记录
                            </a>
                            <a class="btn btn-info btn-sm btn-action" href="/admin/user_reset.jsp?id=${u.id}&username=${u.username}&email=${u.email}">
                                <i class="glyphicon glyphicon-lock"></i> 重置密码
                            </a>
                            <a class="btn btn-primary btn-sm btn-action" href="/admin/user_editshow?id=${u.id}">
                                <i class="glyphicon glyphicon-edit"></i> 修改
                            </a>
                            <a class="btn btn-danger btn-sm btn-action" href="/admin/user_delete?id=${u.id}">
                                <i class="glyphicon glyphicon-trash"></i> 删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="/page.jsp">
            <jsp:param value="/admin/user_list" name="url"/>
        </jsp:include>
    </div>
</div>
</body>
</html>