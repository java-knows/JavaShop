<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.pagination-container {
    padding: 20px 0;
    text-align: center;
}

.pagination-info {
    display: inline-block;
    margin: 0 15px;
    padding: 6px 15px;
    border-radius: 20px;
    background: #f8f9fa;
    color: #2c3e50;
    font-size: 14px;
    font-weight: 500;
}

.pagination-btn {
    display: inline-block;
    margin: 0 5px;
    padding: 8px 16px;
    border-radius: 20px;
    background: #fff;
    color: #3498db;
    border: 2px solid #3498db;
    transition: all 0.3s ease;
    text-decoration: none;
    font-weight: 500;
}

.pagination-btn:hover:not([disabled]) {
    background: #3498db;
    color: #fff;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
}

.pagination-btn[disabled] {
    opacity: 0.6;
    cursor: not-allowed;
    border-color: #bdc3c7;
    color: #bdc3c7;
}

.pagination-goto {
    display: inline-block;
    margin-left: 15px;
}

.pagination-input {
    width: 60px !important;
    display: inline-block !important;
    height: 38px;
    padding: 6px 12px;
    border: 2px solid #bdc3c7;
    border-radius: 20px;
    margin: 0 8px;
    text-align: center;
    transition: all 0.3s ease;
}

.pagination-input:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
}

.pagination-goto-btn {
    display: inline-block;
    padding: 8px 16px;
    border-radius: 20px;
    background: #3498db;
    color: #fff;
    border: none;
    transition: all 0.3s ease;
    text-decoration: none;
}

.pagination-goto-btn:hover {
    background: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
}
</style>

<div class="pagination-container">
    <a class='pagination-btn' 
        <c:if test="${p.pageNumber==1}">disabled</c:if>
        <c:if test="${p.pageNumber!=1}">href="${param.url}?pageNumber=1${param.param}"</c:if>>
        首页
    </a>
    
    <a class='pagination-btn'
        <c:if test="${p.pageNumber==1}">disabled</c:if>
        <c:if test="${p.pageNumber!=1}">href="${pageContext.request.contextPath}${param.url}?pageNumber=${p.pageNumber-1}${param.param}"</c:if>>
        上一页
    </a>
    
    <span class="pagination-info">
        第 ${p.pageNumber} / ${p.totalPage} 页
        [共 ${p.totalCount} 条记录]
    </span>
    
    <a class='pagination-btn'
        <c:if test="${p.totalPage==0 || p.pageNumber==p.totalPage}">disabled</c:if>
        <c:if test="${p.pageNumber!=p.totalPage}">href="${param.url}?pageNumber=${p.pageNumber+1}${param.param}"</c:if>>
        下一页
    </a>
    
    <a class='pagination-btn'
        <c:if test="${p.totalPage==0 || p.pageNumber==p.totalPage}">disabled</c:if>
        <c:if test="${p.pageNumber!=p.totalPage}">href="${param.url}?pageNumber=${p.totalPage}${param.param}"</c:if>>
        尾页
    </a>
    
    <div class="pagination-goto">
        <input type='text' class='pagination-input' value=''/>
        <a class='pagination-goto-btn' href='javascript:void(0);' 
            onclick='location.href="${param.url}?pageNumber="+(this.previousElementSibling.value)+"${param.param}"'>
            跳转
        </a>
    </div>
</div>
