<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
function del(num){
	if (confirm("주문취소상품을 주문 목록에서 삭제하시겠습니까? 이 작업은 복구할 수 없습니다")){
	location.href=`${pageContext.request.contextPath}/order/orderDelete?order_num=${"${num}"}`;
	}
}



</script>

<c:choose>
    <%-- 판매자 일때 --%>
    <c:when test="${sessionScope.user_type==2}">
    	<button class="add-btn" type="button" onclick="location.href=`${pageContext.request.contextPath}/product/productForm`">
			제품 추가하기
		</button>
		                
        <div>
			<c:forEach var="p" items="${plist}">
				<div class="p-wrap">
					<div class="p-card">
						<div class="product-item"> 
							<a href="${pageContext.request.contextPath}/product/productDetail?product_num=${p.product_num}">
								<div class="import-item">
									<div class="img-box">
										<img class="product-pimg" src="${p.product_path}" alt="${p.product_title}"/> 
									</div>
									<div class="desc-box">
										<div class="product-header">
											<h1 class="product-name">
												${p.product_title}&nbsp; 
											</h1>
										</div>
	                           
										<div class="product-detail">
											<div>
												<fmt:formatNumber pattern="#,###원" value="${p.product_price}"></fmt:formatNumber>
												<div>등록일 : ${p.product_date}</div>
												<div>조회수 : ${p.product_hit}</div>
												<div>판매자 : ${p.product_seller_id }</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>

						<div id="btn">
							<button id="product_buyer_btn=${p.product_num}" class="add-btn" 
							onclick="location.href=`${pageContext.request.contextPath}/product/orderList?product_num=${p.product_num}`">구매자 목록 보기</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:when>
    
    <%-- 구매자 일때 --%>
    <c:when test="${sessionScope.user_type==1}">
        <div>
			<c:forEach var="o" items="${olist}">
				<div class="p-wrap">
                 	<div class="p-card">
                 		<div class="product-item">
                 			<a href="${pageContext.request.contextPath}/product/productDetail?product_num=${o.product_num}">
                    			<div class="import-item">
									<div class="img-box">
                                		<img class="product-pimg" src="${o.p.product_path}" alt="${o.p.product_title}"/> 
									</div>
                            		<div class="desc-box">
										<div class="product-header">
											<h1 class="product-name">
												${o.p.product_title}&nbsp; 
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
											<div>
												<fmt:formatNumber pattern="#,###원" value="${o.p.product_price}"></fmt:formatNumber>
												<div>주문일 : ${o.order_date}</div>
												<div>주문수량 : ${o.order_count}</div>
		                               		 	<div>결제대기금액 : ${o.order_count*o.p.product_price}</div>
		                               		 	<div>판매자 : ${o.p.product_seller_id }</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div> 
						<div>
							<c:if test="${o.order_type != 3}">
							<button type="button" class="cancel_btn"
										onclick="location.href=`${pageContext.request.contextPath}/order/cancel?order_num=${o.order_num}`">구매취소</button>
										</c:if>
										<c:if test="${o.order_type == 3}">
										<button type="button" class="cancel_btn"
										onclick="del(${o.order_num})">목록에서 삭제</button> 
										</c:if>
										<c:if test="${o.order_type == 1}"> 
							<button type="button" class="comple_btn"
										onclick="location.href=`${pageContext.request.contextPath}/order/change?order_num=${o.order_num}`">구매확정</button>
										</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:when>
	
    <%-- 등록된 제품이 없을 때 --%>
    <c:otherwise>
        <h3>등록된 제품이 없습니다.</h3>
    </c:otherwise>
</c:choose>
