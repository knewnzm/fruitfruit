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
                	
                	/* 회원 리스트 불러오기 */
                    $.ajax({
                        type: "get",
                        url: "/member/list",
                        success: function (arr) { //JSONArray
                            $.each(arr, function(i, item) {
                                var html = `
                                    <tbody>
                                        <tr id=m_\${item.user_id} class='member-data'>
                                            <td>
                                                <a href='${pageContext.request.contextPath}/product/search?q=user_id&value=\${item.user_id}'>
                                                    \${item.user_id}
                                                </a>
                                            </td>
                                            <td>\${item.user_name}</td>
                                            <td>\${item.user_nick}</td>
                                            <td>\${item.user_tel}</td>
                                            <td>\${item.user_addr1}</td>
                                            <td>\${item.user_addr2}</td>
                                            <td>
                                                <button style='width:90px' type='button' name='del' class='deleteButton' id='\${item.user_id}'> 
                                                    회원삭제
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>`;

                                $("#m_list").append(html);
                            });
                        }
                    });

                    $(document).on("click", ".deleteButton", function () { //동적으로 추가된 요소라 이벤트 위임 처리
                            var user_id = $(this).attr("id"); //클릭한 버튼속에 저장한 id값
                        var flag = confirm(user_id + "회원을 삭제 하시겠습니까?"); //confirm으로 flag 설정
                        if (flag) {
                            $.ajax({
                                url: "/member/out",
                                type: "get",
                                data: { user_id },

                                success: function (data) {
                                    $("#m_" + user_id).remove(); //해당 tr 삭제
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