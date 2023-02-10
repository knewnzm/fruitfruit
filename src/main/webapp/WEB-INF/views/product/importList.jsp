<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:choose>
    <%-- 등록된 제품 목록이 있을 때 --%>
    <c:when test="${sessionScope.user_type==2}">
    <button class="add-btn" type="button" onclick="location.href=`${pageContext.request.contextPath}/product/productForm`">
		                    제품 추가하기
		                </button>
		                
        <div class="list-group product-list">
            <!-- 1개의 제품 데이터 -->
            <c:forEach var="p" items="${plist}">

                <div class="product-item"> 
 <%-- a 태그에 제품이 거래 완료(o.order_type == 2)일때는 disabled를 추가 --%>
                    <a
                        href="${pageContext.request.contextPath}/product/productDetail?product_num=${p.product_num}"
                        class="col-md-12 list-group-item list-group-item-action product-item ${o.order_type == 2 ? 'text-muted' : '' }"
                    >
                        <div class="import-item">
                            <div class="img-box">
                                <div>
                                <!-- 여기 클래스 이름 수정했어요 -->
                                    <img class="product_img" src="${p.product_path}" alt="${p.product_title}"> 
                                </div>
                            </div>
                            <div class="desc-box">
                                <div class="product-header">
                                    <h1 class="product-name">
                                        ${p.product_title}&nbsp; 
                                    </h1>
                                </div>
                           
							<div class="product-detail">
                                    <fmt:formatNumber pattern="#,###원" value="${p.product_price}"></fmt:formatNumber>
	                                <div>등록일 : ${p.product_date}</div>
	                                <div>조회수 : ${p.product_hit}</div>
	                                <div>
                                    <div>판매자 : ${p.product_seller_id }</div>
                                </div>
                            </div>
                             <button type="button" class="btn-close"
	onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${p.product_num}`">삭제하기</button>

                
                        </div>
                        </div>
                    </a>
                </div>  
            </c:forEach>
        </div>
  
    </c:when>
    <c:when test="${sessionScope.user_type==1}">
        <div class="list-group product-list">
            <!-- 1개의 제품 데이터 -->
            <c:forEach var="o" items="${olist}">
                <div class="product-item"> 
                    <a
                        href="${pageContext.request.contextPath}/product/productDetail?product_num=${o.product_num}"
                        class="col-md-12 list-group-item list-group-item-action product-item ${o.order_type == 2 ? 'text-muted' : '' }"
                    >
                        <div class="import-item">
                            <div class="img-box">
                                <div>
                                <!-- 여기 클래스 이름 수정했어요 -->
                                    <img class="product_img" src="${o.p.product_path}" alt="${o.p.product_title}"> 
                                </div>
                            </div>
                            <div class="desc-box">
                                <div class="product-header">
                                    <h1 class="product-name">
                                        ${p.product_title}&nbsp;
                                        <c:choose>
                                            <c:when test="${o.order_type == 0}">
                                                <span class="badge"
                                                	  style="background:white;
                                                	  		 border:1px solid;">주문요청중</span>
                                            </c:when>
                                            <c:when test="${o.order_type == 1}">
                                                <span class="badge"
                                                	  style="background:red;
                                                	         border:1px solid;">주문수락완료</span>
                                            </c:when>
                                            <c:when test="${o.order_type == 2}">
                                                <span class="badge"
                                                	  style="background:red;
                                                	         border:1px solid;">거래확정</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge"
                                                	  style="background:yellow;
                                                	         border:1px solid;">주문취소</span>
                                            </c:otherwise>
                                        </c:choose>
                                        
                                    </h1>
                                </div>
                           
							<div class="product-detail">
                                    <fmt:formatNumber pattern="#,###원" value="${p.product_price}"></fmt:formatNumber>
	                                <div>주문일 : ${o.order_date}</div>
	                                <div>주문수량 : ${o.order_count}</div>
	                                <div>결제대기금액 : ${o.order_count*o.p.product_price}
                                    <div>판매자 : ${o.p.product_seller_id }</div>
                                </div>
                            </div>
                             <button type="button" class="btn-close"
	onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${o.p.product_num}`">삭제하기</button>

                
                        </div>
                        </div>
                    </a>
                </div>  
            </c:forEach>
        </div>
  
    </c:when>
    <%-- 등록된 제품이 없을 때 --%>
    <c:otherwise>
        <h3>등록된 제품이 없습니다.</h3>
    </c:otherwise>
</c:choose>


<!-- 페이지 목록 -->
<%-- <c:if test="${not empty page}">
    <nav class="py-5 w-100 d-flex justify-content-center">
        <ul class="pagination">
            <li class="page-item ${page.prev?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/product/list?p=${page.startPage-1}">
                    <i class="fas fa-chevron-left"></i>
                </a>
            </li>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
                <li class="page-item ${page.currentPage==status.current?'active':''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product/list?p=${status.current}">${status.current}</a>
                </li>
            </c:forEach>
            <li class="page-item ${page.next?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/product/list?p=${page.endPage+1}">
                    <i class="fas fa-chevron-right"></i>
                </a>
            </li>
        </ul>
    </nav>
</c:if>
 --%>