<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orderR.css" />
<style type="text/css">
body{
	margin: 0;
}
hr{
    height: 2px;
	background-color: Gainsboro;
	margin-bottom: 20px;
	border: 0;
}
</style>
</head>
<body>
<header>
<h3>헤더</h3>
<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
</header>        

<section class="or_container">
<div id="ordercontent">
		<div class="f_pd">
 				<div class="or_h"><h1>주문요청이 완료되었습니다.</h1>
 		</div>
 		<div class="or_box">
 	    <div class="or_title">주문번호 ${o.order_num } (${o.order_date })</div>
  				<hr>
  				<div class="or_result">
  				<div  class="or_r_img_box">
  				<img src="${p.product_path}" class="or_r_img">
  				</div>
  				
  				<div>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">상품명</dt>
  				<dd class="order_dd">${p.product_title }</dd>
  				</dl>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">상품번호</dt>
  				<dd class="order_dd">${p.product_num }</dd>
  				</dl>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">판매자</dt>
  				<dd class="order_dd">${p.product_seller_id }</dd>
  				</dl>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">결제금액</dt>
  				<dd class="order_dd">${o.order_count*p.product_price }</dd>
  				</dl>
  				
  				</div>
  				 
  				</div ><!-- order result box end -->
 		</div>
		<div id="ListBtn">
<button id="" class="back_btn" type="button" onClick="location.href='/'">홈으로</button>
<button class="back_btn" type="button" onClick="location.href='/product/mylist'">주문목록</button>
</div>
		</div>
		</div>
</section>

			 
<footer>
 <c:import url="../footer.jsp"></c:import>
</footer>
</body>

</html>