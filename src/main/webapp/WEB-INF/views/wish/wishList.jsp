<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <title>fruitfruit - 찜 목록</title>
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/static/css/wishList.css">
                    <script src="${pageContext.request.contextPath}/static/js/productList.js" async></script>
                <c:import url="../head.jsp"></c:import>
                <script>
                   $(document).ready(function () {
  //찜 목록 페이지에서 상품 선택 삭제
  $(".delete").click(function () {
    var item = $(this).attr("itemid");
    $.ajax({
      type: "post",
      url: "${pageContext.request.contextPath}/wish/delete",
      data: { wish_num: item },
      success: function (response) {
        alert("삭제되었습니다");
        location.reload(true);
      },
    });
  });

    // 전체 삭제 버튼 클릭 시
    $("#deleteAll").click(function () {
        if (confirm("전체 삭제하시겠습니까?")) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/wish/wishDelAll",
                success: function (response) {
                    alert("삭제되었습니다");
                    location.reload(true); // 페이지를 새로고침하도록 수정
                },
            });
        }
    });
});
                </script>
            </head>

            <body>
                <c:import url="../header.jsp"></c:import>
                <!-- Section-->
                <div class="wish-list">
                    <h2 class="table-title">찜 목록</h2>
                    <form id="w" action="${pageContext.request.contextPath }/wish/wishList" method="post">
                        <%-- 찜한 상품이 없을 때 --%>
                            <c:if test="${empty list }">
                                <h3>찜 목록이 존재하지 않습니다.</h3>
                            </c:if>
                            <c:if test="${not empty list }">
                                <div class="new_list">
                                    <%-- 찜한 상품이 있을 때 --%>
                                        <c:forEach var="wish" items="${list}">
                                        <c:if test="${wish.p.product_view_type==1 }">
                                            <div class="product-card">
                                                <a
                                                    href="${pageContext.request.contextPath}/product/productDetail?product_num=${wish.p.product_num}">
                                                    <img src="${wish.p.product_path}" alt="${wish.p.product_path}"
                                                        class="product-img">
                                                    <div class="product-info">
                                                        <strong class="product-title">${wish.p.product_title}</strong>
                                                        <span class="product-price">
                                                            <fmt:formatNumber value="${wish.p.product_price}"
                                                                pattern="#,###원" />
                                                        </span>
                                                    </div>
                                                </a>
                                                <input type="button" value="삭제" class="delete"
                                                    itemid="${wish.wish_num }">
                                            </div>
                                            </c:if>
                                            
                                        </c:forEach>
                                        <div class="all-del">
                                                <input type="button" value="전체 삭제" id="deleteAll">
                                            </div>
                                </div>
                            </c:if>
                    </form>
                </div>



                <c:if test="${not empty page}">
    <nav class="page-nav">
        <ul class="page-nation">
            <li class="page-item ${page.prev?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/wish/wishList?p=${page.startPage-1}">
                    <i class="fas fa-chevron-left"></i>
                </a>
            </li>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" varStatus="status">
                <li class="page-item ${page.currentPage==status.current?'active':''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/wish/wishList?p=${status.current}">${status.current}</a>
                </li>
            </c:forEach>
            <li class="page-item ${page.next?'':'disabled'}">
                <a class="page-link" href="${pageContext.request.contextPath}/wish/wishList?p=${page.endPage+1}">
                    <i class="fas fa-chevron-right"></i>
                </a>
            </li>
        </ul>
    </nav>
</c:if>


                </div>
                <c:import url="../footer.jsp"></c:import>
            </body>

            </html>