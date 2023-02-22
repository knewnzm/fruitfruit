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
    <title>fruitfruit 전체 상품</title>
</head>
<body>

    <c:import url="../head.jsp"></c:import>
    <c:import url="../header.jsp"></c:import>

<div class="product-list">
    <h2 class="list-title">
    	<c:if test="${type == 0}">전체 상품</c:if>
	    <c:if test="${type == 1}">인기순</c:if>
	    <c:if test="${type == 2}">가격 오름차순</c:if>
	    <c:if test="${type == 3}">가격 내림차순</c:if>
	    <c:if test="${type == 4}">상품 등록일순</c:if>
	    <c:if test="${type == 5}">추천 상품</c:if>
		<c:if test="${sessionScope.user_type == 3}">
	   		<c:if test="${type == 6}">blind 처리된 상품</c:if>
		</c:if>
	    <c:if test="${type == 7}">판매자별 상품</c:if>
    </h2>
    
    <div class="selectBox">
	<form action="productList" method="get">
		<select id="type" name="type" onchange="this.form.submit()">
		    <option value="0" <c:if test="${type == 0}">selected</c:if>>전체 상품</option>
		    <option value="1" <c:if test="${type == 1}">selected</c:if>>인기순</option>
		    <option value="2" <c:if test="${type == 2}">selected</c:if>>가격 오름차순</option>
		    <option value="3" <c:if test="${type == 3}">selected</c:if>>가격 내림차순</option>
		    <option value="4" <c:if test="${type == 4}">selected</c:if>>상품 등록일순</option>
		    <option value="5" <c:if test="${type == 5}">selected</c:if>>추천 상품</option>
    	   	<c:if test="${sessionScope.user_type == 3}">
    	   		<option value="6" <c:if test="${type == 6}">selected</c:if>>blind 처리된 상품</option>
    	   	</c:if>
		    <option value="7" <c:if test="${type == 7}">selected</c:if>>판매자별 상품</option>
		  </select>
		</form>
    </div>
    
	
    <div class="new_list">
	    <c:choose>
	    	<%-- 등록된 제품 목록이 있을 때 --%>
		    <c:when test="${not empty plist }">
				
		         <c:forEach var="p" items="${plist}">
		         <c:choose>
		         	<c:when test="${type == 6}">
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
		         	</c:when>
		         	<c:otherwise>
			         	<c:if test = "${p.product_view_type == 1}">
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
					</c:if>
		         	</c:otherwise>
		         </c:choose>					
		         
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
               <c:choose>
                  <c:when test="${page.currentPage-1 >= 1}"> 
                     <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${page.currentPage-1}">
                          <i class="fas fa-chevron-left"></i>
                      </a>
                  </c:when>
                  <c:otherwise>
                     <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${page.startPage}">
                          <i class="fas fa-chevron-left"></i>
                      </a>
                  </c:otherwise>
               </c:choose>

            </li>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
                <li class="page-item ${page.currentPage==status.current?'active':''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${status.current}">${status.current}</a>
                </li>
            </c:forEach>
            <li class="page-item ${page.next?'':'disabled'}">
                <c:choose>
                  <c:when test="${page.currentPage+1 <= page.endPage}"> 
                     <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${page.currentPage+1}">
                          <i class="fas fa-chevron-right"></i>
                      </a>
                  </c:when>
                  <c:otherwise>
                     <a class="page-link" href="${pageContext.request.contextPath}/product/productList?p=${page.endPage}">
                          <i class="fas fa-chevron-right"></i>
                      </a>
                  </c:otherwise>
               </c:choose>
               
            </li>
        </ul>
    </nav>
</c:if>

 <c:import url="../footer.jsp"></c:import> 

</body>
</html>