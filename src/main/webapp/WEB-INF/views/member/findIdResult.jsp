<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/findIdResult.css" />
</head>

<body>
<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<div class="fr_container">
 <div class="fr_h"><h1>ì•„ì´ë”” ì°¾ê¸°ê°€ ì™„ë£Œë˜ì—ˆìŠµë‹ˆë‹¤.</h1></div>
 <div class="fr_box">
  <div class="fr_box1">
  <div class="fr_result">ì•„ì´ë””  ${user_id } </div>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/loginForm'">ë¡œê·¸ì¸ ê°€ê¸°</button>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/findPwd'">ë¹„ë°€ë²ˆí˜¸ ì°¾ê¸°</button>
  </div>
 </div>
</div>

<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
	</body>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/findIdResult.css" />
</head>
<header>ÇØ´õ</header>
<body>
<div class="fr_container">
 <div class="fr_h"><h1>¾ÆÀÌµğ Ã£±â°¡ ¿Ï·áµÇ¾ú½À´Ï´Ù.</h1></div>
 <div class="fr_box">
  <div class="fr_box1">
  <div class="fr_result">¾ÆÀÌµğ  ${user_id } </div>
   <button type="button" class="fr_button" onclick="${pageContext.request.contextPath}/member/loginForm">·Î±×ÀÎ °¡±â</button>
   <button type="button" class="fr_button" onclick="${pageContext.request.contextPath}/member/findPwd">ºñ¹Ğ¹øÈ£ Ã£±â</button>
  </div>
 </div>
</div>
</body>
<footer>ÇªÅÍ</footer>
>>>>>>> refs/remotes/daegyu/daegyu
</html>