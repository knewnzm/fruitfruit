<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <title>fruitfruit 회원관리 페이지</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/userList.css">
            <c:import url="../head.jsp"></c:import>

            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: "/member/userList",
                        type: "post",
                        success: function (obj) {
                            /* console.log(obj) */
                            var obj = obj;

                            /* for(const obj in obj1){ */

                            for (const i in obj) {
                                var html =
                                    "<tbody><tr id=m_" +
                                    obj[i].user_id +
                                    " class='member-data'><td><a href='${pageContext.request.contextPath}/product/search?q=user_id&value=" +
                                    obj[i].user_id +
                                    "'>" +
                                    obj[i].user_id +
                                    "</a><td>" +
                                    obj[i].user_name +
                                    "</td><td>" +
                                    obj[i].user_nick +
                                    "</td><td>" +
                                    obj[i].user_tel +
                                    "</td><td>" +
                                    obj[i].user_addr1 +
                                    "</td><td>" +
                                    obj[i].user_addr2 +
                                    "</td><td><button style='width:90px' type='button' name='del' class='del-btn btn-outline-danger' itemid='" +
                                    obj[i].user_id +
                                    "'>회원삭제</button></td></tr></tbody>";

                                $("#m_list").append(html);
                            }
                        },
                    });

                    $(document).on("click", "button[name='del']", function (e) {
                        console.log("e");
                        console.log(e);
                        console.log($(this));
                        var con = confirm($(this).attr("itemid") + " 삭제 하시겠습니까?");
                        if (con) {
                            var user_id = $(this).attr("itemid");
                            $.ajax({
                                url: "/member/out",
                                type: "post",
                                data: { user_id },

                                success: function (data) {
                                    document.getElementById("m_" + user_id).remove();
                                },
                            });
                        }
                    });
                });
            </script>
        </head>

        <body>
            <c:import url="../header.jsp"></c:import>
            <c:choose>
                <c:when test="${sessionScope.user_type == 3}">
                    <div class="container table-wrap">
                        <h2 class="table-title">fruitfruit 회원 관리 리스트</h2>

                        <table class="tablelist" id="m_list">
                            <thead>
                                <tr>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>닉네임</th>
                                    <th>전화번호</th>
                                    <th>주소</th>
                                    <th>상세주소</th>
                                    <th>회원 삭제</th>
                                </tr>
                            </thead>
                            <c:if test="${not empty nothing }">
                                <tbody>
                                    <td colspan="7">등록된 회원이 없습니다.</td>
                                </tbody>
                            </c:if>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <h2>관리자만 접근할 수 있는 페이지입니다.</h2>
                </c:otherwise>
            </c:choose>
            <c:import url="../footer.jsp"></c:import>
        </body>

        </html>