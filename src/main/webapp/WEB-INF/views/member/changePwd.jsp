<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html lang=ko>
    <head>
        <meta charset="UTF-8" />
        <title>비밀번호 변경하기</title>
        
        <link rel="stylesheet" href="/static/css/find.css" />
       <script src="http://code.jquery.com/jquery-latest.min.js"></script>
          <style type="text/css">
body{
	line-height: 11px;
	
}
</style>
<script>
            var chkp = false;
            function join() {
                $("#edit").attr("disabled", true);
                if (chkp) {
                    $("#edit").attr("disabled", false);
                }
            }

            function chkPwd() {
                if ($("#user_pwd").val() != $("#pwdCheck").val()) {
                    $("#pwd2Result").text("비밀번호가 일치하지 않습니다.");
                    chkp = false;
                } else {
                    $("#pwd2Result").empty();
                    chkp = true;
                }
            }
            $(document).ready(function () {
                // enter 금지
                $('input[type="text"]').keydown(function () {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                    }
                });
                $("#user_pwd").on("propertychange change keyup paste input blur", function () {
                    chkp = false;
                    $("#pwd1Result").empty();
                    $("#pwd2Result").empty();
                    if ($("#user_pwd").val() == "") {
                        $("#pwd1Result").text("필수 정보입니다.");
                    } else if ($("#pwdCheck").val() != "") {
                        chkPwd();
                    }
                    join();
                });

                $("#pwdCheck").on("propertychange change keyup paste input blur", function () {
                    chkp = false;
                    $("#pwd2Result").empty();
                    if ($("#pwdCheck").val() == "") {
                        $("#pwd2Result").text("필수 정보입니다.");
                    } else {
                        chkPwd();
                    }
                    join();
                });
            });
        </script>
        </head>
        <body>
<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>


	<section class="cp_container">
	<div class="f_pd">
<form name="f" action="${pageContext.request.contextPath}/member/changePwd" method="post">
<div class="cp_h"><h1>비밀번호를 변경해 주세요.</h1></div>
<div class="f_box">
<div class="cp_newPwd">새 비밀번호</div><br> <input type="password" class="f_id_line" id="user_pwd" name="user_pwd" required>
<div id="pwd1Result" class="cp_msg"></div><br>
<div class="cp_editPwd">비밀번호 확인</div><br> <input type="password" class="f_id_line" id="pwdCheck" required><br>
 <div id="pwd2Result" class="cp_msg"></div>
<button type="submit" id="edit" class="f_button" disabled="disabled">변경</button>
                        </div>
                        <input type="hidden" name="user_id" value="${user_id}" />
                        
                      </form>
                      </div>
                      </section>
<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
	
	
</body>

</html>
