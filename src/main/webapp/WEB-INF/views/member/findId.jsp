<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>findId</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/find.css" />

<style type="text/css">
body{
	line-height: 11px;
	
}
</style>



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
    
<input type="submit" class="f_button" value="확인">
   </div>
</form>
</div>
</div>
</div>

<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<title>findId</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/find.css" />
<style type="text/css">
body{
	line-height: 11px;
	margin: 0;
}
</style>
</head>

<body>

<header>
<h3>���</h3>
</header>

<section class="f_container">
<div class="fi_pd">
<form name="f" action="" method="post">
 <div class="f_h"><h1>���̵� ã��</h1></div>
  <div class="fi_coment"> ���̵� �����̳���?<br>ȸ������ �� ����� ������ �Է��� �ּ���.
  </div>
   <div class="f_box">
    <div class="f_name_title">�̸�
    </div> <br> <input type="text" class="f_id_line" id="user_name" name="user_name" placeholder="�̸��� �Է��� �ּ���."><br>
    <div class="f_tel_title">��ȭ��ȣ
    </div> <br> <input type="text" class="f_id_line" id="user_tel" name="user_tel" placeholder="���ڸ� �Է��� �ּ���."><br>
<input type="submit" id="find" class="f_button" value="Ȯ��">
   </div>
</form>
</div>
</section>

<footer>
<h3>footer</h3>
</footer>
>>>>>>> refs/remotes/daegyu/daegyu

</body>

</html>