<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>用户购买记录</title>
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
        .nav-tabs {
            margin-bottom: 25px;
            border-bottom: 2px solid #eee;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .nav-tabs > li > a {
            color: #7f8c8d;
            font-weight: 500;
            padding: 12px 20px;
            border: none;
            border-bottom: 2px solid transparent;
            margin-bottom: -2px;
            transition: all 0.3s ease;
        }
        .nav-tabs > li.active > a {
            border: none;
            border-bottom: 2px solid #3498db;
            color: #3498db;
            font-weight: 600;
        }
        .table th {
            background: #f8f9fa;
            color: #2c3e50;
            font-weight: 600;
            padding: 15px;
        }
        .order-info {
            padding: 5px 0;
            color: #34495e;
        }
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            color: #fff;
            font-weight: 500;
            font-size: 12px;
            display: inline-block;
        }
        .status-paid {
            background-color: #f1c40f;
        }
        .status-shipping {
            background-color: #3498db;
        }
        .status-delivered {
            background-color: #2ecc71;
        }
        .status-received {
            background-color: #9b59b6;
        }
        .btn-action {
            padding: 6px 12px;
            margin: 3px;
            border-radius: 4px;
            font-size: 13px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="header.jsp">
        <jsp:param name="flag" value="2"></jsp:param>
    </jsp:include>

    <div class="list-container">
        <ul role="tablist" class="nav nav-tabs">
            <li <c:if test="${status==0}">class="active"</c:if>>
                <a href="/admin/user_order?id=${id}" style="color: #1E9FFF">${username}的购买记录</a>
            </li>
        </ul>

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th width="5%">ID</th>
                <th width="10%">总价</th>
                <th width="25%">商品详情</th>
                <th width="25%">收货信息</th>
                <th width="10%">订单状态</th>
                <th width="10%">支付方式</th>
                <th width="15%">下单时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td>${order.id}</td>
                    <td class="text-danger">¥${order.total}</td>
                    <td>
                        <c:forEach items="${order.itemList}" var="item">
                            <div class="order-item">
                                    ${item.goodsName}(¥${item.price}) x ${item.amount}
                            </div>
                        </c:forEach>
                    </td>
                    <td>
                        <div>${order.name}</div>
                        <div>${order.phone}</div>
                        <div class="text-muted">${order.address}</div>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status==2}">
                                <span class="status-badge status-paid">已付款</span>
                            </c:when>
                            <c:when test="${order.status==3}">
                                <span class="status-badge status-shipping">已发货</span>
                            </c:when>
                            <c:when test="${order.status==4}">
                                <span class="status-badge status-delivered">已送达</span>
                            </c:when>
                            <c:when test="${order.status==5}">
                                <span class="status-badge status-received">已完成</span>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${order.paytype==1}">微信</c:when>
                            <c:when test="${order.paytype==2}">支付宝</c:when>
                            <c:when test="${order.paytype==3}">银行卡</c:when>
                        </c:choose>
                    </td>
                    <td>${order.datetime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
