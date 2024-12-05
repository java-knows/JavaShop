<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <link rel="icon" href="./images/icon.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
    <style>
        /* 整体页面样式 */
        body {
            background-color: #f5f6fa;
            color: #2c3e50;
        }
        .container {
            max-width: 1200px;
            padding: 0 15px;
        }

        /* 分类导航样式优化 */
        .category {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 20px 0;
            margin-bottom: 30px;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }
        .category a {
            display: block;
            padding: 10px 20px;
            color: #2c3e50;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
            text-align: center;
            margin: 5px;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            font-weight: 500;
            border: 1px solid rgba(0,0,0,0.03);
        }
        .category a:hover {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52,152,219,0.3);
        }

        /* 轮播图样式增强 */
        .banner {
            margin-bottom: 40px;
            background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%);
            padding: 20px 0;
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }
        /* 轮播指示器样式 */
        .carousel-indicators {
            bottom: -40px;
        }
        .carousel-indicators li {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin: 0 5px;
            background-color: #cbd5e0;
            border: none;
            transition: all 0.3s ease;
        }
        .carousel-indicators .active {
            width: 12px;
            height: 12px;
            background-color: #3498db;
            margin: 0 5px;
        }

        .carousel-inner {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            background: #fff;
            width: 100%;
            height: auto;
            min-height: 500px;
        }
        .banner-text {
            text-align: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
            margin-bottom: 60px;
        }
        .banner-text img {
            border-radius: 8px;
            transition: transform 0.3s ease;
            max-width: 100%;
            height: auto;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .banner-text img:hover {
            transform: scale(1.02);
        }

        /* 今日推荐标题样式 */
        .recommend-title {
            position: absolute;
            top: 20px;
            left: 20px;
            background: rgba(52,152,219,0.9);
            color: #fff;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            z-index: 1;
            box-shadow: 0 2px 8px rgba(52,152,219,0.3);
        }

        .hdng {
            margin: 20px 0;
            color: #2c3e50;
            font-size: 24px;
            font-weight: 600;
            position: relative;
            display: inline-block;
            letter-spacing: 1px;
        }
        .hdng a {
            color: #2c3e50;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .hdng a:hover {
            color: #3498db;
        }
        .hdng::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(to right, #3498db, transparent);
        }

        .banner_a {
            display: inline-block;
            padding: 10px 25px;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: #fff;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(52,152,219,0.3);
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
        }
        .banner_a:hover {
            transform: translate(-50%, -2px);
            box-shadow: 0 6px 15px rgba(52,152,219,0.4);
            color: #fff;
            text-decoration: none;
        }

        /* 轮播项样式 */
        .item {
            padding: 20px;
            text-align: center;
            background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%);
            position: relative;
            min-height: 500px;
        }
        .item.active {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* 商品展示区样式增强 */
        .gallery {
            padding: 40px 0;
            background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%);
            border-radius: 12px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }
        .alert {
            border: none;
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 30px;
            font-size: 18px;
            font-weight: 600;
            text-align: center;
            letter-spacing: 1px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .alert-danger {
            background: linear-gradient(135deg, #ff7675 0%, #d63031 100%);
            color: #fff;
        }
        .alert-info {
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            color: #fff;
        }
        .gallery-grid {
            margin-bottom: 30px;
            transition: all 0.3s ease;
        }
        .gallery-grid:hover {
            transform: translateY(-5px);
        }
        .gallery-info {
            padding: 15px;
            background: #fff;
            border-radius: 8px;
            margin-top: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }
        .shop {
            display: inline-block;
            padding: 8px 20px;
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            color: #fff;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            box-shadow: 0 4px 12px rgba(46,204,113,0.3);
        }
        .prices {
            margin-top: 10px;
            text-align: right;
        }
        .item_price {
            color: #d63031;
            font-size: 18px;
            font-weight: 600;
            display: inline-block;
            padding: 5px 10px;
            background: rgba(255,118,117,0.1);
            border-radius: 4px;
        }

        /* 响应式优化增强 */
        @media (max-width: 768px) {
            .category a {
                margin-bottom: 10px;
                font-size: 14px;
            }
            .gallery-grid {
                padding: 0 10px;
                margin-bottom: 20px;
            }
            .banner {
                padding: 10px;
                margin-bottom: 20px;
            }
            .hdng {
                font-size: 20px;
            }
            .alert {
                font-size: 16px;
                padding: 12px 15px;
            }
        }

        .gallery-info a {
            color: #2c3e50;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .gallery-info a:hover {
            color: #3498db;
        }
        /* 查看详情按钮样式 */
        .view-details {
            display: inline-block;
            padding: 6px 15px;
            background: #f8f9fa;
            color: #666;
            border-radius: 15px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 13px;
            border: 1px solid #eee;
        }
        .view-details:hover {
            background: #fff;
            color: #3498db;
            text-decoration: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .view-details .glyphicon {
            margin-right: 5px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>

<div class="category">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-6 col-lg-4 col-lg-3 ">
                <a href="/goods_list">全部</a>
            </div>
            <c:forEach items="${typeList}" var="t">
                <div class="col-12 col-md-6 col-lg-4 col-lg-3 ">
                    <a href="/goods_list?typeid=${t.id}">${t.name}</a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!--banner-->

<div class="banner">
    <div class="container">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators" id="olnum">
                <c:forEach items="${scroll}" var="g" varStatus="status">
                    <c:choose>
                        <c:when test="${status.first}">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        </c:when>
                        <c:otherwise>
                            <li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <c:forEach items="${scroll}" var="g" varStatus="status">
                    <c:choose>
                        <c:when test="${status.first}">
                            <div class="item active">
                                <h2 class="hdng"><a href="/goods_detail?id=${g.id}">${g.name}</a></h2>
                                <div class="banner-text">
                                    <a href="/goods_detail?id=${g.id}">
                                        <img src="${g.cover}" alt="${g.name}" width="350" height="350">
                                    </a>
                                </div>
                                <a class="banner_a" href="javascript:;" onclick="buy(${g.id})">加入购物车</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="item">
                                <h2 class="hdng"><a href="/goods_detail?id=${g.id}">${g.name}</a></h2>
                                <div class="banner-text">
                                    <a href="/goods_detail?id=${g.id}">
                                        <img src="${g.cover}" alt="${g.name}" width="350" height="350">
                                    </a>
                                </div>
                                <a class="banner_a" href="javascript:;" onclick="buy(${g.id})">加入购物车</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <!-- Controls -->
            <%--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>--%>
        </div>
    </div>
</div>

<!--//banner-->

<div class="subscribe2"></div>

<!--gallery-->
<div class="gallery">
    <div class="container">
        <div class="alert alert-danger">手机</div>
        <div class="gallery-grids">
            <c:forEach items="${hotList}" var="g">
                <div class="col-md-4 gallery-grid glry-two">
                    <a href="/goods_detail?id=${g.id}">
                        <img src="${g.cover}" class="img-responsive" alt="${g.name}" width="350" height="350"/>
                    </a>
                    <div class="gallery-info galrr-info-two">
                        <p>
                            <a class="view-details" href="/goods_detail?id=${g.id}">
                                <i class="glyphicon glyphicon-eye-open"></i>查看详情
                            </a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${g.id})">加入购物车</a>
                        <div class="clearfix"></div>
                    </div>
                    <div class="galy-info">
                        <p>${g.typeName} > ${g.name}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${g.price}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>

        <div class="clearfix"></div>
        <div class="alert alert-info">电脑</div>
        <div class="gallery-grids">
            <c:forEach items="${newList}" var="g">
                <div class="col-md-3 gallery-grid ">
                    <a href="/goods_detail?id=${g.id}">
                        <img src="${g.cover}" class="img-responsive" alt="${g.name}"/>
                    </a>
                    <div class="gallery-info">
                        <p>
                            <a class="view-details" href="/goods_detail?id=${g.id}">
                                <i class="glyphicon glyphicon-eye-open"></i>查看详情
                            </a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${g.id})">加入购物车</a>
                        <div class="clearfix"></div>
                    </div>
                    <div class="galy-info">
                        <p>${g.typeName} > ${g.name}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${g.price}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </div>
</div>
<!--//gallery-->

<!--subscribe-->
<div class="subscribe"></div>
<!--//subscribe-->


<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>