<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>类目编辑</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<style>
		.edit-container {
			max-width: 600px;
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
		<jsp:param name="flag" value="4"></jsp:param>
	</jsp:include>

	<div class="edit-container">
		<h2 class="form-title">编辑类目</h2>
		
		<form class="form-horizontal" action="/admin/type_edit" method="post">
			<input type="hidden" name="id" value="${param.id}">
			<div class="form-group">
				<label for="input_name" class="col-sm-3 control-label">类目名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="input_name" name="name" value="${param.name}" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-success btn-submit">提交修改</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>