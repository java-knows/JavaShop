<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>客户修改</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<style>
		.edit-container {
			max-width: 800px;
			margin: 20px auto;
			padding: 20px;
			background: #fff;
			box-shadow: 0 0 10px rgba(0,0,0,0.1);
			border-radius: 8px;
		}
		.form-title {
			text-align: center;
			color: #333;
			margin-bottom: 30px;
			font-size: 24px;
		}
		.form-group {
			margin-bottom: 20px;
		}
		.control-label {
			font-weight: 600;
			color: #555;
		}
		.form-control {
			border-radius: 4px;
			border: 1px solid #ddd;
		}
		.form-control:focus {
			border-color: #80bdff;
			box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
		}
		.static-text {
			padding-top: 7px;
			color: #666;
		}
		.btn-submit {
			background-color: #28a745;
			border-color: #28a745;
			padding: 8px 30px;
			font-size: 16px;
		}
		.btn-submit:hover {
			background-color: #218838;
			border-color: #1e7e34;
		}
	</style>
</head>
<body>
<div class="container-fluid">

	<jsp:include page="/admin/header.jsp">
		<jsp:param name="flag" value="2"></jsp:param>
	</jsp:include>

	<div class="edit-container">
		<h2 class="form-title">修改客户信息</h2>
		
		<form class="form-horizontal" action="/admin/user_edit" method="post">
			<input type="hidden" name="id" value="${u.id }">
			
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-8">
					<p class="static-text">${u.username }</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-8">
					<p class="static-text">${u.email }</p>
				</div>
			</div>
			
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">收货人</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="name" name="name" value="${u.name }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">电话</label>
				<div class="col-sm-8">
					<input type="tel" class="form-control" id="phone" name="phone" value="${u.phone }">
				</div>
			</div>
			
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">地址</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="address" name="address" value="${u.address }">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-success btn-submit">保存修改</button>
				</div>
			</div>
		</form>
	</div>

</div>
</body>
</html>