
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>品牌分类</title>
    <link rel="icon" href="./images/icon.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/simpleCart.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
    <style>
        .products {
            padding: 40px 0;
            background: #f5f6fa;
        }
        .products h2 {
            color: #2c3e50;
            font-size: 28px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }
        .product-grid {
            width: calc(25% - 30px);
            float: left;
            margin: 15px;
            background: #fff;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .product-grid:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .product-img {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            height: 200px;
        }
        .product-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        .product-img:hover img {
            transform: scale(1.05);
        }
        .b-wrapper {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(52,152,219,0.8);
            opacity: 0;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
        }
        .product-img:hover .b-wrapper {
            opacity: 1;
        }
        .b-wrapper button {
            background: #fff;
            border: none;
            padding: 8px 20px;
            border-radius: 20px;
            color: #3498db;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .product-info {
            padding: 15px 0;
            text-align: center;
        }
        .product-info h4 {
            color: #2c3e50;
            font-size: 16px;
            margin: 10px 0;
        }
        .item_price {
            color: #e74c3c;
            font-size: 18px;
            font-weight: 600;
            margin: 10px 0;
        }
        .item_add {
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            border: none;
            padding: 8px 20px;
            border-radius: 20px;
            color: #fff;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        .item_add:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(46,204,113,0.3);
        }
    </style>
</head>
<body>







<!--header-->
<jsp:include page="header.jsp">
    <jsp:param name="flag" value="2"></jsp:param>
</jsp:include>
<!--//header-->


<!--products-->
<div class="products">
    <div class="container">
        <h2><c:choose><c:when test="${empty t}">全部系列</c:when><c:otherwise>${t.name}</c:otherwise> </c:choose></h2>

        <div class="col-md-12 product-model-sec">

            <c:forEach items="${p.list}" var="g">
                <div class="product-grid">
                    <a href="/goods_detail?id=${g.id}">
                        <div class="more-product"><span> </span></div>
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <img src="${g.cover}" class="img-responsive" alt="${g.name}" width="240" height="240">
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <button href="/goods_detail?id=${g.id}">查看详情</button>
                                </h4>
                            </div>
                        </div>
                    </a>
                    <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                            <h4>${g.name}</h4>
                            <span class="item_price">¥ ${g.price}</span>
                            <input type="button" class="item_add items" value="加入购物车" onclick="buy(${g.id})">
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <jsp:include page="page.jsp">
            <jsp:param name="url" value="/goods_list"></jsp:param>
            <jsp:param name="param" value="&typeid=${id}"></jsp:param>
        </jsp:include>
        </div>
    </div>
</div>
<!--//products-->






<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->


</body>
</html>
