<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<!DOCTYPE html>
<html lang="en">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

>>>>>>> origin/jeongmin
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<<<<<<< HEAD
<<<<<<< HEAD
    <link rel="stylesheet" type="text/css" href="webapp/static/css/main.css">
</head>
=======
    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
/>
  </head>

>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
<body>
  
  <!-- 이미지 슬라이드 -->
  <div class="slider-2">
      
       <div class="side-btns">
          <div><span><i class="fa fa-solid fa-angle-left"></i></span></div>
          <div><span><i class="fa fa-solid fa-angle-right"></i></span></div>
      </div>
<<<<<<< HEAD
=======
    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
/>
  </head>

<body>
  
  <!-- 이미지 슬라이드 -->
  <div class="slider-2">
      
       <div class="side-btns">
          <div><span><i class="fa fa-solid fa-angle-left"></i></span></div>
          <div><span><i class="fa fa-solid fa-angle-right"></i></span></div>
      </div>
=======
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
      
      <div class="slides">
          <div class="active" style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img1.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img2.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img3.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img4.png);"></div>
      </div>
      
      <div class="page-nav">
          <div class="active"></div>
          <div></div>
          <div></div>
          <div></div>
      </div>
  </div>


  <!-- 최신 등록 상품 -->
  <div class="product-list">
    <h2 class="list-title">최신 등록 상품</h2>
			<div class="new_list clearfix">
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple1.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple2.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple3.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple4.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
			</div>
	</div>


    <!-- MD 추천 상품 -->
    <div class="product-list">
      <h2 class="list-title">MD 추천 상품</h2>
        <div class="new_list clearfix">
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple1.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple2.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple3.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple4.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
        </div>
    </div>


    <!-- 인기 BEST 상품 -->
  <div class="product-list">
    <h2 class="list-title">인기 BEST 상품</h2>
			<div class="new_list clearfix">
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple1.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple2.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple3.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple4.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
			</div>
	</div>

    <div id="write-btn-wrap">
          <button id="write-btn">상품등록</button>
      </div>

    
      <script src="${pageContext.request.contextPath}/static/js/main.js" async></script>
      <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js" async></script>
      <script src="${pageContext.request.contextPath}/static/js/slick.min.js" async></script>
<<<<<<< HEAD
>>>>>>> origin/jeongmin
=======
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
/>
  </head>

<body>
  
  <!-- 이미지 슬라이드 -->
  <div class="slider-2">
      
       <div class="side-btns">
          <div><span><i class="fa fa-solid fa-angle-left"></i></span></div>
          <div><span><i class="fa fa-solid fa-angle-right"></i></span></div>
      </div>
      
      <div class="slides">
          <div class="active" style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img1.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img2.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img3.png);"></div>
          <div style="background-image:url(${pageContext.request.contextPath}/static/img/visual_img4.png);"></div>
      </div>
      
      <div class="page-nav">
          <div class="active"></div>
          <div></div>
          <div></div>
          <div></div>
      </div>
  </div>


  <!-- 최신 등록 상품 -->
  <div class="product-list">
    <h2 class="list-title">최신 등록 상품</h2>
			<div class="new_list clearfix">
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple1.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple2.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple3.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple4.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
			</div>
	</div>


    <!-- MD 추천 상품 -->
    <div class="product-list">
      <h2 class="list-title">MD 추천 상품</h2>
        <div class="new_list clearfix">
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple1.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple2.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple3.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
          <div class="product-card">
            <a href="#">
              <img src="${pageContext.request.contextPath}/static/img/apple4.jpg" alt="사과" class="product-img">
              <div class="product-info">
                <strong class="product-title">홍로 사과</strong>
                <span class="product-price">50,000원</span>
              </div>
            </a>
          </div>
        </div>
    </div>


    <!-- 인기 BEST 상품 -->
  <div class="product-list">
    <h2 class="list-title">인기 BEST 상품</h2>
			<div class="new_list clearfix">
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple1.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple2.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple3.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
				<div class="product-card">
          <a href="#">
            <img src="${pageContext.request.contextPath}/static/img/apple4.jpg" alt="사과" class="product-img">
					  <div class="product-info">
						  <strong class="product-title">홍로 사과</strong>
						  <span class="product-price">50,000원</span>
					  </div>
          </a>
				</div>
			</div>
	</div>

    <div id="write-btn-wrap">
          <button id="write-btn">상품등록</button>
      </div>

    
      <script src="${pageContext.request.contextPath}/static/js/main.js" async></script>
      <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js" async></script>
      <script src="${pageContext.request.contextPath}/static/js/slick.min.js" async></script>
</body>
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
</html>