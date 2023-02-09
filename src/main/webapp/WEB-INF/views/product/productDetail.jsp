<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/productDetail.css" />
    <script src="${pageContext.request.contextPath}/static/js/productDetail.js" async></script>
    <title>fruitfruit 상품 상세정보</title>
</head>
<body>

    <c:import url="../head.jsp"></c:import>
    <c:import url="../header.jsp"></c:import>

    <div class="product-detail-container">
      <div class="product-detail">
        <div class="product-image-section">
        	<img src="${p.product_path}" alt="${p.product_path}"/>
        </div>
        <div class="product-info-section">
          <div class="title">${p.product_title}</div>
          <div class="price"><fmt:formatNumber value="${p.product_price}" pattern="#,###원" /></div>

          <div class="info-wrap">
          <div class="info delivery">
            <div class="title">배송</div>
            <div class="description">
              <div class="description-value">직접배송</div>
              <div class="delivery-details">별도 문의</div>
            </div>
          </div>
          <div class="info seller">
            <div class="title">판매자</div>
            <div class="description">
              <div class="description-value">${p.product_seller_id}</div>
            </div>
          </div>
          <div class="info quantity">
            <div class="title">수량</div>
            <div class="description">
              <div class="description-value"><fmt:formatNumber value="${p.product_quantity}" pattern="#,### 개" /></div>
            </div>
          </div>
          <div class="info allergy-info">
            <div class="title">조회수</div>
            <div class="description">
              <div class="description-value">${p.product_hit}</div>
            </div>
          </div>
          <div class="info selling-unit">
            <div class="title">판매단위</div>
            <div class="description">
              <div class="description-value">상품설명/상세정보 참조</div>
            </div>
          </div>
          <div class="info weight-volume">
            <div class="title">중량/용량</div>
            <div class="description">
              <div class="description-value">상품설명/상세정보 참조</div>
            </div>
          </div>
<!--           <div class="info report-wrap">
            <button class="report-btn">신고하기</button>
          </div> -->
        </div>

          <div class="buttons">
            <button class="wishlist-btn">찜</button>
            <button class="cart-btn">장바구니 담기</button>
            <form id="report_form" action="${pageContext.request.contextPath}/report/add">
            <button type="submit" class="btn btn-primary" id="report">신고</button>
            <input type="hidden" name="product_num" value="${p.product_num }">
            <input type="hidden" name="product_seller_id" value="${p.product_seller_id }">
            </form>
          </div>

        </div>
      </div>

      <div class="product-info">
        <div class="tabs-container">
            <button class="tab" onclick="goToScroll('description')"> 상품설명
            <button class="tab" onclick="goToScroll('details')"> 상세정보
            <button class="tab" onclick="goToScroll('reviews')"> 후기
            <button class="tab" onclick="goToScroll('inquiries')"> 문의
        </div>
        <div id="product-description">
          <div class="content" id="description">
            <h2>Product Description</h2>
            <p>Insert product description here.</p>
          </div>
          <div id="details" class="content">
            <h2>Product Details</h2>
            <ul>
              <li>Insert detail 1</li>
              <li>Insert detail 2</li>
              <li>Insert detail 3</li>
            </ul>
          </div>
          <div id="reviews" class="content">
            <h2>Product Reviews</h2>
            <div class="review">
              <h3>Review Title</h3>
              <p>Insert review here.</p>
            </div>
            <div class="review">
              <h3>Review Title</h3>
              <p>Insert review here.</p>
            </div>
          </div>
          <div id="inquiries" class="content">
            <h2>Product Questions</h2>
            <div class="question">
              <h3>Question Title</h3>
              <p>Insert question here.</p>
            </div>
            <div class="question">
              <h3>Question Title</h3>
              <p>Insert question here.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <c:import url="../footer.jsp"></c:import>
</body>
</html>