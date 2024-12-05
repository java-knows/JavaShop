<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>订单列表</title>
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
		<jsp:param name="flag" value="1"></jsp:param>
	</jsp:include>

    <div class="list-container">
        <ul role="tablist" class="nav nav-tabs">
            <li <c:if test="${status==0}">class="active"</c:if>>
                <a href="/admin/order_list">全部订单</a>
            </li>
            <li <c:if test="${status==2}">class="active"</c:if>>
                <a href="/admin/order_list?status=2">已付款</a>
            </li>
            <li <c:if test="${status==3}">class="active"</c:if>>
                <a href="/admin/order_list?status=3">配送中</a>
            </li>
            <li <c:if test="${status==4}">class="active"</c:if>>
                <a href="/admin/order_list?status=4">已送达</a>
            </li>
            <li <c:if test="${status==5}">class="active"</c:if>>
                <a href="/admin/order_list?status=5">已完成</a>
            </li>
        </ul>

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="10%">总价</th>
                    <th width="15%">商品详情</th>
                    <th width="15%">收货信息</th>
                    <th width="10%">订单状态</th>
                    <th width="10%">支付方式</th>
                    <th width="10%">下单用户</th>
                    <th width="15%">下单时间</th>
                    <th width="10%">操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${p.list}" var="order">
                    <tr>
                        <td>${order.id}</td>
                        <td>￥${order.total}</td>
                        <td>
                            <c:forEach items="${order.itemList}" var="item">
                                <div class="order-info">
                                    ${item.goodsName}(￥${item.price}) × ${item.amount}
                                </div>
                            </c:forEach>
                        </td>
                        <td>
                            <div class="order-info">${order.name}</div>
                            <div class="order-info">${order.phone}</div>
                            <div class="order-info">${order.address}</div>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${order.status==2}">
                                    <span class="status-badge status-paid">已付款</span>
                                </c:when>
                                <c:when test="${order.status==3}">
                                    <span class="status-badge status-shipping">配送中</span>
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
                                <c:when test="${order.paytype==1}">微信支付</c:when>
                                <c:when test="${order.paytype==2}">支付宝</c:when>
                                <c:when test="${order.paytype==3}">银行卡</c:when>
                            </c:choose>
                        </td>
                        <td>${order.user.username}</td>
                        <td>${order.datetime}</td>
                        <td>
                            <c:if test="${order.status==2}">
                                <a class="btn btn-primary btn-sm btn-action" href="/admin/order_status?id=${order.id}&status=3">
                                    <i class="glyphicon glyphicon-send"></i> 发货
                                </a>
                            </c:if>
                            <c:if test="${order.status==3}">
                                <a class="btn btn-success btn-sm btn-action" href="/admin/order_status?id=${order.id}&status=4">
                                    <i class="glyphicon glyphicon-check"></i> 送达
                                </a>
                            </c:if>
                            <a class="btn btn-danger btn-sm btn-action" href="/admin/order_delete?id=${order.id}&pageNumber=${p.pageNumber}&status=${status}">
                                <i class="glyphicon glyphicon-trash"></i> 删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <jsp:include page="/page.jsp">
            <jsp:param value="/admin/order_list" name="url"/>
            <jsp:param value="&status=${status}" name="param"/>
        </jsp:include>
    </div>
</div>
</body>
</html>