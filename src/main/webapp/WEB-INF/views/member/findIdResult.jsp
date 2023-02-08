<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/findIdResult.css" />
</head>
<header>해더</header>
<body>
<div class="fr_container">
 <div class="fr_h"><h1>아이디 찾기가 완료되었습니다.</h1></div>
 <div class="fr_box">
  <div class="fr_box1">
  <div class="fr_result">아이디  ${user_id } </div>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/loginForm'">로그인 가기</button>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/findPwd'">비밀번호 찾기</button>
  </div>
 </div>
</div>
</body>
<footer>푸터</footer>
</html>