<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/findIdResult.css" />
</head>
<header>�ش�</header>
<body>
<div class="fr_container">
 <div class="fr_h"><h1>���̵� ã�Ⱑ �Ϸ�Ǿ����ϴ�.</h1></div>
 <div class="fr_box">
  <div class="fr_box1">
  <div class="fr_result">���̵�  ${user_id } </div>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/loginForm'">�α��� ����</button>
   <button type="button" class="fr_button" onclick="location.href='${pageContext.request.contextPath}/member/findPwd'">��й�ȣ ã��</button>
  </div>
 </div>
</div>
</body>
<footer>Ǫ��</footer>
</html>