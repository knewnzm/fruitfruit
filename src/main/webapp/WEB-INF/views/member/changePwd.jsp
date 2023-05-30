<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html lang=ko>

<head>
    <meta charset="UTF-8" />
    <title>비밀번호 변경하기</title>

    <link rel="stylesheet" href="/static/css/find.css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        //enter submit 방지 함수
        $(document).ready(function () {
            $("#editForm").find("input").keydown(function () {
                if (event.keyCode === 13) {
                    event.preventDefault();
                }
            });

            /* 버튼 클릭 비활성화 */
            $("#edit").prop("disabled", true); //수정버튼, 탈퇴버튼
            var checkP = false;

            /* 비밀번호 값 입력시 유효성 검사 */
            $("#user_pwd, #pwdCheck").on("input", function () { //비밀번호와 확인란의 값이 변경되었을때
                chkPwd();
            });

            /* 유효성 검사 함수 */
            function chkPwd() {
                checkP = false; //true상태에서 다시 변경했을때 방지
                if ($("#user_pwd").val() == "") { //비밀번호가 빈값
                    $("#pwdResult").text("비밀번호를 입력해주세요.");
                } else if ($("#pwdCheck").val() == "") { //비밀번호 확인이 빈값
                    $("#pwdResult").text("비밀번호 확인란을 입력해주세요.");
                } else if ($("#user_pwd").val() != $("#pwdCheck").val()) { //비밀번호와 확인이 불일치
                    $("#pwdResult").text("비밀번호가 일치하지 않습니다.");
                } else {
                    $("#pwdResult").empty();
                    checkP = true;
                }
                if (checkP) {
                    $("#edit").attr("disabled", false); //disabled해제                 
                } else {
                    $("#edit").attr("disabled", true); //재변경시 disabled  
                }
            }

           
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
            <form name="f" id="editForm" action="${pageContext.request.contextPath}/member/changePwd" method="post">
                <div class="cp_h">
                    <h1>비밀번호를 변경해 주세요.</h1>
                </div>
                <div class="f_box">
                    <div class="cp_newPwd">새 비밀번호</div><br> <input type="password" class="f_id_line" id="user_pwd"
                        name="user_pwd" required><br><br>
                    <div class="cp_editPwd">비밀번호 확인</div><br> <input type="password" class="f_id_line" id="pwdCheck"
                        required><br>
                    <div id="pwdResult" class="cp_msg"></div>
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