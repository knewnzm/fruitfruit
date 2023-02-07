<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/productList.css" />
    <script src="${pageContext.request.contextPath}/static/js/productList.js" async></script>
    <title>fruitfruit 상품 검색</title>
</head>
<body>

    <c:import url="../head.jsp"></c:import>
    <c:import url="../header.jsp"></c:import>

<div class="product-list">
    <h2 class="list-title">최신 등록 상품</h2>
    <div class="new_list">
        <div class="product-card">
            <a href="#">
            <img src="https://sitem.ssgcdn.com/48/72/42/item/1000456427248_i1_1100.jpg" alt="사과" class="product-img">
                <div class="product-info">
                    <strong class="product-title">홍로 사과</strong>
                    <span class="product-price">50,000원</span>
                </div>
            </a>
        </div>
    </div>
</div>

<div id="write-btn-wrap">
    <input type="button" id="write-btn" value="상품등록" onclick="create_card();"></input>
</div>

<div class="page_wrap">
    <div class="page_nation">
       <!-- <a class="arrow pprev" href="#"></a>
       <a class="arrow prev" href="#"></a> -->
       <a href="#" class="page active">1</a>
       <a href="#" class="page">2</a>
       <a href="#" class="page">3</a>
       <a href="#" class="page">4</a>
       <a href="#" class="page">5</a>
       <a href="#" class="page">6</a>
       <a href="#" class="page">7</a>
       <a href="#" class="page">8</a>
       <a href="#" class="page">9</a>
       <a href="#" class="page">10</a>
       <!-- <a class="arrow next" href="#"></a>
       <a class="arrow nnext" href="#"></a> -->
    </div>
 </div>

 <c:import url="../footer.jsp"></c:import>

</body>
</html>