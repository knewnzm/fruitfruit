<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>noticeForm</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$('input[name="file1"]').change(function(){
    setImageFromFile(this, '#preview');
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
    $(expression).attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
}
</script>
<body>
    <header>
		<c:import url="../head.jsp"></c:import>
   		 <c:import url="../header.jsp"></c:import>
	</header>
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
					<div class="notice_path_wrap">
					<input class="form-control" type="file" name="file1" id="file1" accept="image/*" />
							<label for="file1" class="file_label">업로드</label>
					</div>
				</div>
				<div class="path_wrap" >
						<img src=""  id="preview" onerror="imgError()"/>
				</div>
				<div class="content_wrap">
					<textarea name="notice_content" class="notice_w_content"></textarea>
				</div>
			<!-- notice_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">작성하기</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
        </div>
	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
</body>
</html>
