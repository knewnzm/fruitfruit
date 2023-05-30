<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>findId</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/find.css" />
</head>
<body>
<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<div class="wrap">
<div class="f_container">
<div class="fi_pd">
<form name="f" action="${pageContext.request.contextPath}/member/findId" method="post">
 <div class="f_h"><h1>아이디 찾기</h1></div>
  <div class="fi_coment">
  <c:if test="${empty fail }">
아이디를 잊으셨나요?<br>회원가입 시 등록한 정보를 입력해 주세요.
</c:if>
<c:if test="${not empty fail }">
회원 정보가 일치하지 않습니다. 다시 확인해주세요
</c:if>
  </div>
   <div class="f_box">
    <div class="f_name_title">이름
    </div> <br> <input type="text" class="f_id_line" id="user_name" name="user_name" placeholder="이름을 입력해 주세요." required><br>
    <div class="f_tel_title">전화번호
    </div> <br> <input type="number" class="f_id_line" id="user_tel" name="user_tel" placeholder="숫자만 입력해 주세요." required><br>
    
<input type="submit" id="submit" class="f_button" value="확인">
   </div>
</form>
</div>
</div>
</div>

<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>

</body>

</html>