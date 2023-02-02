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
                    <h2 class="table-title">접수된 신고 리스트</h2>
                <c:if test="${empty list }"> 
                    <table class="tablelist">
                        <thead>
                            <tr>
                                <th>글 번호</th>
                                <th>판매글 번호</th>
                                <th>신고 제목</th>
                                <th>신고 유저</th>
                                <th>신고 날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <td colspan="5">접수된 신고가 없습니다.</td>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${not empty list }">
                    <table class="tablelist">
                        <thead>
                            <tr>
                                <th>글 번호</th>
                                <th>판매글 번호</th>
                                <th>신고 제목</th>
                                <th>신고 유저</th>
                                <th>신고 날짜</th>
                            </tr>
                        </thead>
                        <c:forEach var="report" items="${list }">
                            <tr id="trId_${report.report_num}">
                                <td>${report.report_product_num}</td>
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
                                <td>${report.report_writer_id}</td>
                                <td>${report.report_date}</td>
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
