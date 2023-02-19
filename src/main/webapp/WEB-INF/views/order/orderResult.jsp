<<<<<<< HEAD
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
<h3>í—¤ë”</h3>
<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
</header>        

<section class="or_container">
<div id="ordercontent">
		<div class="f_pd">
 				<div class="or_h"><h1>ì£¼ë¬¸ìš”ì²­ì´ ì™„ë£Œë˜ì—ˆìŠµë‹ˆë‹¤.</h1>
 		</div>
 		<div class="or_box">
 	    <div class="or_title">ì£¼ë¬¸ë²ˆí˜¸ ${o.order_num } (${o.order_date })</div>
  				<hr>
  				<div class="or_result">
  				<div  class="or_r_img_box">
  				<img src="${p.product_path}" class="or_r_img">
  				</div>
  				
  				<div>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">ìƒí’ˆëª…</dt>
  				<dd class="order_dd">${p.product_title }</dd>
  				</dl>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">ìƒí’ˆë²ˆí˜¸</dt>
  				<dd class="order_dd">${p.product_num }</dd>
  				</dl>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">íŒë§¤ì</dt>
  				<dd class="order_dd">${p.product_seller_id }</dd>
  				</dl>
  				
  				<dl class="order_r_line">
  				<dt class="order_dt">ê²°ì œê¸ˆì•¡</dt>
  				<dd class="order_dd">${o.order_count*p.product_price }</dd>
  				</dl>
  				
  				</div>
  				 
  				</div ><!-- order result box end -->
 		</div>
		<div id="ListBtn">
<button id="" class="back_btn" type="button" onClick="location.href='/'">í™ˆìœ¼ë¡œ</button>
<button class="back_btn" type="button" onClick="location.href='/product/mylist'">ì£¼ë¬¸ëª©ë¡</button>
</div>
		</div>
		</div>
</section>

			 
<footer>
 <c:import url="../footer.jsp"></c:import>
</footer>
</body>

=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<h3>Çì´õ</h3>
</header>

<body>
<section class="or_container">
<div class="f_pd">
 <div class="or_h"><h1>ÁÖ¹®¿äÃ»ÀÌ ¿Ï·áµÇ¾ú½À´Ï´Ù.</h1>
 </div>
 <div class="or_box">
   <div class="or_title">ÁÖ¹®Á¤º¸</div>
  <hr>
  <div class="or_result">(°á°úÃ¢)</div>
 </div>
 
</div>
</section>
</body>

<footer>
<h3>footer</h3>
</footer>
</body>
>>>>>>> refs/remotes/daegyu/daegyu
</html>