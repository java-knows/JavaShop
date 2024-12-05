<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>支付成功</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<style>
		.success-container {
			padding: 80px 0;
			background: #f8f9fa;
			min-height: 60vh;
		}
		.success-card {
			background: white;
			padding: 40px;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.1);
			text-align: center;
		}
		.success-icon {
			color: #28a745;
			font-size: 60px;
			margin-bottom: 20px;
		}
		.view-order-btn {
			margin-top: 20px;
			padding: 10px 30px;
			border-radius: 25px;
			font-size: 18px;
			transition: all 0.3s ease;
		}
		.view-order-btn:hover {
			transform: translateY(-2px);
		}
	</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="success-container">
		<div class="container">
			<div class="success-card">
				<div class="success-icon">
					<i class="glyphicon glyphicon-ok-circle"></i>
				</div>
				
				<c:if test="${!empty msg}">
					<div class="alert alert-success">${msg}</div>
				</c:if>

				<a class="btn btn-success view-order-btn" href="/order_list">
					查看我的订单
				</a>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>