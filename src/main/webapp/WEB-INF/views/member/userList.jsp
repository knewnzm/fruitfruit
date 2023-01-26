<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>프룻프룻 회원관리 페이지</title>
        <c:import url="../head.jsp"></c:import>
        <style>
            .member-data td {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <c:import url="../header.jsp"></c:import>
        <section>
            <div class="container">
                <div class="userList">
                    <h1>회원 관리</h1>
                </div>
                <table class="table table-sm table-hover" id="m_list">
                    <thead>
                        <tr>
                            <td style="width: 70px">아이디</td>
                            <td style="width: 70px">이름</td>
                            <td style="width: 70px">닉네임</td>
                            <td>email</td>
                            <td style="width: 70px">전화번호</td>
                            <td style="width: 70px">우편번호</td>
                            <td>주소</td>
                            <td>생년월일</td>
                            <td>가입일</td>
                            <td style="width: 70px">거래점수</td>
                            <td></td>
                        </tr>
                    </thead>
                </table>
            </div>
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
</html>
