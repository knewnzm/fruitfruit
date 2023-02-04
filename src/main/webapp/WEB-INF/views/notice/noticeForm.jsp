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
<<<<<<< HEAD
$(document).ready(function(){
    $('input[name="file1"]').change(function(){
        setImageAndFileNameFromFile(this);
    });
});

function setImageAndFileNameFromFile(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
        $('.file_name_label').text(input.files[0].name);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
window.onload = function(){
	document.getElementById("file1").addEventListener("change", function(event){
		var preview = document.getElementById("preview");
		var file = event.target.files[0];
		var reader = new FileReader();
		
		reader.onload = function(){
			preview.src = reader.result;
			preview.style.display = "block";
		};
		if(file){
			reader.readAsDataURL(file);
		}else{
			preview.style.display = "none";
		}
	});
=======
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
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
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
<<<<<<< HEAD
					<div class="file_name_wrap">
						<label for="notice_path" class="file_name_label"></label>
					</div>
					<div class="notice_path_wrap">
						<input class="form-control" type="file" name="file1" id="file1" accept="image/*"  multiple>
=======
					<div class="notice_path_wrap">
					<input class="form-control" type="file" name="file1" id="file1" accept="image/*" />
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
							<label for="file1" class="file_label">업로드</label>
					</div>
				</div>
				<div class="path_wrap" >
<<<<<<< HEAD
						<img src=""  id="preview" style="display:none"/>
=======
						<img src=""  id="preview" onerror="imgError()"/>
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
				</div>
				<div class="content_wrap">
					<textarea name="notice_content" class="notice_w_content"></textarea>
				</div>
			<!-- notice_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">작성하기</button>
<<<<<<< HEAD
				 <button class="back_btn" type="button" onClick="history.back();">목록으로</button>
=======
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
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
