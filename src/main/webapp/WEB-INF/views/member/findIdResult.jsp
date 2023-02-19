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
 <div class="fr_h"><h1>아이디 찾기가 완료되었습니다.</h1></div>
 <div class="fr_box">
  <div class="fr_box1">
  <div class="fr_result">아이디  ${user_id } </div>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/loginForm'">로그인 가기</button>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/findPwd'">비밀번호 찾기</button>
  </div>
 </div>
</div>

<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
	</body>
</html>