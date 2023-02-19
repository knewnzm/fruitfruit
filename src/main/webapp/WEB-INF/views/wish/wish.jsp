<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>fruitfruit 찜 목록</title>
        <c:import url="../head.jsp"></c:import>
        <link rel="stylesheet" href="/static/css/product_list.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/wish.css">
        <script>
            if ("${sessionScope.user_id}" === "") {
                alert("로그인이 필요한 페이지입니다.");
                location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
            }
            $(document).ready(function () {
                //찜 목록 페이지에서 상품 선택 삭제
                $(".delete").click(function () {
                    var item = $(".delete").attr("itemid");
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/wish/delete",
                        data: { wish_num: item },
                        success: function (response) {
                            alert("삭제되었습니다");
                            location.href = location.href;
                        },
                    });
                });
                //찜 목록 페이지에서 상품 전체 삭제
                $("#deleteAll").click(function () {
                    var confirm_val = confirm("정말 삭제하시겠습니까?");
                    if (confirm_val) {
                        location.href = "/wish/wishDelAll";
                    } else {
                        //no
                        alert("전체삭제 취소");
                    }
                });
            });
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
