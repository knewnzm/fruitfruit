<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>fruitfruit - 찜 목록</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/report.css">
        <c:import url="../head.jsp"></c:import>
        <script>
            $(document).ready(function() {
	//찜 목록 페이지에서 상품 선택 삭제
 	$(".delete").click(function(){
 		var item = $(".delete").attr("itemid");
 		$.ajax({
 			type: "post" ,
 			url: "${pageContext.request.contextPath}/wish/delete",
        	data: { wish_num: item },
        	success: function(response){
        		alert("삭제되었습니다");
        		location.href=location.href;
        	},
 		});
		
	}); 
	
	//찜 목록 페이지에서 상품 전체 삭제
	$("#deleteAll").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		if(confirm_val){
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
            <div class="container">
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
                                <div class="product-card">
                                    <a href="${pageContext.request.contextPath}/product/productDetail?product_num=${wish.p.product_num}">
                                    <img src="${wish.p.product_path}" alt="${wish.p.product_path}" class="product-img">
                                        <div class="product-info">
                                            <strong class="product-title">${p.product_title}</strong>
                                            <span class="product-price">
                                                <fmt:formatNumber value="${p.product_price}" pattern="#,###원"/>
                                            </span>
                                        </div>
                                    </a>
                                    <input type="button" value="삭제" class="delete" itemid="${wish.wish_num }">
                                </div>
                                <input type="button" value="전체삭제" id="deleteAll"></td>
                             </c:forEach>
                        </div>
                    </c:if>
                </form>                        
                </div>
            </div>
        <c:import url="../footer.jsp"></c:import>
    </body>
</html>