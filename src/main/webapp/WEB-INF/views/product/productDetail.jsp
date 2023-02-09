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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>fruitfruit 상품 상세정보</title>
     <script type="text/javascript">
      $(document).ready(function () {    // enter submit 방지 함수
          
          /* 모달 */
            const body = document.querySelector('body');
            const modal = document.querySelector('.modal');
            const btnOpenPopup = document.querySelector('#reportBtn');
            const btnClose = document.querySelector('#close-modal');
      
            btnOpenPopup.addEventListener('click', () => {
              modal.classList.toggle('show');
              
      
              if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
              }
            });
      
            modal.addEventListener('click', (event) => {
              if (event.target === modal) {
                modal.classList.toggle('show');
      
                if (!modal.classList.contains('show')) {
                  body.style.overflow = 'auto';
                }
              }
            });
            btnClose.addEventListener('click', () => {
              modal.classList.remove('show');
              body.style.overflow = 'auto';
            });
          
          $("#report-btn").click(function (e) {
                    e.preventDefault();
                    //제출할건지 물어보고 확인버튼 클릭시 관리자계정 신고리스트 페이지로 값 보내기
                    var returnValue = confirm("신고리포트를 제출할까요?");
                    if (returnValue == true) {
                        $("#reportModal").submit();
                        alert("신고 접수가 완료되었습니다");
                    } else {
                        alert("취소되었습니다");
                    }
                });
   
      });
      </script> 

  </head>



<body>
    <c:import url="../head.jsp"></c:import>
    <c:import url="../header.jsp"></c:import>

    <div class="product-detail-container">
      <div class="product-detail">
        <div class="product-image-section">
            <img src="${p.product_path }" alt="product.product_title">
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
              <div class="description-value">
                <fmt:formatNumber value="${p.product_quantity}" pattern="#,### 개" />
              </div>
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
          <div class="info ">
            <div class="title">구매할 개수</div>
            <form name="orderform" action="${pageContext.request.contextPath }/order/orderResult">
            <input type="number" name="order_count" min="1" value="1" max="${p.product_quantity}" style="border: 1px solid #000;">
            <input type="hidden" name="product_num" value="${p.product_num }">
            </form>
          </div>
          <div class="info report-wrap">
            <button id="reportBtn" style="cursor: pointer">신고하기</button>
          </div>
        </div>

          <div class="buttons">
            <form  class="wishlist-btn" action="${pageContext.request.contextPath}/wish/add" method="post">
            <button class="wishlist-btn" type="submit">찜</button>
            </form>           
            <button type="button" class="cart-btn" onclick="orderform.submit();">주문요청하기</button>
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

    <div class="modal mhidden" id="modal"> 
      <form action="${pageContext.request.contextPath}/report/add" method="post" class="modalForm" id="reportModal">
            <span class="modal-close" id="closeModal">X</span>  
            <label for="rtitle" class="label">신고 사유</label>
            <input id="rtitle" type="text" class="input" name="report_title" required/>
            <label for="rcontent" class="label">신고 상세 내용</label>
            <textarea id="rcontent" name="report_content" placeholder="신고 사유를 작성해주세요" class="input" required></textarea>
            <input type="hidden" name="report_seller_id" value="${p.product_seller_id}" required />
            <input type="hidden" name="report_writer_id" value="${sessionScope.user_id}" required />
            <div class="modal-footer">
        <button id="close-modal" type="button">닫기</button>
        <button id="report-btn" type="submit">신고하기</button>
        </div>
      </form>
    </div> 

    <script src="/src/main/webapp/static/js/productDetail.js"></script>
</body>


</html>