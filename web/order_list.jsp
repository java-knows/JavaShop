<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>我的订单</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<script type="text/javascript" src="js/DeliveryConfirm.js"></script>
	<style>
		.order-container {
			padding: 40px 0;
			background: #f8f9fa;
		}
		.order-table {
			background: white;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		}
		.table th {
			background: #f8f9fa;
			border-top: none;
		}
		.status-badge {
			padding: 5px 10px;
			border-radius: 15px;
			font-size: 14px;
		}
		.order-item {
			margin-bottom: 5px;
			padding: 5px 0;
			border-bottom: 1px dashed #eee;
		}
		.confirm-btn {
			border-radius: 20px;
			padding: 5px 15px;
		}
	</style>
</head>
<body>

	<jsp:include page="header.jsp">
		<jsp:param name="flag" value="5"></jsp:param>
	</jsp:include>

	<div class="order-container">
		<div class="container">
			<h2 class="text-center mb-4">我的订单</h2>
			
			<div class="order-table">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>订单ID</th>
							<th>总价</th>
							<th>商品详情</th>
							<th>收货人信息</th>
							<th>订单状态</th>
							<th>支付方式</th>
							<th>下单时间</th>
							<th>操作</th>
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
											<span class="status-badge bg-warning text-white">已付款</span>
										</c:when>
										<c:when test="${order.status==3}">
											<span class="status-badge bg-info text-white">已发货</span>
										</c:when>
										<c:when test="${order.status==4}">
											<span class="status-badge bg-primary text-white">已送达</span>
										</c:when>
										<c:when test="${order.status==5}">
											<span class="status-badge bg-success text-white">已完成</span>
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
								<td>
									<c:choose>
										<c:when test="${order.status==5}">
											<span class="text-success">已确认收货</span>
										</c:when>
										<c:otherwise>
											<button class="btn btn-primary confirm-btn" onclick="DeliveryConfirm(${order.id})">
												确认收货
											</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>