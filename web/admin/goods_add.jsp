<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>商品添加</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="css/bootstrap.css" />
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
		.image-tip {
			color: #666;
			font-size: 12px;
			margin-top: 5px;
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
		<jsp:param name="flag" value="3"></jsp:param>
	</jsp:include>

	<div class="edit-container">
		<h2 class="form-title">添加商品</h2>
		
		<form class="form-horizontal" action="/admin/goods_add" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="input_name" class="col-sm-2 control-label">商品名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="input_name" name="name" required="required">
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_price" class="col-sm-2 control-label">商品价格</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="input_price" name="price">
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_intro" class="col-sm-2 control-label">商品介绍</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="input_intro" name="intro" rows="3"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_stock" class="col-sm-2 control-label">库存数量</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" id="input_stock" name="stock">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">封面图片</label>
				<div class="col-sm-8">
					<input type="file" name="cover" class="form-control" required="required">
					<p class="image-tip">推荐尺寸: 500 * 500</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">详情图片1</label>
				<div class="col-sm-8">
					<input type="file" name="image1" class="form-control" required="required">
					<p class="image-tip">推荐尺寸: 500 * 500</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">详情图片2</label>
				<div class="col-sm-8">
					<input type="file" name="image2" class="form-control" required="required">
					<p class="image-tip">推荐尺寸: 500 * 500</p>
				</div>
			</div>
			
			<div class="form-group">
				<label for="select_type" class="col-sm-2 control-label">商品类别</label>
				<div class="col-sm-8">
					<select class="form-control" id="select_type" name="typeid">
						<c:forEach items="${typeList}" var="t">
							<option value="${t.id}">${t.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-success btn-submit">添加商品</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>