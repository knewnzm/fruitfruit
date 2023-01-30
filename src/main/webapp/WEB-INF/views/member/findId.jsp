<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>findId</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/find.css" />

</head>

<body>

<header>
<h3>헤더</h3>
</header>

<section class="f_container">
<div class="fi_pd">
<form name="f" action="" method="post">
 <div class="f_h"><h1>아이디 찾기</h1></div>
  <div class="fi_coment"> 아이디를 잊으셨나요?<br>회원가입 시 등록한 정보를 입력해 주세요.
  </div>
   <div class="f_box">
    <div class="f_name_title">이름
    </div> <br> <input type="text" class="f_id_line" id="user_name" name="user_name" placeholder="이름을 입력해 주세요."><br>
    <div class="f_tel_title">전화번호
    </div> <br> <input type="text" class="f_id_line" id="user_tel" name="user_tel" placeholder="숫자만 입력해 주세요."><br>
<button type="submit" id="find" class="f_button">확인</button>
   </div>
</form>
</div>
</section>

<footer>
<h3>footer</h3>
</footer>

</body>

</html>