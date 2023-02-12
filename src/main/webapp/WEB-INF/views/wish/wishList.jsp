<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>fruitfruit - 찜 목록</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/report.css">
        <c:import url="../head.jsp"></c:import>
        <script>
            
        </script>
    </head>
    <body>
        <c:import url="../header.jsp"></c:import>
        <!-- Section-->
        <section class="py-5">
            <div class="container">
                <div class="py-3">
                    <h2 class="table-title">찜 목록</h2>
                </div>
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
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
</html>