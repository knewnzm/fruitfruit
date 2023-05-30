<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


      <!DOCTYPE html>
      <html lang="ko">

      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/productDetail.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reviewResult.css" />
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>fruitfruit 상품 상세정보</title>
        <script type="text/javascript">
          $(document).ready(function () {
        	  $("#orderBtn").click(function(){
        		 if("${sessionScope.user_id}"==""){
        			 location.href=`${pageContext.request.contextPath}/member/loginForm`
        		 } else{
        			 $("form[name=orderform]").submit();
        		 }
        	  });
        	 

            /* 신고 모달 */
            const body = document.querySelector('body');
            const modal = document.querySelector('#modal');
            const btnOpenPopup = document.querySelector('#reportBtn');
            const btnClose = document.querySelector('#close-modal');

            /* 버튼 클릭시 모달 창 보여주기 */
            btnOpenPopup.addEventListener('click', () => {
            	if("${sessionScope.user_id}"==""){
            		location.href=`${pageContext.request.contextPath}/member/loginForm`
            	} else{
              modal.classList.toggle('show');
              if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
              }
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

            /* 버튼 클릭시 모달 창 닫기 */
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


            /* 문의 모달 */
            const modal2 = document.querySelector('#modal2');
            const qBtnOpenPopup = document.querySelector('#qBtn');
            const qBtnClose = document.querySelector('#close-modal2');

            qBtnOpenPopup.addEventListener('click', () => {
              modal2.classList.toggle('show');


              if (modal2.classList.contains('show')) {
                body.style.overflow = 'hidden';
              }
            });

            modal2.addEventListener('click', (event) => {
              if (event.target === modal) {
                modal2.classList.toggle('show');

                if (!modal2.classList.contains('show')) {
                  body.style.overflow = 'auto';
                }
              }
            });

            qBtnClose.addEventListener('click', () => {
              modal2.classList.remove('show');
              body.style.overflow = 'auto';
            });

            $("#qModalBtn").click(function (e) {
              e.preventDefault();
              //제출할건지 물어보고 확인버튼 클릭시 관리자계정 신고리스트 페이지로 값 보내기
              var returnValue = confirm("문의사항을 제출할까요?");
              if (returnValue == true) {
                $("#qModal").submit();
                alert("문의사항 접수가 완료되었습니다");
              } else {
                alert("취소되었습니다");
              }
            });
         


          /* 문의 수정 */
          const modal3 = document.querySelector('#modal3');
          const eBtnOpenPopup = document.querySelector('.support-e-btn');
          const eBtnClose = document.querySelector('#close-eModal');

            eBtnOpenPopup.addEventListener('click', () => {
              modal3.classList.toggle('show');


              if (modal3.classList.contains('show')) {
                body.style.overflow = 'hidden';
              }
            });

            modal3.addEventListener('click', (event) => {
              if (event.target === modal) {
                modal3.classList.toggle('show');

                if (!modal3.classList.contains('show')) {
                  body.style.overflow = 'auto';
                }
              }
            });

            eBtnClose.addEventListener('click', () => {
              modal3.classList.remove('show');
              body.style.overflow = 'auto';
            });

            $("#eModalBtn").click(function (e) {
              e.preventDefault();
              var returnValue = confirm("문의사항을 수정할까요?");
              if (returnValue == true) {
                $("#eModal").submit();
                alert("문의사항 수정 완료되었습니다");
              } else {
                alert("취소되었습니다");
              }
            });


            
        

          });

          /* 탭 이동 */
          const tabs = document.querySelectorAll(".tab");
          tabs.forEach((tab) => {
            console.log(this.dataset.content);
            tab.addEventListener("click", test(this.dataset.content));
          });

          function goToScroll(name) {
            var location = document.querySelector("#" + name).offsetTop;
            window.scrollTo({ top: location, behavior: 'smooth' });
          }

          $(document).ready(function () {
            const minusBtn = document.getElementById("minus-btn");
            const plusBtn = document.getElementById("plus-btn");
            const input = document.querySelector('input[type="number"]');
            minusBtn.addEventListener("click", function () {
              const value = parseInt(input.value, 10);
              if (value > input.min) {
                input.value = value - 1;
              }
            });

            plusBtn.addEventListener("click", function () {
              const value = parseInt(input.value, 10);
              if (value < input.max) {
                input.value = value + 1;
              }
            });



            /* 문의 테이블 */


            const body = document.querySelector('body');
            const supportBtns = document.querySelectorAll('.open-support-btn');
            const closeBtns = document.querySelectorAll('#close-modal');
            const modalEls = document.querySelectorAll('.support-content-wrap');

            function openModal(supportNum, supportCon) {
              modalEls.forEach((support) => {
                const supportId = support.getAttribute('id');
                if (supportId === "answer_" + supportNum) {
                  support.classList.toggle('show');
                  body.style.overflow = 'auto';
                } else {
                  support.classList.remove('show');
                }
              });
            }

            function closeModal() {
              modalEls.forEach((support) => {
                support.classList.remove('show');
                body.style.overflow = 'auto';
              });
            }

            supportBtns.forEach((btn) => {
              const supportNum = btn.dataset.supportNum;
              const supportCon = btn.dataset.supportCon;
              btn.addEventListener('click', () => {
                openModal(supportNum, supportCon);
              });
            });

            closeBtns.forEach((btn) => {
              btn.addEventListener('click', () => {
                closeModal();
              });
            });
          });



          function checkDuplicateProduct(productNum) {
  $.ajax({
    url: "/wish/check",
    type: "POST",
    data: { product_num: productNum },
    success: function(response) {
      if (response.duplicate) {
        alert("이미 찜한 상품입니다.");
        // 찜 등록 버튼 비활성화
        $("#wishlist-" + productNum).prop("disabled", true);
      } else {
        // 찜 등록 버튼 활성화
        $("#wishlist-" + productNum).prop("disabled", false);
      }
    },
    error: function(xhr) {
      console.log(xhr.responseText);
    }
  });
}
function checkDuplicateProduct(productNum) {
  $.ajax({
    url: "/wish/check",
    type: "POST",
    data: { product_num: productNum },
    success: function(response) {
      if (response.duplicate) {
        alert("이미 찜한 상품입니다.");
        // 찜 등록 버튼 비활성화
        $("#wishlist-" + productNum).prop("disabled", true);
      } else {
        // 찜 등록 버튼 활성화
        $("#wishlist-" + productNum).prop("disabled", false);
      }
    },
    error: function(xhr) {
      console.log(xhr.responseText);
    }
  });
}

$(document).ready(function() {
  // 모든 찜 버튼에 대해서 click 이벤트 핸들러 등록
  $(".wishlist-btn").click(function(e) {
    // 찜하려는 상품 번호를 읽어옴
    
	  if("${sessionScope.user_id}"==""){
		  e.preventDefault();
    		location.href=`${pageContext.request.contextPath}/member/loginForm`;
    		
    	}else{
    var productNum = $(this).siblings("input[name=product_num]").val();
    checkDuplicateProduct(productNum);
  }
});
});

        </script>

      </head>



      <body>
        <c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>

        <form class="wishlist-btn" action="${pageContext.request.contextPath}/review/reviewForm" method="get">
          <input type="hidden" name="product_num" value="${p.product_num} " />

        </form>

        <div class="product-detail-container">
          <div class="product-detail">
            <div class="product-image-section">
              <img src="${p.product_path}" alt="product.product_title">
              <c:if test="${sessionScope.user_type == 3}">
             <div class="product-pick">
              <form action="${pageContext.request.contextPath}/product/pick">
                 <input type="hidden" name="product_num" value="${p.product_num}">
            <button class="product-pick-btn" type="submit">
           <c:if test="${p.product_pick!=1}"> 관리자<br> pick</button></c:if>
            <c:if test="${p.product_pick==1}">관리자픽<br>취소</c:if>
              </form>

              </div>
            </c:if>
            </div>
            <div class="product-info-section">
              <div class="title">${p.product_title}</div>
              <c:if test="${ sessionScope.user_type == 3 || (sessionScope.user_type == 2 && p.product_seller_id==sessionScope.user_id) }">
                <div class="delete">
                  <button class="p-del"
                    onclick="location.href=`${pageContext.request.contextPath}/product/delete?product_num=${p.product_num}`">
                    <c:if test="${ sessionScope.user_type==3&&p.product_view_type!=0}">
                      상품 블라인드
                    </c:if>
                    <c:if test="${ sessionScope.user_type==3 && p.product_view_type==0}">
                      삭제하기
                    </c:if>
                    <c:if test="${ sessionScope.user_type!=3}">
                      삭제하기
                    </c:if>
                  </button>
                  <c:if test="${ sessionScope.user_type==3 && p.product_view_type==0}">
                  <button class="no-blind"
                  onclick="location.href=`${pageContext.request.contextPath}/product/unblind?product_num=${p.product_num}`">
                    블라인드 해제
                  </button>
                </c:if>
                </div>
              </c:if>
              <div class="price">
                <fmt:formatNumber value="${p.product_price}" pattern="#,###원" />
              </div>

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
                <div class="info quantity">
                  <div class="title">구매할 수량 선택</div>
                  <button id="minus-btn">-</button>
                  <form name="orderform" method="post" action="${pageContext.request.contextPath}/order/orderResult">
                    <input type="number" name="order_count" min="1" max="${p.product_quantity}" value="1">
                    <input type="hidden" name="product_num" value="${p.product_num}">
                    <input type="hidden" name="order_id" value="${sessionScope.user_id }">
                  </form>
                  <button id="plus-btn">+</button>
                </div>
              </div>

              <div class="buttons">
                <!-- <form class="wish-form" onsubmit="return false;">
                  <input type="hidden" name="product_num" value="${p.product_num}">
                  <button id="wishlist-${p.product_num}" class="wishlist-btn" onclick="checkDuplicateProduct('${p.product_num}');">찜</button>
                </form> -->
                <!-- <form class="wish-form" action="${pageContext.request.contextPath}/wish/add" method="post">
                  <input type="hidden" name="product_num" value="${p.product_num}">
                  <button class="wishlist-btn" type="button">찜</button> -->
                <!-- 버튼=버튼으로 하고 함수가 실행되게끔 하고 함수 안에 ajax 넣고 
                ajax에 post controller ->all list select ->  ajax 확인 if else alert  -->
                <form class="wish-form" action="${pageContext.request.contextPath}/wish/add" method="post">
                  <input type="hidden" name="product_num" value="${p.product_num}">
                  <input type="hidden" name="isWished" value="${isWished}">
                  <button class="wishlist-btn" type="submit">찜</button>
                </form>

               



                <button id="orderBtn" type="button" class="cart-btn">주문 요청하기</button>
                <div class="report-wrap">
                  <button id="reportBtn" style="cursor: pointer"><img
                      src="${pageContext.request.contextPath}/static/img/report_icon.png">신고하기</button>
                </div>
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
                <h3 class="product-item-info-title">상품 상세설명</h3>
                <p>${p.product_content}</p>
              </div>
              <div id="details" class="content">
                <div class="product-item-info-wrap">
                  <div class="product-item-info">
                    <h3 class="product-item-info-title">상품고시정보</h3>
                    <ul class="product-item-info-list">
                      <li class="product-item-info-th">제품명</li>
                      <li class="product-item-info-td">상품설명 및 상품이미지 참조</li>
                      <li class="product-item-info-th">식품의 유형</li>
                      <li class="product-item-info-td">상품설명 및 상품이미지 참조</li>
                      <li class="product-item-info-th">생산자 및 소재지</li>
                      <li class="product-item-info-td">상품설명 및 상품이미지 참조</li>
                      <li class="product-item-info-th">제조연월일, 소비기한</li>
                      <li class="product-item-info-td">상품설명 및 상품이미지 참조</li>
                      <li class="product-item-info-th">포장단위별 용량(중량)</li>
                      <li class="product-item-info-td">상품설명 및 상품이미지 참조</li>
                      <li class="product-item-info-th">소비자 안전 주의사항</li>
                      <li class="product-item-info-td">상품설명 및 상품이미지 참조</li>
                    </ul>
                  </div>
                </div>
              </div>
              <!-- 리뷰 -->
              <div id="reviews" class="content">
                <h3 class="pd-title">상품 후기</h3>
                <div class="review-notice">
                  <span class="rnotice-icon">공지</span>
                  <span class="rnotice-title">금주의 베스트 후기 안내</span>
                </div>
                <div class="review-notice">
                  <span class="rnotice-icon">공지</span>
                  <span class="rnotice-title">상품 후기 적립금 정책 안내</span>
                </div>
                <c:if test="${empty reviews }">
                  <h4>등록된 후기가 없습니다.</h4>
                </c:if>
                <c:if test="${not empty reviews }">
                  <c:forEach var="review" items="${reviews }">
                    <div class="review-table">
                      <ul class="review-list">
                        <li class="review-table">
                          <div class="review-form">
                            <div class="review-form-inner">
                              <div class="review-form-inner-2">
                                <div class="review-form-contents">
                                  <div class="review-form-contents-inner">
                                    <div class="review-form-user-area">
                                      <div class="review-form-user-icon">
                                        <img src="https://profile-phinf.pstatic.net/404/default.png?type=f80_80"
                                          data-src="https://profile-phinf.pstatic.net/404/default.png?type=f80_80"
                                          class="review-form-user-img" alt="프로필_image">
                                      </div>
                                      <div class="review-form-user-info">
                                        <div class="review-form-user-info-area">
                                          <strong class="review-content">${review.review_writer }</strong>
                                          <span class="review-content">${review.review_date }</span>
                                        </div>
                                        <div class="review-form-review-title">
                                          <span class="review-content">${review.review_title }</span>
                                        </div>
                                      </div>
                                      <div class="review-form-edit">
                                        <button id="eBtn" onclick="location.href=`${pageContext.request.contextPath}/review/reviewEdit?review_num=${review.review_num}`"
                                        class="e-btn" type="button">수정</button>
                                      </div>
                                      <div class="review-form-delete">
                                        <form method="post" action="${pageContext.request.contextPath}/review/reviewDelete">
                                            <input type="hidden" name="review_num" value="${review.review_num}">
                                            <input type="submit" value="삭제">
                                        </form>
                                      </div>
                                    </div>
                                    <div class="review-form-review-content">
                                      <span class="review-img"><img src="${review.review_path}"></span><br>
                                      <%-- 전체 연결 후에 ${review.review_img}로 변경 예정 --%>
                                        <span class="review-content">${review.review_content }</span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="review-like-wrap">
                              <div class="review-like-area">
                                <div class="review-like">
                                 <form method="post" action="${pageContext.request.contextPath}/review_like/hit">
									<input type="hidden" name="review_like_review_num" value="${review.review_num}" required />
									<input type="hidden" name="review_like_user_id" value="${sessionScope.user_id}" required />
                                  <button type="submit" class="review-like-btn">
                                    <span class="count">${review.review_like_hit }</span>
                                  </button>
                                </form>
                                </div>
                              </div>
                            </div>
                          </div>
                    </div>
                    </li>
                  </c:forEach>
                  </ul>
              </div>
              </c:if>
            </div>
            <div id="inquiries" class="content">
              <div class="">
                <button id="qBtn" class="q-btn" type="button">문의하기</button>
                <h3 class="pd-title">문의하기</h3>
              </div>
              <div class="">
                <table class="tablelist">
                  <thead>
                    <tr>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <c:if test="${empty supports }">
                </table>
                <h4>등록된 문의가 없습니다</h4>
                </c:if>
                <c:if test="${not empty supports }">
                  <tbody class="support-wrap">
                    <!-- 모든 문의하기 리스트를 가지고 옴 -->
                    <c:forEach var="support" items="${supports }">
                      <!-- 판매자댓글이 달리지 않은 문의글 가지고 오기 -->
                      <c:if test="${support.support_parent_num == 0}">
                        <tr id="trId_${support.support_num}">
                          <td><button class="open-support-btn" data-support-num="${support.support_num}"
                              type="button">${support.support_title}</button></td>
                          <td>${support.support_writer}</td>
                          <td>${support.support_date}</td>
                        </tr>
                        <tr id="answer_${support.support_num}" class="support-content-wrap">
                          <td class="support-content" data-support-con="${support.support_num}" colspan="3">
                            <p class="support-content-q"> ${support.support_content}</p>
                            <!-- 작성자일 때만 삭제 뜨게 하기 -->
                            <c:if test="${support.support_writer == sessionScope.user_id }">
                              <div class="support-delete">
                                <form method="post" action="${pageContext.request.contextPath}/support/delete">
                                    <input type="hidden" name="support_num" value="${support.support_num}">
                                    <input type="submit" value="X">
                                </form>
                              </div>
                            </c:if>

                            <c:set var="re_num" value="" />
                            <c:forEach var="support_re" items="${supports }">
                              <c:if test="${support_re.support_parent_num == support.support_num}">
                                <p class="support-content-a"> ${support_re.support_content}</p>
                                <c:set var="re_num" value="${support_re.support_num}" />
                              </c:if>
                            </c:forEach>
                            <c:if test="${sessionScope.user_id eq p.product_seller_id}">
                              <c:choose>
                                <c:when test="${empty re_num}">
                                  <div class="support-re">
                                    <form method="post" action="${pageContext.request.contextPath}/support/add">
                                      <input class="support-input" placeholder="댓글을 작성해주세요" type="text"
                                        name="support_content">
                                      <input type="hidden" name="support_parent_num" value="${support.support_num}"
                                        required />
                                      <input type="hidden" name="support_writer" value="${sessionScope.user_id}"
                                        required />
                                      <input type="hidden" name="support_product_num" value="${p.product_num}"
                                        required />
                                      <input type="hidden" name="support_title" value="${support.support_title}"
                                        required />
                                      <input type="submit" class="support-button" value="등록">
                                    </form>
                                  </div>
                                </c:when>
                                <c:otherwise>
                                  <div class="support-btn-wrap">
                                    <form method="post" action="${pageContext.request.contextPath}/support/edit">
                                      <input class="support-input" placeholder="댓글을 수정해주세요" type="text"
                                        name="support_content" required />
                                      <input type="hidden" name="support_num" value="${re_num}" required />
                                      <input class="support-button" type="submit" value="수정">
                                    </form>
                                    <form method="post" action="${pageContext.request.contextPath}/support/delete">
                                      <input type="hidden" name="support_num" value="${re_num}" required />
                                      <input class="support-del-button" type="submit" value="삭제">
                                    </form>
                                  </div>
                                </c:otherwise>
                              </c:choose>
                            </c:if>
                          </td>
                        </tr>
                      </c:if>
                    </c:forEach>
                  </tbody>
                </c:if>
                </table>
              </div>
            </div>
          </div>
        </div>
        </div>
        </div>



        <!-- 판매자일 경우에만 상품 등록 버튼 보이기 -->
        <c:if test="${sessionScope.user_type == 2}">
          <div id="write-btn-wrap">
            <button id="write-btn"
              onclick="location.href=`${pageContext.request.contextPath}/product/productForm`">상품등록</button>
          </div>
        </c:if>


        <c:import url="../footer.jsp"></c:import>


        <!-- 신고 모달 창  -->
        <div class="modal mhidden" id="modal">
          <form action="${pageContext.request.contextPath}/report/add" method="post" class="modalForm" id="reportModal">
            <div class="modal-main">
              <label for="rtitle" class="label">신고 사유</label>
              <input id="rtitle" type="text" class="input" placeholder="신고 사유를 작성해주세요" name="report_title" required />
              <label for="rcontent" class="label">신고 상세 내용</label>
              <textarea id="rcontent" name="report_content" placeholder="상세 내용을 작성해주세요" class="input"
                required></textarea>
              <input type="hidden" name="report_seller_id" value="${p.product_seller_id}" required />
              <input type="hidden" name="report_writer_id" value="${sessionScope.user_id}" required />
              <input type="hidden" name="product_num" value="${p.product_num}" required />
            </div>
            <div class="modal-footer">
              <button id="close-modal" type="button">닫기</button>
              <button id="report-btn" type="submit">신고하기</button>
            </div>
          </form>
        </div>



        <!-- 문의 모달 창  -->
        <div class="modal mhidden" id="modal2">
          <form action="${pageContext.request.contextPath}/support/add" method="post" class="modalForm" id="qModal">
            <div class="modal-main">
              <label for="qtitle" class="label">문의 제목</label>
              <input id="qtitle" name="support_title" type="text" placeholder="문의 제목을 작성해주세요" class="input" value=""/>
              <label for="qcontent" class="label">문의 내용</label>
              <textarea id="qcontent" name="support_content" placeholder="문의 내용을 작성해주세요" class="input"
                required></textarea>
              <input type="hidden" name="support_writer" value="${sessionScope.user_id}" required />
              <input type="hidden" name="support_parent_num" value=0 required />
              <input type="hidden" name="support_product_num" value="${p.product_num}" required />
            </div>
            <div class="modal-footer">
              <button id="qModalBtn" type="submit">문의하기</button>
              <button id="close-modal2" type="button">닫기</button>
            </div>
          </form>
        </div>

        <!-- 문의 수정 창 -->
        <div class="modal mhidden" id="modal3">
          <form action="${pageContext.request.contextPath}/support/edit" method="post" class="modalForm" id="eModal">
            <div class="modal-main">
              <label for="etitle" class="label">문의 제목</label>
              <input id="etitle" name="support_title" type="text" class="input" value="${s.support_title}" required/>
              <label for="econtent" class="label">문의 내용</label>
              <textarea id="econtent" name="support_content" class="input" required>${s.support_content}</textarea>
              <input type="hidden" name="support_writer" value="${s.support_writer}" required />
              <input type="hidden" name="support_parent_num" value="${s.support_parent_num}" required />
              <input type="hidden" name="support_product_num" value="${s.support_product_num}" required />
            </div>
            <div class="modal-footer">
              <button id="eModalBtn" type="submit">수정하기</button>
              <button id="close-eModal" type="button">닫기</button>
            </div>
          </form>
        </div>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/productDetail.css">
        <script src="/src/main/webapp/static/js/productDetail.js"></script>
      </body>


      </html>