<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>支付</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<style>
		.submit-container {
			padding: 40px 0;
			background: linear-gradient(to bottom right, #f8f9fa, #ffffff);
		}
		.form-section {
			background: white;
			padding: 30px;
			border-radius: 15px;
			box-shadow: 0 0 20px rgba(0,0,0,0.1);
			margin-bottom: 30px;
		}
		.section-title {
			color: #2c3e50;
			font-size: 24px;
			font-weight: 600;
			margin-bottom: 25px;
			text-align: center;
		}
		.form-group {
			margin-bottom: 20px;
		}
		.form-control {
			height: 45px;
			border-radius: 8px;
			border: 2px solid #e0e0e0;
			padding: 10px 15px;
			transition: all 0.3s ease;
		}
		.form-control:focus {
			border-color: #3498db;
			box-shadow: 0 0 0 3px rgba(52,152,219,0.2);
		}
		.payment-options {
			display: flex;
			justify-content: center;
			gap: 30px;
			margin: 30px 0;
		}
		.payment-option {
			position: relative;
			width: 200px;
			padding: 15px;
			border: 2px solid #e0e0e0;
			border-radius: 10px;
			text-align: center;
			cursor: pointer;
			transition: all 0.3s ease;
		}
		.payment-option:hover {
			transform: translateY(-5px);
			box-shadow: 0 5px 15px rgba(0,0,0,0.1);
		}
		.payment-option.selected {
			border-color: #3498db;
			background-color: #f8f9fa;
		}
		.payment-option input[type="radio"] {
			position: absolute;
			opacity: 0;
		}
		.payment-option img {
			max-height: 60px;
			margin-bottom: 10px;
		}
		.payment-option label {
			display: block;
			cursor: pointer;
		}
		.total-amount {
			text-align: center;
			font-size: 24px;
			color: #e74c3c;
			margin: 20px 0;
		}
		.submit-btn {
			background: linear-gradient(45deg, #2ecc71, #27ae60);
			color: white;
			border: none;
			border-radius: 8px;
			padding: 15px 40px;
			font-size: 18px;
			font-weight: 500;
			width: 100%;
			transition: all 0.3s ease;
		}
		.submit-btn:hover {
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(46,204,113,0.3);
		}
	</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="submit-container">
		<div class="container">
			<form action="/order_confirm" method="post" id="orderForm">
				<div class="form-section">
					<h2 class="section-title">确认收货信息</h2>
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="form-group">
								<label>收货人</label>
								<input type="text" class="form-control" name="name" 
									   value="${user.name}" required="required">
							</div>
							<div class="form-group">
								<label>收货电话</label>
								<input type="text" class="form-control" name="phone" 
									   value="${user.phone}" required="required">
							</div>
							<div class="form-group">
								<label>收货地址</label>
								<input type="text" class="form-control" name="address" 
									   value="${user.address}" required="required">
							</div>
						</div>
					</div>
				</div>

				<div class="form-section">
					<h2 class="section-title">选择支付方式</h2>
					<div class="total-amount">
						支付金额: ¥${order.total}
					</div>
					<div class="payment-options">
						<div class="payment-option" onclick="selectPayment(this, 1)">
							<input type="radio" name="paytype" value="1" checked>
							<img src="images/wechat.jpg" alt="微信支付">
							<span>微信支付</span>
						</div>
						<div class="payment-option" onclick="selectPayment(this, 2)">
							<input type="radio" name="paytype" value="2">
							<img src="images/alipay.jpg" alt="支付宝支付">
							<span>支付宝支付</span>
						</div>
						<div class="payment-option" onclick="selectPayment(this, 3)">
							<input type="radio" name="paytype" value="3">
							<img src="images/card.png" alt="银行卡支付">
							<span>银行卡支付</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<button type="submit" class="submit-btn">确认订单</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<script>
		function selectPayment(element, value) {
			// 移除所有选中状态
			document.querySelectorAll('.payment-option').forEach(option => {
				option.classList.remove('selected');
			});
			// 添加选中状态
			element.classList.add('selected');
			// 选中radio
			element.querySelector('input[type="radio"]').checked = true;
		}

		// 页面加载时选中默认支付方式
		document.addEventListener('DOMContentLoaded', function() {
			const defaultPayment = document.querySelector('.payment-option');
			if (defaultPayment) {
				defaultPayment.classList.add('selected');
			}
		});
	</script>

</body>
</html>