<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>商品列表</title>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<style>
		.list-container {
			max-width: 1200px;
			margin: 20px auto;
			padding: 25px;
			background: #fff;
			box-shadow: 0 0 15px rgba(0,0,0,0.08);
			border-radius: 12px;
		}
		.page-title {
			color: #2c3e50;
			margin-bottom: 25px;
			font-size: 24px;
			font-weight: 600;
		}
		.add-btn {
			margin-bottom: 25px;
		}
		.add-btn .btn-success {
			padding: 8px 20px;
			font-weight: 500;
			border-radius: 6px;
		}
		.nav-tabs {
			margin-bottom: 25px;
			border-bottom: 2px solid #eee;
		}
		.nav-tabs > li > a {
			color: #7f8c8d;
			font-weight: 500;
			padding: 12px 20px;
			border: none;
			border-bottom: 2px solid transparent;
			margin-bottom: -2px;
			transition: all 0.3s ease;
		}
		.nav-tabs > li > a:hover {
			background: none;
			color: #3498db;
			border-bottom: 2px solid #3498db;
		}
		.nav-tabs > li.active > a {
			border: none;
			border-bottom: 2px solid #3498db;
			color: #3498db;
			font-weight: 600;
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
		.product-img {
			width: 80px;
			height: 80px;
			object-fit: cover;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.1);
			transition: transform 0.3s ease;
		}
		.product-img:hover {
			transform: scale(1.05);
		}
		.btn-group-action {
			display: flex;
			flex-wrap: wrap;
			gap: 5px;
		}
		.btn-group-action .btn {
			padding: 5px 10px;
			font-size: 13px;
			border-radius: 4px;
		}
		.btn-primary {
			background-color: #3498db;
			border-color: #3498db;
		}
		.btn-info {
			background-color: #2ecc71;
			border-color: #2ecc71;
		}
		.btn-danger {
			background-color: #e74c3c;
			border-color: #e74c3c;
		}
		.table-hover > tbody > tr:hover {
			background-color: #f9f9f9;
		}
	</style>
</head>
<body>
<div class="container-fluid">

	<jsp:include page="/admin/header.jsp">
		<jsp:param name="flag" value="3"></jsp:param>
	</jsp:include>

	<div class="list-container">
		<div class="text-right add-btn">
			<a class="btn btn-success" href="/admin/goods_add.jsp">添加商品</a>
		</div>

		<ul role="tablist" class="nav nav-tabs">
			<li <c:if test="${type==0}">class="active"</c:if> role="presentation">
				<a href="/admin/goods_list">全部商品</a>
			</li>
			<li <c:if test="${type==1}">class="active"</c:if> role="presentation">
				<a href="/admin/goods_list?type=1">首页推荐</a>
			</li>
			<li <c:if test="${type==2}">class="active"</c:if> role="presentation">
				<a href="/admin/goods_list?type=2">手机</a>
			</li>
			<li <c:if test="${type==3}">class="active"</c:if> role="presentation">
				<a href="/admin/goods_list?type=3">电脑</a>
			</li>
		</ul>

		<table class="table table-bordered table-hover">

			<tr>
				<th width="5%">ID</th>
				<th width="15%">图片</th>
				<th width="10%">名称</th>
				<th width="15%">介绍</th>
				<th width="10%">价格</th>
				<th width="10%">类目</th>
				<th width="25%">操作</th>
			</tr>

			<c:forEach items="${p.list }" var="g">
				<tr>
					<td>${g.id }</td>
					<td>
						<a href="/goods_detail?id=${g.id }" target="_blank">
							<img src="${g.cover }" class="product-img">
						</a>
					</td>
					<td>
						<a href="/goods_detail?id=${g.id }" target="_blank">${g.name }</a>
					</td>
					<td>${g.intro }</td>
					<td>${g.price }</td>
					<td>${g.type.name }</td>
					<td class="btn-group-action">
						<c:choose>
							<c:when test="${g.isScroll }">
								<a class="btn btn-info btn-sm" href="/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=1&pageNumber=${p.pageNumber}&type=${type}">移出推荐</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary btn-sm" href="/admin/goods_recommend?id=${g.id }&method=add&typeTarget=1&pageNumber=${p.pageNumber}&type=${type}">加入推荐</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${g.isHot }">
								<a class="btn btn-info btn-sm" href="/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=2&pageNumber=${p.pageNumber}&type=${type}">移出手机</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary btn-sm" href="/admin/goods_recommend?id=${g.id }&method=add&typeTarget=2&pageNumber=${p.pageNumber}&type=${type}">加入手机</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${g.isNew }">
								<a class="btn btn-info btn-sm" href="/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=3&pageNumber=${p.pageNumber}&type=${type}">移出电脑</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary btn-sm" href="/admin/goods_recommend?id=${g.id }&method=add&typeTarget=3&pageNumber=${p.pageNumber}&type=${type}">加入电脑</a>
							</c:otherwise>
						</c:choose>
						<a class="btn btn-success btn-sm" href="/admin/goods_editshow?id=${g.id }&pageNumber=${p.pageNumber}&type=${type}">修改</a>
						<a class="btn btn-danger btn-sm" href="/admin/goods_delete?id=${g.id }&pageNumber=${p.pageNumber}&type=${type}">删除</a>
					</td>
				</tr>
			</c:forEach>


		</table>

		<jsp:include page="/page.jsp">
			<jsp:param value="/admin/goods_list" name="url"/>
			<jsp:param value="&type=${type }" name="param"/>
		</jsp:include>
	</div>
</div>
</body>
</html>