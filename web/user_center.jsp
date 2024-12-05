<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>个人中心</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/simpleCart.min.js"></script>
	<style>
		.profile-container {
			background: linear-gradient(to bottom right, #f8f9fa, #ffffff);
			padding: 60px 0;
		}
		.profile-box {
			background: white;
			padding: 40px;
			border-radius: 15px;
			box-shadow: 0 0 20px rgba(0,0,0,0.1);
			max-width: 800px;
			margin: 0 auto;
		}
		.profile-title {
			text-align: center;
			color: #2c3e50;
			font-size: 28px;
			font-weight: 600;
			margin-bottom: 30px;
		}
		.form-section {
			margin-bottom: 40px;
			padding: 30px;
			border-radius: 10px;
			background: #f8f9fa;
			transition: all 0.3s ease;
		}
		.form-section:hover {
			box-shadow: 0 5px 15px rgba(0,0,0,0.1);
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
			margin-top: 20px;
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
		<jsp:param value="4" name="flag"/>
	</jsp:include>
	<c:if test="${empty user}"><%response.sendRedirect("/index");%></c:if>

	<div class="profile-container">
		<div class="container">
			<div class="profile-box">
				<h3 class="profile-title">个人中心</h3>

				<c:if test="${!empty msg}">
					<div class="alert alert-success">${msg}</div>
				</c:if>
				<c:if test="${!empty failMsg}">
					<div class="alert alert-danger">${failMsg}</div>
				</c:if>

				<div class="form-section">
					<h4 class="section-title">收货信息</h4>
					<form action="/user_changeaddress" method="post">
						<div class="form-group">
							<label class="form-label">收货人</label>
							<input type="text" class="form-control" name="name" 
								   value="${user.name}" placeholder="请输入收货人">
						</div>
						<div class="form-group">
							<label class="form-label">收货电话</label>
							<input type="text" class="form-control" name="phone" 
								   value="${user.phone}" placeholder="请输入收货电话">
						</div>
						<div class="form-group">
							<label class="form-label">收货地址</label>
							<input type="text" class="form-control" name="address" 
								   value="${user.address}" placeholder="请输入收货地址">
						</div>
						<button type="submit" class="submit-btn">更新收货信息</button>
					</form>
				</div>

				<div class="form-section">
					<h4 class="section-title">修改密码</h4>
					<form action="/user_changepwd" method="post">
						<div class="form-group">
							<label class="form-label">原密码</label>
							<input type="password" class="form-control" name="password" 
								   placeholder="请输入原密码">
						</div>
						<div class="form-group">
							<label class="form-label">新密码</label>
							<input type="password" class="form-control" name="newPassword" 
								   placeholder="请输入新密码">
						</div>
						<button type="submit" class="submit-btn">修改密码</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>