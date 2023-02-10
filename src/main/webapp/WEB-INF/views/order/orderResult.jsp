<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="utf-8">
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
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>


<section class="or_container">
<div class="f_pd">
 <div class="or_h"><h1>주문요청이 완료되었습니다.</h1>
 </div>
 <div class="or_box">
   <div class="or_title">주문정보</div>
  <hr>
  <div class="or_result">(결과창)</div>
 </div>
 
</div>
</section>
<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
</body>

</body>
</html>