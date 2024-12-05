<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>用户注册</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/EmailCheck.js"></script>
	<style>
		.register-container {
			background: linear-gradient(to bottom right, #f8f9fa, #ffffff);
			padding: 60px 0;
		}
		.register-box {
			background: white;
			padding: 40px;
			border-radius: 15px;
			box-shadow: 0 0 20px rgba(0,0,0,0.1);
			max-width: 800px;
			margin: 0 auto;
		}
		.register-title {
			text-align: center;
			color: #2c3e50;
			font-size: 28px;
			font-weight: 600;
			margin-bottom: 30px;
		}
		.form-section {
			margin-bottom: 30px;
			padding-bottom: 20px;
			border-bottom: 1px solid #eee;
		}
		.section-title {
			color: #34495e;
			font-size: 20px;
			margin-bottom: 20px;
			padding-left: 10px;
			border-left: 4px solid #3498db;
		}
		.form-group {
			margin-bottom: 20px;
		}
		.form-label {
			font-weight: 500;
			color: #34495e;
			margin-bottom: 8px;
			display: block;
		}
		.form-control {
			height: 45px;
			border-radius: 8px;
			border: 2px solid #e0e0e0;
			padding: 10px 15px;
			font-size: 15px;
			transition: all 0.3s ease;
		}
		.form-control:focus {
			border-color: #3498db;
			box-shadow: 0 0 0 3px rgba(52,152,219,0.2);
		}
		.required-star {
			color: #e74c3c;
			margin-left: 3px;
		}
		.submit-btn {
			background: linear-gradient(45deg, #3498db, #2980b9);
			color: white;
			border: none;
			border-radius: 8px;
			padding: 12px 30px;
			font-size: 16px;
			font-weight: 500;
			width: 100%;
			transition: all 0.3s ease;
		}
		.submit-btn:hover {
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(52,152,219,0.3);
		}
		.alert {
			border-radius: 8px;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>

	<jsp:include page="/header.jsp">
		<jsp:param name="flag" value="10"></jsp:param>
	</jsp:include>

	<div class="register-container">
		<div class="container">
			<div class="register-box">
				<h3 class="register-title">用户注册</h3>

				<c:if test="${!empty msg}">
					<div class="alert alert-danger">${msg}</div>
				</c:if>

				<form action="/user_rigister" method="post" onsubmit="return validateEmail()">
					<div class="form-section">
						<h4 class="section-title">账号信息</h4>
						<div class="form-group">
							<label class="form-label">
								用户名
								<span class="required-star">*</span>
							</label>
							<input type="text" class="form-control" name="username" 
								   placeholder="请输入用户名" required="required">
						</div>
						<div class="form-group">
							<label class="form-label">
								邮箱
								<span class="required-star">*</span>
							</label>
							<input type="text" class="form-control" name="email" id="email" 
								   placeholder="请输入邮箱" required="required">
						</div>
						<div class="form-group">
							<label class="form-label">
								密码
								<span class="required-star">*</span>
							</label>
							<input type="password" class="form-control" name="password" 
								   placeholder="请输入密码" required="required">
						</div>
					</div>

					<div class="form-section">
						<h4 class="section-title">收货信息</h4>
						<div class="form-group">
							<label class="form-label">收货人</label>
							<input type="text" class="form-control" name="name" 
								   placeholder="请输入收货人姓名">
						</div>
						<div class="form-group">
							<label class="form-label">收货电话</label>
							<input type="text" class="form-control" name="phone" 
								   placeholder="请输入收货电话">
						</div>
						<div class="form-group">
							<label class="form-label">收货地址</label>
							<input type="text" class="form-control" name="address" 
								   placeholder="请输入收货地址">
						</div>
					</div>

					<div class="form-group">
						<button type="submit" class="submit-btn">注册</button>
					</div>
					
					<div class="text-center">
						<a href="/user_login.jsp" class="text-primary">已有账号？立即登录</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>