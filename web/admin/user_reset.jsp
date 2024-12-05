<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>重置密码</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<style>
		.reset-container {
			max-width: 600px;
			margin: 20px auto;
			padding: 25px;
			background: #fff;
			box-shadow: 0 0 15px rgba(0,0,0,0.08);
			border-radius: 12px;
		}
		.form-title {
			text-align: center;
			color: #2c3e50;
			margin-bottom: 30px;
			font-size: 24px;
			font-weight: 600;
		}
		.form-group {
			margin-bottom: 20px;
		}
		.control-label {
			font-weight: 600;
			color: #555;
			padding-top: 7px;
		}
		.form-control {
			height: 40px;
			border-radius: 6px;
			border: 1px solid #ddd;
			padding: 8px 15px;
			font-size: 14px;
		}
		.form-control:focus {
			border-color: #3498db;
			box-shadow: 0 0 0 0.2rem rgba(52,152,219,.25);
		}
		.static-text {
			padding-top: 7px;
			color: #34495e;
			font-size: 14px;
		}
		.btn-submit {
			background-color: #3498db;
			border-color: #3498db;
			padding: 8px 30px;
			font-size: 16px;
			font-weight: 500;
			border-radius: 6px;
			transition: all 0.3s ease;
		}
		.btn-submit:hover {
			background-color: #2980b9;
			border-color: #2980b9;
			transform: translateY(-1px);
		}
		.error-message {
			color: #e74c3c;
			margin-top: 15px;
			text-align: center;
		}
	</style>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="/admin/header.jsp">
		<jsp:param name="flag" value="2"></jsp:param>
	</jsp:include>

	<div class="reset-container">
		<h2 class="form-title">重置用户密码</h2>
		
		<form class="form-horizontal" action="/admin/user_reset" method="post">
			<input type="hidden" name="id" value="${param.id}">
			
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-8">
					<p class="static-text">${param.username}</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱</label>
				<div class="col-sm-8">
					<p class="static-text">${param.email}</p>
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_password" class="col-sm-3 control-label">新密码</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="input_password" name="password" 
						   required="required" placeholder="请输入新密码">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-primary btn-submit">确认重置</button>
				</div>
			</div>
		</form>

		<c:if test="${!empty msg}">
			<div class="error-message">${msg}</div>
		</c:if>
	</div>
</div>
</body>
</html>