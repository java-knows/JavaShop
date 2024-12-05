<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>购物车</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<style>
		.cart-items {
			padding: 40px 0;
			background: linear-gradient(to bottom, #f8f9fa 0%, #ffffff 100%);
			min-height: 70vh;
		}
		.cart-header {
			margin-bottom: 30px;
			transition: all 0.3s ease;
		}
		.cart-header:hover {
			transform: translateY(-5px);
		}
		.cart-sec {
			background: #fff;
			padding: 25px;
			border-radius: 15px;
			box-shadow: 0 3px 10px rgba(0,0,0,0.08);
			position: relative;
			overflow: hidden;
		}
		.cart-sec::before {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 4px;
			background: linear-gradient(to right, #3498db, #2ecc71);
			opacity: 0;
			transition: opacity 0.3s ease;
		}
		.cart-sec:hover::before {
			opacity: 1;
		}
		.cart-item-info {
			padding-left: 25px;
		}
		.cart-item-info h3 {
			margin-bottom: 15px;
			font-size: 18px;
			font-weight: 500;
		}
		.cart-item-info h3 a {
			color: #2c3e50;
			text-decoration: none;
			transition: color 0.3s ease;
		}
		.cart-item-info h3 a:hover {
			color: #3498db;
		}
		.cart-item img {
			max-width: 200px;
			border-radius: 8px;
			transition: transform 0.3s ease;
		}
		.cart-item img:hover {
			transform: scale(1.05);
		}
		.btn-cart {
			margin-right: 10px;
			border-radius: 20px;
			padding: 8px 20px;
			font-weight: 500;
			transition: all 0.3s ease;
		}
		.btn-cart:hover {
			transform: translateY(-2px);
			box-shadow: 0 2px 5px rgba(0,0,0,0.1);
		}
		.cart-total {
			background: #fff;
			padding: 30px;
			border-radius: 15px;
			box-shadow: 0 3px 15px rgba(0,0,0,0.1);
			margin-top: 40px;
		}
		.cart-total h3 {
			font-size: 24px;
			color: #2c3e50;
		}
		.cart-total .text-danger {
			font-weight: bold;
			font-size: 28px;
		}
		.checkout-btn {
			border-radius: 25px;
			padding: 12px 35px;
			font-size: 18px;
			font-weight: 500;
			text-transform: uppercase;
			letter-spacing: 1px;
			transition: all 0.3s ease;
			background: linear-gradient(45deg, #2ecc71, #27ae60);
			border: none;
		}
		.checkout-btn:hover {
			transform: translateY(-3px);
			box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
			background: linear-gradient(45deg, #27ae60, #2ecc71);
		}
		.empty-cart {
			text-align: center;
			padding: 50px 0;
		}
		.empty-cart i {
			font-size: 60px;
			color: #bdc3c7;
			margin-bottom: 20px;
		}
		.price-tag {
			display: inline-block;
			background: #f8f9fa;
			padding: 5px 15px;
			border-radius: 15px;
			color: #2c3e50;
		}
		.amount-badge {
			display: inline-block;
			background: #e8f4fd;
			color: #3498db;
			padding: 5px 15px;
			border-radius: 15px;
			font-weight: 500;
		}
	</style>
</head>
<body>

	<jsp:include page="header.jsp">
		<jsp:param name="flag" value="7"></jsp:param>
	</jsp:include>

	<div class="cart-items">
		<div class="container">
			<h2 class="text-center mb-4" style="color: #2c3e50; font-weight: 600;">我的购物车</h2>

			<c:choose>
				<c:when test="${empty order.itemMap}">
					<div class="empty-cart">
						<i class="glyphicon glyphicon-shopping-cart"></i>
						<h3>购物车是空的</h3>
						<p class="text-muted">快去添加商品吧！</p>
						<a href="/index" class="btn btn-primary btn-cart mt-3">去购物</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<c:forEach items="${order.itemMap}" var="item">
							<div class="cart-header col-md-6">
								<div class="cart-sec simpleCart_shelfItem">
									<div class="row align-items-center">
										<div class="col-md-4 cart-item">
											<a href="/goods_detail?id=${item.key}">
												<img src="${pageContext.request.contextPath}${item.value.goods.cover}" class="img-fluid">
											</a>
										</div>
										<div class="col-md-8 cart-item-info">
											<h3><a href="/goods_detail?id=${item.key}">${item.value.goods.name}</a></h3>
											<div class="mb-3">
												<span class="price-tag">单价: ¥${item.value.price}</span>
												<span class="amount-badge ml-2">数量: ${item.value.amount}</span>
											</div>
											<div class="mt-3">
												<a class="btn btn-outline-primary btn-cart" href="javascript:buy(${item.key});">
													<i class="glyphicon glyphicon-plus"></i> 增加
												</a>
												<a class="btn btn-outline-warning btn-cart" href="javascript:lessen(${item.key});">
													<i class="glyphicon glyphicon-minus"></i> 减少
												</a>
												<a class="btn btn-outline-danger btn-cart" href="javascript:deletes(${item.key});">
													<i class="glyphicon glyphicon-trash"></i> 删除
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<div class="cart-total text-right">
						<h3>订单总金额: <span class="text-danger">¥${order.total}</span></h3>
						<a class="btn btn-success checkout-btn mt-3" href="/order_submit">
							<i class="glyphicon glyphicon-check"></i> 去结算
						</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>