<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
    function del(num, pnum) {
        if (confirm("주문취소상품을 주문 목록에서 삭제하시겠습니까? 이 작업은 복구할 수 없습니다")) {
            location.href = `${pageContext.request.contextPath}/order/orderDelete?order_num=\${num}&product_num=\${pnum}`;
        }
    }
</script>
<button class="add-btn" type="button" onclick="location.href=`${pageContext.request.contextPath}/product/mylist`">
    내 판매 목록
</button>

<div class="p-wrap">
    <div class="p-card">
        <div>
            <div class="import-item">
                <div class="img-box">
                    <img class="product-pimg" src="${p.product_path}" alt="${p.product_title}" />
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
        </div>
    </div>
</div>

<div>
    <table class="list">
        <tbody>
            <tr>
                <th>주문 상태</th>
                <th>구매자 이름</th>
                <th>구매 수량</th>
                <th>구매자 주소</th>
                <th>결제 금액</th>
            </tr>
            <c:forEach var="o" items="${olist }">

                <tr>
                    <c:choose>
                        <c:when test="${o.order_type == 0}">
                            <td>
                                <span class="badge" style="background:white;
                                                                           border:1px solid;">주문수락대기중</span>
                            </td>
                        </c:when>
                        <c:when test="${o.order_type == 1}">
                            <td>
                                <span class="badge" style="background:red;
                                                                         border:1px solid;">주문수락완료</span>
                            </td>
                        </c:when>
                        <c:when test="${o.order_type == 2}">
                            <td>
                                <span class="badge" style="background:red;
                                                                         border:1px solid;">거래확정</span>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td>
                                <span class="badge" style="background:yellow;
                                                                         border:1px solid;">주문취소</span>
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <td>${o.m.user_name}</td>
                    <td>${o.order_count}</td>
                    <td>${o.m.user_addr1} ${o.m.user_addr2}</td>
                    <td>${o.order_count*p.product_price}</td>
                    <td>
                    <%-- 주문 요청 or 주문 수락 단계일 경우 --%>
                        <c:if test="${o.order_type == 0 ||o.order_type == 1 }">
                            <button class="cancel_btn"
                                onclick="location.href=`${pageContext.request.contextPath}/order/cancel?order_num=${o.order_num}&product_num=${p.product_num }`">주문취소</button>
                                <button class="comple_btn"
                                onclick="location.href=`${pageContext.request.contextPath}/order/change?order_num=${o.order_num}&product_num=${p.product_num }`">주문수락</button>
                        </c:if>
                        
                        <%-- 주문 취소상태일경우 --%>
                        <c:if test="${o.order_type == 3}">
                            <button type="button" class="cancel_btn" onclick="del(${o.order_num},${p.product_num})">목록에서
                                삭제</button>
                        </c:if>
                    </td>
                </tr>

            </c:forEach>
        </tbody>
    </table>
</div>