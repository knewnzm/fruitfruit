<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <c:import url="../head.jsp"></c:import>
        <style>
            .member-data td {
                vertical-align: middle;
            }
        </style>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: "/member/List",
                    type: "post",
                    success: function (obj) {
                        /* console.log(obj) */
                        var obj = obj;

                        /* for(const obj in obj1){ */

                        for (const i in obj) {
                            var html =
                                "<tr id=m_" +
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
                                obj[i].user_postcode +
                                "</td><td>" +
                                obj[i].user_addr1 +
                                " " +
                                obj[i].user_addr2 +
                                "</td><td><button style='width:90px' type='button' name='del' class='btn btn-outline-danger' itemid='" +
                                    obj[i].user_id +
                                    "'>회원삭제</button></td></tr>";
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
        <section class="py-5">
            <div class="container">
                <div class="py-3">
                    <h1>회원관리</h1>
                </div>
                <table class="table table-sm table-hover" id="m_list">
                    <thead>
                        <tr>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>닉네임</td>
                            <td>email</td>
                            <td>전화번호</td>
                            <td>우편번호</td>
                            <td>주소</td>
                        </tr>
                    </thead>
                </table>
            </div>
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
</html>
