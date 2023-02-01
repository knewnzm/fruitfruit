<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>비밀번호 찾기</title>
         <link rel="stylesheet" href="/static/css/find.css" />
        
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
       
    </head>
    
       <header>
		<h3>헤더</h3>
	</header>
<body>

	<section class="f_container">
	<div class="fp_pd">
<form name="f" action="" method="post">
<div class="f_h"><h1>비밀번호 찾기</h1></div>
<div class="fp_coment"> 비밀번호를 잊으셨나요?<br>회원가입 시 등록한 정보를 입력해 주세요.</div>
<div class="f_box">
<div class="fp_id_title">이메일</div><br> <input type="text" class="f_id_line" id="user_id" name="user_id" placeholder="이메일을 입력해 주세요."><br>
<div class="f_name_title">이름</div><br> <input type="text" class="f_id_line" id="user_name" name="user_name" placeholder="이름을 입력해 주세요."><br>
<div class="f_tel_title">전화번호</div><br> <input type="text" class="f_id_line" id="user_tel" name="user_tel" placeholder="숫자만 입력해 주세요."><br>
<button type="submit" id="find" class="f_button">확인</button>
                        </div>
                      </form>
                      </div>
                      </section>
                      </body>
                    <footer>
		<h3>footer</h3>
	</footer>
	
</html>
