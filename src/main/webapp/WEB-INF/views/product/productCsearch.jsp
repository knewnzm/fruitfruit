






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/productList.css" />
    <script src="${pageContext.request.contextPath}/static/js/productList.js" async></script>
    <title>fruitfruit 상품 검색 결과</title>
</head>
<body>

    <c:import url="../head.jsp"></c:import>
    <c:import url="../header.jsp"></c:import>

<div class="product-list">
    <h2 class="list-title">검색 결과</h2>

    
	
    <div class="new_list">
	    <c:choose>
	    	<%-- 등록된 제품 목록이 있을 때 --%>
		    <c:when test="${not empty plist}">
		         <c:forEach var="p" items="${plist}">
					<div class="product-card">
			            <a href="${pageContext.request.contextPath}/product/productDetail?product_num=${p.product_num}">
			            <img src="${p.product_path}" alt="${p.product_path}" class="product-img">
			                <div class="product-info">
			                    <strong class="product-title">${p.product_title}</strong>
			                    <span class="product-price">
			                    	<fmt:formatNumber value="${p.product_price}" pattern="#,###원"/>
			                    </span>
			                </div>
			            </a>
			        </div>
		         </c:forEach>
		    </c:when>
		    <%-- 등록된 제품이 없을 때 --%>
		    <c:otherwise>
		        <h3>등록된 제품이 없습니다.</h3>
		    </c:otherwise>
		</c:choose>
    </div>
</div>

<c:if test="${not empty page}">
    <nav class="page-nav">
        <ul class="page-nation">
            <li class="page-item ${page.prev?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${page.startPage-1}">
                    <i class="fas fa-chevron-left"></i>
                </a>
            </li>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
                <li class="page-item ${page.currentPage==status.current?'active':''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${status.current}">${status.current}</a>
                </li>
            </c:forEach>
            <li class="page-item ${page.next?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${page.endPage+1}">
                    <i class="fas fa-chevron-right"></i>
                </a>
            </li>
        </ul>
    </nav>
</c:if>

 <c:import url="../footer.jsp"></c:import>

</body>
</html>
