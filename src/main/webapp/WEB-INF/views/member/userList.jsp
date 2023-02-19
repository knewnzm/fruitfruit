<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>fruitfruit 신고 관리 페이지</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/report.css">
        <c:import url="../head.jsp"></c:import>
        <script>
            // 삭제버튼
            $(document).on("click", "button[class='btn btn-danger']", function (e) {
                e.preventDefault(e);
                const p_num = $(this).attr("num");
                console.log(p_num);
                if (confirm("삭제하시겠습니까?")) {
                    document.getElementById("trId_" + p_num).remove();
                    $.ajax({
                        type: "post",
                        url: "/report/delete",
                        data: { report_num: p_num },
                        success: function (data) {
                            alert("삭제되었습니다.");
                        },
                    });
                } else {
                    alert("취소되었습니다.");
                }
            });
        </script>
    </head>
    <body>
        <c:import url="../header.jsp"></c:import>
            <div class="container table-wrap">
                    <h2 class="table-title">회원 리스트</h2>
                <c:if test="${empty list }"> 
                    <table class="tablelist">
                        <thead>
                            <tr>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>닉네임</th>
                                <th>email</th>
                                <th>전화번호</th>
                                <th>우편번호</th>
                                <th>주소</th>
                                <th>생년월일</th>
                                <th>가입일</th>
                                <th>전화번호</th>
                            </tr>
                        </thead>
                        <tbody>
                            <td colspan="10">회원 목록이 존재하지 않습니다.</td>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${not empty list }">
                    <table class="tablelist">
                        <thead>
                            <tr>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>닉네임</th>
                                <th>email</th>
                                <th>전화번호</th>
                                <th>우편번호</th>
                                <th>주소</th>
                                <th>생년월일</th>
                                <th>가입일</th>
                                <th>전화번호</th>
                            </tr>
                        </thead>
                        <c:forEach var="report" items="${list }">
                            <tr id="trId_${report.report_num}">
                                <td>dd</td>
                                <td> <!-- 신고제목 누를 경우 내용 모달창으로 뜸 -->
                                    <a
                                        id="report_${report.report_num}"
                                        href="#report_${report.report_num}"
                                        data-bs-toggle="modal"
                                        data-bs-target="#modal_${report.report_num}"
                                        >${report.report_title }</a
                                    >
                                     <!-- Modal -->
                                     <div
                                     class="modal fade"
                                     id="modal_${report.report_num}"
                                     tabindex="-1"
                                     aria-labelledby="exampleModalLabel"
                                     aria-hidden="true"
                                 >
                                     <div class="modal-dialog">
                                         <div class="modal-content">
                                             <div class="modal-header">
                                                 <h5 class="modal-title" id="exampleModalLabel">${report.report_title }</h5>
                                                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                             </div>
                                             <div class="modal-body">${report.report_content }</div>
                                             <div class="modal-footer">
                                                 <button
                                                     type="button"
                                                     num="${report.report_num}"
                                                     id="del_content${report.report_num}"
                                                     class="btn btn-danger"
                                                     data-bs-dismiss="modal"
                                                 >
                                                     삭제
                                                 </button>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                </td>
                                <td>dd</td>
                                <td>dd</td>
                                <td>dd</td>
                                <td>dd</td>
                                <td>dd</td>
                                <td>dd</td>
                                <td>dd</td>
                                <td>dd</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
                <!-- </form> -->
            </div>
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
</html>
>>>>>>> refs/remotes/daegyu/daegyu
