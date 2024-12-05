<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>类目列表</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<style>
		.list-container {
			max-width: 1000px;
			margin: 20px auto;
			padding: 25px;
			background: #fff;
			box-shadow: 0 0 15px rgba(0,0,0,0.08);
			border-radius: 12px;
		}
		.add-form {
			background: #f8f9fa;
			padding: 25px;
			border-radius: 10px;
			margin-bottom: 25px;
			border: 1px solid #eee;
		}
		.form-inline .form-control {
			width: 100%;
			height: 40px;
			border-radius: 6px;
			border: 1px solid #ddd;
			padding: 8px 15px;
		}
		.form-inline .btn-primary {
			height: 40px;
			padding: 0 25px;
			font-weight: 500;
			background-color: #3498db;
			border-color: #3498db;
			border-radius: 6px;
		}
		.table {
			background: #fff;
			margin-bottom: 25px;
		}
		.table th {
			background: #f8f9fa;
			color: #2c3e50;
			font-weight: 600;
			padding: 15px;
			border-bottom: 2px solid #eee;
		}
		.table td {
			padding: 15px;
			vertical-align: middle;
			color: #34495e;
		}
		.btn-action {
			padding: 6px 12px;
			margin: 0 3px;
			border-radius: 4px;
			font-size: 13px;
		}
		.alert {
			padding: 15px 20px;
			border-radius: 8px;
			margin-bottom: 25px;
			border: none;
		}
		.alert-success {
			background-color: #2ecc71;
			color: #fff;
		}
		.alert-danger {
			background-color: #e74c3c;
			color: #fff;
		}
		.table-hover > tbody > tr:hover {
			background-color: #f9f9f9;
		}
	</style>
</head>
<body>
<div class="container-fluid">
	<jsp:include page="/admin/header.jsp">
		<jsp:param name="flag" value="4"></jsp:param>
	</jsp:include>

	<div class="list-container">
		<div class="add-form">
			<form class="form-inline" method="post" action="/admin/type_add">
				<div class="form-group" style="width: 80%;">
					<input type="text" class="form-control" id="input_name" name="name" 
						   placeholder="输入类目名称" required="required" style="width: 100%;">
				</div>
				<button type="submit" class="btn btn-primary">添加类目</button>
			</form>
		</div>

		<c:if test="${!empty msg}">
			<div class="alert alert-success">
				<i class="glyphicon glyphicon-ok"></i> ${msg}
			</div>
		</c:if>
		<c:if test="${!empty failMsg}">
			<div class="alert alert-danger">
				<i class="glyphicon glyphicon-remove"></i> ${failMsg}
			</div>
		</c:if>

		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th width="5%">ID</th>
					<th width="75%">名称</th>
					<th width="20%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="t">
					<tr>
						<td>${t.id}</td>
						<td>${t.name}</td>
						<td>
							<a class="btn btn-primary btn-sm btn-action" href="/admin/type_edit.jsp?id=${t.id}&name=${t.encodeName}">
								<i class="glyphicon glyphicon-edit"></i> 修改
							</a>
							<a class="btn btn-danger btn-sm btn-action" href="/admin/type_delete?id=${t.id}">
								<i class="glyphicon glyphicon-trash"></i> 删除
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>