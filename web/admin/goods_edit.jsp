<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>商品编辑</title>
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
		.preview-image {
			width: 120px;
			height: 120px;
			object-fit: cover;
			border-radius: 4px;
			margin-bottom: 10px;
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
		<h2 class="form-title">商品编辑</h2>
		
		<form class="form-horizontal" action="/admin/goods_edit" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${g.id}"/>
			<input type="hidden" name="cover" value="${g.cover}"/>
			<input type="hidden" name="image1" value="${g.image1}"/>
			<input type="hidden" name="image2" value="${g.image2}"/>
			<input type="hidden" name="pageNo" value="${param.pageNo}"/>
			<input type="hidden" name="type" value="${param.type}"/>
			
			<div class="form-group">
				<label for="input_name" class="col-sm-2 control-label">商品名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="input_name" name="name" value="${g.name}" required="required">
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_price" class="col-sm-2 control-label">商品价格</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="input_price" name="price" value="${g.price}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_intro" class="col-sm-2 control-label">商品介绍</label>
				<div class="col-sm-8">
					<textarea class="form-control" id="input_intro" name="intro" rows="3">${g.intro}</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label for="input_stock" class="col-sm-2 control-label">库存数量</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" id="input_stock" name="stock" value="${g.stock}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">封面图片</label>
				<div class="col-sm-8">
					<img src="${pageContext.request.contextPath}${g.cover}" class="preview-image"/>
					<input type="file" name="cover" class="form-control">
					<p class="image-tip">推荐尺寸: 500 * 500</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">详情图片1</label>
				<div class="col-sm-8">
					<img src="${pageContext.request.contextPath}${g.image1}" class="preview-image"/>
					<input type="file" name="image1" class="form-control">
					<p class="image-tip">推荐尺寸: 500 * 500</p>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">详情图片2</label>
				<div class="col-sm-8">
					<img src="${pageContext.request.contextPath}${g.image2}" class="preview-image"/>
					<input type="file" name="image2" class="form-control">
					<p class="image-tip">推荐尺寸: 500 * 500</p>
				</div>
			</div>
			
			<div class="form-group">
				<label for="select_type" class="col-sm-2 control-label">商品类别</label>
				<div class="col-sm-8">
					<select class="form-control" id="select_type" name="typeid">
						<c:forEach items="${typeList}" var="t">
							<option <c:if test="${t.id==g.type.id}">selected="selected"</c:if> value="${t.id}">${t.name}</option>
						</c:forEach>
					</select>
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