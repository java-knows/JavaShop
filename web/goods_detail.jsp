<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
	<title>商品详情</title>
	<link rel="icon" href="./images/icon.jpg">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/flexslider.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<script>
		$(function() {
		  $('.flexslider').flexslider({
			animation: "slide",
			controlNav: "thumbnails"
		  });
		});
	</script>
	<style>
		.single {
			padding: 40px 0;
			background: #f5f6fa;
		}
		.single-grid {
			background: #fff;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 2px 15px rgba(0,0,0,0.05);
		}
		.flexslider {
			border: none;
			border-radius: 8px;
			overflow: hidden;
		}
		.flexslider img {
			border-radius: 8px;
		}
		.single-grid h3 {
			color: #2c3e50;
			font-size: 24px;
			margin: 20px 0;
		}
		.tag {
			margin: 15px 0;
		}
		.tag a {
			color: #3498db;
			text-decoration: none;
		}
		.prices {
			margin: 20px 0;
		}
		.item_price {
			color: #e74c3c;
			font-size: 24px;
			font-weight: 600;
		}
		.add-cart {
			display: inline-block;
			padding: 10px 30px;
			background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
			color: #fff;
			border-radius: 25px;
			text-decoration: none;
			transition: all 0.3s ease;
			font-weight: 500;
			margin-top: 20px;
		}
		.add-cart:hover {
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(46,204,113,0.3);
			color: #fff;
			text-decoration: none;
		}
	</style>
</head>
<body>
	 
	





	<!--header-->
    <jsp:include page="/header.jsp"></jsp:include>
	<!--//header-->

	
	<!--//single-page-->
	<div class="single">
		<div class="container">
			<div class="single-grids">				
				<div class="col-md-4 single-grid">		
					<div class="flexslider">
						
						<ul class="slides">
							<li data-thumb="${g.cover}">
								<div class="thumb-image"> <img src="${g.cover}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="${g.image1}">
								 <div class="thumb-image"> <img src="${g.image1}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="${g.image2}">
							   <div class="thumb-image"> <img src="${g.image2}" data-imagezoom="true" class="img-responsive"> </div>
							</li> 
						</ul>
					</div>
				</div>	
				<div class="col-md-4 single-grid simpleCart_shelfItem">		
					<h3>${g.name}</h3>
					<div class="tag">
						<p>分类 : <a href="goods_list?typeid=${g.type.id}">${g.type.name}</a></p>
					</div>
					<p>${g.intro}</p>
					<div class="galry">
						<div class="prices">
							<h5 class="item_price">¥ ${g.price}</h5>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="btn_form">
						<a href="javascript:;" class="add-cart item_add" onclick="buy(${g.id})">加入购物车</a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	<!--related-products--><!-- 
	<div class="related-products">
		<div class="container">
			<h3>猜你喜欢</h3>
			<div class="product-model-sec single-product-grids">
				<div class="product-grid single-product">
					<a href="single.html">
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox">
						<img src="images/m1.png" class="img-responsive" alt="">
						<div class="b-wrapper">
						<h4 class="b-animate b-from-left  b-delay03">							
						<button>View</button>
						</h4>
						</div>
					</div>
					</a>					
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>Product #1</h4>								
							<span class="item_price">$2000</span>
							<div class="ofr">
							  <p class="pric1"><del>$2300</del></p>
							  <p class="disc">[15% Off]</p>
							</div>
							<div class="clearfix"> </div>
						</div>												
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
 -->	<!--related-products-->	
	
	




	<!--footer-->
    <jsp:include page="/footer.jsp"></jsp:include>
	<!--//footer-->


</body>
</html>