<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:choose>
    <%-- 등록된 제품 목록이 있을 때 --%>
    <c:when test="${not empty plist}">
        <div class="list-group product-list">
            <!-- 1개의 제품 데이터 -->
            <c:forEach var="p" items="${plist}">
                <%-- a 태그에 제품이 거래 완료(p.product_result == 2)일때는 disabled를 추가 --%>
                <div class="product-item">
                    <c:if test="${sessionScope.user_type==2}">
                        <div class="admin">
                            <button
                                type="button"
                                class="btn-close"
                                onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${p.product_num}`"
                            ></button>
                        </div>
                    </c:if>
                    <a
                        href="${pageContext.request.contextPath}/product/view?product_num=${p.product_num}"
                        class="col-md-12 list-group-item list-group-item-action product-item ${p.product_result == 2 ? 'text-muted' : '' }"
                    >
                        <div class="import-item">
                            <div class="img-box">
                                <div>
                                    <img class="product-img" src="${p.path1}" alt="${p.product_name}">
                                </div>
                            </div>
                            <div class="desc-box">
                                <div class="product-header">
                                        ${p.product_name}&nbsp;
                                    <h1 class="product-name">
                                        <c:choose>
                                            <c:when test="${p.product_result == 0}">
                                                <span class="badge"
                                                	  style="background:white;
                                                	  		 border:1px solid;">판매중</span>
                                            </c:when>
                                            <c:when test="${p.product_result == 1}">
                                                <span class="badge"
                                                	  style="background:red;
                                                	         border:1px solid;">거래 대기중</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge"
                                                	  style="background:yellow;
                                                	         border:1px solid;">판매완료</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </h1>
                                </div>
                                </div>
                                <div class="product-detail">
                                    <fmt:formatNumber pattern="#,###원" value="${p.product_price}"></fmt:formatNumber>
	                                <div>등록일 : ${p.stringDate}</div>
	                                <div>조회수 : ${p.product_hit}</div>
	                                <div>
                                    <div>판매자 : ${p.member.user_nickname}</div>
                                </div>
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