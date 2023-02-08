<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>''

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>fruitfruit - 신고작성</title>
        <c:import url="../head.jsp"></c:import>
        <script>
            $(document).ready(function () {
                $("#s").click(function (e) {
                    e.preventDefault();
                    //제출할건지 물어보고 확인버튼 클릭시 관리자계정 신고리스트 페이지로 값 보내기
                    var returnValue = confirm("신고리포트를 제출할까요?");
                    if (returnValue == true) {
                        $("#report-form").submit();
                        alert("신고 접수가 완료되었습니다");
                    } else {
                        alert("취소되었습니다");
                    }
                });
            });
        </script>
    </head>
    <body>
        <c:import url="../header.jsp"></c:import>
        <!-- Section-->


        <div class="wrap">
            <main class="container">
		<div class="content">
			<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">공지사항 작성</h1>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/notice/noticeForm" method="post" enctype="multipart/form-data">
			<div class="notice_form_wrap">
				<div class="notice_box">
						<div class="notice_title">
							<label for="notice_type">
								구분
							</label>
						</div>
						<div class="notice_type">
								<div class="type1">
									<input type="radio" name="notice_type"  value="1" checked> 
										<label for="notice_type" class="type_text">공지</label>
								</div>
								<div class="type2">
									<input type="radio" name="notice_type"  value="2"> 
										<label for="notice_type" class="type_text">이벤트</label>
								</div>
						</div>
				</div>		
				<div class="notice_box">
						<div class="notice_title">
							<label for="notice_title">
								제목
							</label>
						</div>
						<div class="notice_input">
							<input type="text" name="notice_title" id="title" >
						</div>
					</div>
				<div class="notice_box">
					<div class="notice_title">
						<label>
							이미지
						</label>
					</div>
					<div class="file_name_wrap">
						<label for="notice_path" class="file_name_label"></label>
					</div>
					<div class="notice_path_wrap">
						<input class="form-control" type="file" name="file1" id="file1" accept="image/*"  multiple>
							<label for="file1" class="file_label">업로드</label>
					</div>
				</div>
				<div class="path_wrap" >
						<img src=""  id="preview" style="display:none"/>
				</div>
				<div class="content_wrap">
					<label for="content" class="form-label">신고사유</label>
                            <textarea
                                class="form-control w-100"
                                id="content"
                                rows="12"
                                name="report_content"
                                placeholder="신고사유를 작성해주세요."
                                required
                            ></textarea>
				</div>
			<!-- notice_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">작성하기</button>
				 <button class="back_btn" type="button" onClick="history.back();">목록으로</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
        </div>











        <section class="py-5">
            <div class="container">
                <div class="py-3">
                    <h1>신고 작성</h1>
                </div>
                <form action="/report/add" method="post" id="report-form">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <h3>신고 제품 : ${p.product_name}</h3>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="email" class="form-control w-100" name="report_title" id="title" placeholder="제목" required />
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">신고사유</label>
                            <textarea
                                class="form-control w-100"
                                id="content"
                                rows="12"
                                name="report_content"
                                placeholder="신고사유를 작성해주세요."
                                required
                            ></textarea>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-danger" type="reset">초기화</button>
                            <button class="btn btn-success" type="submit" id="s">신고</button>
                        </div>
                    </div>
                    <input type="hidden" id="product_num" name="product_num" value="${p.product_num}" />
                </form>
            </div>
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
</html>