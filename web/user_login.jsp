<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>用户登录</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style>
		.login-container {
			background: linear-gradient(to bottom right, #f8f9fa, #ffffff);
			padding: 60px 0;
			min-height: 80vh;
		}
		.login-box {
			background: white;
			padding: 40px;
			border-radius: 15px;
			box-shadow: 0 0 20px rgba(0,0,0,0.1);
			max-width: 500px;
			margin: 0 auto;
		}
		.login-title {
			text-align: center;
			color: #2c3e50;
			font-size: 28px;
			font-weight: 600;
			margin-bottom: 30px;
		}
		.form-group {
			margin-bottom: 25px;
		}
		.form-label {
			font-weight: 500;
			color: #34495e;
			margin-bottom: 10px;
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
		.login-type-switch {
			display: flex;
			justify-content: center;
			margin-bottom: 25px;
		}
		.switch-btn {
			padding: 8px 20px;
			border: 2px solid #3498db;
			background: white;
			color: #3498db;
			cursor: pointer;
			transition: all 0.3s ease;
		}
		.switch-btn:first-child {
			border-radius: 8px 0 0 8px;
		}
		.switch-btn:last-child {
			border-radius: 0 8px 8px 0;
		}
		.switch-btn.active {
			background: #3498db;
			color: white;
		}
	</style>
</head>
<body>

	<jsp:include page="header.jsp">
		<jsp:param name="flag" value="9"></jsp:param>
	</jsp:include>

	<div class="login-container">
		<div class="container">
			<div class="login-box">
				<h3 class="login-title">登录系统</h3>
				
				<div class="login-type-switch">
					<button type="button" class="switch-btn active" data-type="user">用户登录</button>
					<button type="button" class="switch-btn" data-type="admin">管理员登录</button>
				</div>
				
				<c:if test="${!empty msg}">
					<div class="alert alert-success">${msg}</div>
				</c:if>
				<c:if test="${!empty failMsg}">
					<div class="alert alert-danger">${failMsg}</div>
				</c:if>

				<form id="loginForm" action="/user_login" method="post">
					<div class="form-group">
						<label class="form-label">
							用户名/邮箱
							<span class="required-star">*</span>
						</label>
						<input type="text" class="form-control" name="ue" 
							   placeholder="请输入用户名或邮箱" required="required">
					</div>
					
					<div class="form-group">
						<label class="form-label">
							密码
							<span class="required-star">*</span>
						</label>
						<input type="password" class="form-control" name="password" 
							   placeholder="请输入密码" required="required">
					</div>

					<div class="form-group">
						<button type="submit" class="submit-btn">登录</button>
					</div>
					
					<div class="text-center">
						<a href="/user_register.jsp" class="text-primary">还没有账号？立即注册</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<script>
		$(document).ready(function() {
			$('.switch-btn').click(function() {
				// 更新按钮状态
				$('.switch-btn').removeClass('active');
				$(this).addClass('active');
				
				// 更新表单提交地址
				var loginType = $(this).data('type');
				if(loginType === 'user') {
					$('#loginForm').attr('action', '/user_login');
					$('.login-title').text('用户登录');
				} else {
					$('#loginForm').attr('action', '/admin_login');
					$('.login-title').text('管理员登录');
				}
			});
		});
	</script>

</body>
</html>