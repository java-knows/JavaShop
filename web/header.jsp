<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.custom-navbar {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,.1);
    padding: 10px 0;
}

.custom-navbar .navbar-brand {
    color: #2c3e50;
    font-weight: bold;
    font-size: 24px;
}

.custom-navbar .nav > li > a {
    color: #34495e;
    transition: all 0.3s ease;
    padding: 15px 20px;
}

.custom-navbar .nav > li > a:hover,
.custom-navbar .nav > li > a.active {
    color: #3498db;
    background-color: rgba(52, 152, 219, 0.1);
}

.custom-navbar .navbar-form {
    margin-top: 10px;
}

.custom-navbar .form-control {
    border-radius: 20px;
    padding: 6px 20px;
    border: 1px solid #bdc3c7;
}

.custom-navbar .btn-search {
    border-radius: 20px;
    background-color: #3498db;
    color: white;
    border: none;
    padding: 6px 20px;
    transition: all 0.3s ease;
}

.custom-navbar .btn-search:hover {
    background-color: #2980b9;
}

.card_num {
    position: absolute;
    top: -8px;
    right: -8px;
    background-color: #e74c3c;
    color: white;
    border-radius: 50%;
    padding: 2px 6px;
    font-size: 12px;
}

.shopping-cart-icon {
    position: relative;
    font-size: 20px;
}
</style>

<nav class="navbar custom-navbar" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index">加瓦商城</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="/index" <c:if test="${param.flag==1}">class="active"</c:if>>首页</a></li>
                <li><a href="/goodsrecommend_list?type=2" <c:if test="${param.flag==3 && t==2}">class="active"</c:if>>手机</a></li>
                <li><a href="/goodsrecommend_list?type=3" <c:if test="${param.flag==3 && t==3}">class="active"</c:if>>电脑</a></li>

                <c:choose>
                    <c:when test="${empty user}">
                        <li><a href="/user_register.jsp" <c:if test="${param.flag==10}">class="active"</c:if>>注册</a></li>
                        <li><a href="/user_login.jsp" <c:if test="${param.flag==9}">class="active"</c:if>>登录</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/order_list" <c:if test="${param.flag==5}">class="active"</c:if>>我的订单</a></li>
                        <li><a href="/user_center.jsp" <c:if test="${param.flag==4}">class="active"</c:if>>个人中心</a></li>
                        <li><a href="/user_logout">注销</a></li>
                    </c:otherwise>
                </c:choose>

                <c:if test="${!empty user && user.isadmin}">
                    <li><a href="/admin/index.jsp" target="_blank">后台管理</a></li>
                </c:if>
                <li>
                    <a href="goods_cart.jsp" class="shopping-cart-icon">
                        <span class="glyphicon glyphicon-shopping-cart <c:if test="${param.flag==8}">active</c:if>"></span>
                        <span class="card_num">
                            <c:choose>
                                <c:when test="${empty order}">0</c:when>
                                <c:otherwise>${order.amount}</c:otherwise>
                            </c:choose>
                        </span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="navbar-form navbar-right">
            <form action="/goods_search">
                <div class="input-group">
                    <input type="text" class="form-control" name="keyword" placeholder="搜索商品...">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-search <c:if test="${param.flag==7}">active</c:if>">
                            <i class="glyphicon glyphicon-search"></i> 搜索
                        </button>
                    </span>
                </div>
            </form>
        </div>
    </div>
</nav>
<!--header-->
