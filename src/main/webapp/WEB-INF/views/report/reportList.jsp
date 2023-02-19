<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8" />
            <title>fruitfruit 신고 관리 페이지</title>
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/report.css">
            <c:import url="../head.jsp"></c:import>
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
                            <tr >
                                <th>글 번호</th>
                                <th>판매글 번호</th>
                                <th>신고 제목</th>
                                <th>신고 유저</th>
                                <th>신고 날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="report" items="${list }">
                            <tr id="trId_${report.report_num}">
                                <td>${report.report_num}</td>
                                <td>${report.product_num}</td>
                                <td> <!-- 신고제목 누를 경우 내용 모달창으로 뜸 -->
                                    <button class="open-modal-btn" data-report-num="${report.report_num}"
                                        sytle="cursor:pointer;" type="button">${report.report_title}</button>
                                </td>
                                <td>${report.report_writer_id}</td>
                                <td>${report.report_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    </table>
                </c:if>
                <!-- </form> -->
            </div>
            <c:import url="../footer.jsp"></c:import>

            <!-- 신고 상세 내용 + 삭제하기 -->
            <c:forEach var="report" items="${list}">
                <div class="modal mhidden" id="report_${report.report_num}">
                    <div class="modalForm">
                        <div class="modal-main">
                            <label for="rtitle" class="label">신고 사유</label>
                            <input id="rtitle" type="text" class="input" name="report_title"
                                value="${report.report_title }" readonly>
                            <label for="rcontent" class="label">신고 상세 내용</label>
                            <textarea id="rcontent" name="report_content" class="input"
                                readonly>${report.report_content }</textarea>
                        </div>
                        <div class="modal-footer">
                            <button id="close-modal" type="button">닫기</button>
                            <button id="del_content${report.report_num}" class="btn btn-danger"
                            type="button" num="${report.report_num}">삭제하기</button>
                        </div>
                    </div>
                </div>
            </c:forEach>


            <script type="text/javascript">

                const body = document.querySelector('body');
                const modal = document.querySelectorAll('.modal');
                const modalBtns = document.querySelectorAll('.open-modal-btn');

                // 모달을 닫기 위한 요소를 선택
                const closeBtns = document.querySelectorAll('#close-modal');

                // 모달 요소들을 선택
                const modalEls = document.querySelectorAll('.modal');

                // 버튼을 누르면 해당 모달을 띄우는 함수
                function openModal(reportNum) {
                    const modalId = "#report_" + reportNum;
                    const modal = document.querySelector(modalId);
                    modal.classList.toggle('show');
                    if (modal.classList.contains('show')) {
                        body.style.overflow = 'hidden';
                    }

                }


                // 닫기 버튼을 누르면 모달을 닫는 함수
                function closeModal() {
                    modalEls.forEach((modal) => {
                        modal.classList.remove('show');
                        body.style.overflow = 'auto';
                    });
                }

                // 각 버튼을 누를 때 이벤트를 등록
                modalBtns.forEach((btn) => {
                    const reportNum = btn.dataset.reportNum;
                    btn.addEventListener('click', () => {
                        openModal(reportNum);
                    });
                });

                // 각 닫기 버튼을 누를 때 이벤트를 등록
                closeBtns.forEach((btn) => {
                    btn.addEventListener('click', () => {
                        closeModal();
                    });
                });

            // 삭제 버튼
            $(document).on("click", "button[class='btn btn-danger']", function (e) {
                e.preventDefault(e);
                const p_num = $(this).attr("num");
                const a = {};
                a["report_num"]= p_num;
                if (confirm("삭제하시겠습니까?")) {
                    document.getElementById("trId_" + p_num).remove();
                    $.ajax({
                        type: "post",
                        url: "/report/delete",
                        data: a,
                        success: function (data) {
                            alert("삭제되었습니다.");
                           
                        },
                    });
                } else {
                    alert("취소되었습니다.");
                }
                closeModal();
            });

            </script>
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
>>>>>>> refs/remotes/daegyu/daegyu
