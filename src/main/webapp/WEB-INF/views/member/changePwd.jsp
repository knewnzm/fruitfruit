<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html lang=ko>
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
<form name="f" action="${pageContext.request.contextPath}/member/changePwd" method="post">
<div class="cp_h"><h1>비밀번호를 변경해 주세요.</h1></div>
<div class="f_box">
<div class="cp_newPwd">새 비밀번호</div><br> <input type="password" class="f_id_line" id="newPwd" name="newPwd" ><br>
<span id="pwd1Result" class="msg"></span><br>
<div class="cp_editPwd">비밀번호 확인</div><br> <input type="password" class="f_id_line" id="editPwd" name="editPwd" ><br>
 <span id="pwd2Result" class="msg"></span>
<button type="submit" id="edit" class="f_button" disabled="disabled">변경</button>
                        </div>
                        <input type="hidden" name="user_id" value="${user_id}" />
                        <input type="hidden" name="user_name" value="${user_name}" />
                        <input type="hidden" name="user_tel" value="${user_tel}" />
                      </form>
                      </div>
                      </section>

	
	
</body>
<footer>
<h3>footer</h3>
</footer>
</html>
