<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
/>
  </head>

<body>
  
  <!-- 이미지 슬라이드 -->
  <div class="slider-2">
      
       <div class="side-btns">
          <div><span><i class="fa fa-solid fa-angle-left"></i></span></div>
          <div><span><i class="fa fa-solid fa-angle-right"></i></span></div>
      </div>
      
      <div class="slides">
          <div class="active" style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img1.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img2.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img3.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img4.png);"></div>
      </div>
      
      <div class="page-nav">
          <div class="active"></div>
          <div></div>
          <div></div>
          <div></div>
      </div>
  </div>


  <!-- 최신 등록 상품 -->
  <div class="product-list">
    <h2 class="list-title">최신 등록 상품</h2>
  <div id="new-product" class="new_list clearfix">
    <c:choose>
      <%-- 등록된 제품 목록이 있을 때 --%>
        <c:when test="${not empty list}">
             <c:forEach var="p" items="${list}">
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


    <!-- MD 추천 상품 -->
    <div class="product-list">
      <h2 class="list-title">MD 추천 상품</h2>
        <div id="md-product" class="new_list clearfix">
          	<c:choose>
	    	<%-- 등록된 제품 목록이 있을 때 --%>
			    <c:when test="${not empty list2}">
			         <c:forEach var="p" items="${list2}">
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


    <!-- 인기 BEST 상품 -->
  <div class="product-list">
    <h2 class="list-title">인기 BEST 상품</h2>
			<div id="best-product" class="new_list clearfix">
				<c:choose>
	    	<%-- 등록된 제품 목록이 있을 때 --%>
			    <c:when test="${not empty list3}">
			         <c:forEach var="p" items="${list3}">
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

  <!-- 판매자일 경우에만 상품 등록 버튼 보이기 -->
  <c:if test="${sessionScope.user_type == 2}">
    <div id="write-btn-wrap">
          <button id="write-btn" onclick="location.href=`${pageContext.request.contextPath}/product/productForm`">상품등록</button>
      </div>
  </c:if>
    
      <script src="${pageContext.request.contextPath}/static/js/main.js" async></script>
      <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js" async></script>
      <script src="${pageContext.request.contextPath}/static/js/slick.min.js" async></script>
</body>
</html>