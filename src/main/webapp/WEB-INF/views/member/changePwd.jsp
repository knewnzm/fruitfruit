<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>비밀번호 변경하기</title>
        
        <link rel="stylesheet" href="/static/css/find.css" />
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        </head>
<header>
<h3>헤더</h3>
</header>
<body>

	<section class="cp_container">
	<div class="f_pd">
<form name="f" action="" method="post">
<div class="cp_h"><h1>비밀번호를 변경해 주세요.</h1></div>
<div class="f_box">
<div class="cp_newPwd">새 비밀번호</div><br> <input type="password" class="f_id_line" id="newPwd" name="newPwd" ><br>
<div class="cp_editPwd">비밀번호 확인</div><br> <input type="password" class="f_id_line" id="editPwd" name="editPwd" ><br>
<button type="submit" id="update" class="f_button">변경</button>
                        </div>
                      </form>
                      </div>
                      </section>

	
	
</body>
<footer>
<h3>footer</h3>
</footer>
</html>
