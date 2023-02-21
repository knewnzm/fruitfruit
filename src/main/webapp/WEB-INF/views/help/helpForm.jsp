<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프룻프룻  1:1문의 작성</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* 엔터 submit 방지,  keyCode 13은 enter를 의미 */
$('input[type="text"]').keydown(function () { 
    if (event.keyCode === 13) { 
        event.preventDefault();
    }
});
/* 파일 */
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
}
</script>
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<div class="wrap">
  <main class="container">
		<div class="content">
			<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">1:1 문의글 작성</h1>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/help/helpForm" method="post" enctype="multipart/form-data">
			<div class="help_form_wrap">
				<div class="help_box">
						<div class="help_title">
							<label for="help_type">
								구분
							</label>
						</div>
						<div class="help_type">
								<div class="type1">
									<input type="radio" name="help_type"  value="1" checked > 
										<label for="help_type" class="type_text">회원정보</label>
								</div>
								<div class="type2">
									<input type="radio" name="help_type"  value="2" > 
										<label for="help_type" class="type_text">상품</label>
								</div>
								<div class="type3">
									<input type="radio" name="help_type"  value="3"> 
										<label for="help_type" class="type_text">주문</label>
								</div>
								<div class="type4">
									<input type="radio" name="help_type"  value="4"> 
										<label for="help_type" class="type_text">배송</label>
								</div>
								<div class="type5">
									<input type="radio" name="help_type"  value="5"> 
										<label for="help_type" class="type_text">기타</label>
								</div>
						</div>
				</div>
				<input type="hidden" name="help_writer_id" value="${user_id }" required/>		
				<div class="help_box">
						<div class="help_title">
							<label for="help_title">
								제목
							</label>
						</div>
						<div class="help_input">
							<input type="text" name="help_title" id="title" required/>
						</div>
					</div>
				<div class="help_box">
					<div class="help_title">
						<label>
							이미지
						</label>
					</div>
					<div class="file_name_wrap">
						<label for="help_path" class="file_name_label"></label>
					</div>
					<div class="help_path_wrap">
						<input class="form-control" type="file" name="file1" id="file1" accept="image/*"  multiple>
							<label for="file1" class="file_label">업로드</label>
					</div>
				</div>
				<div class="path_wrap" >
						<img src=""  id="preview" style="display:none"/>
				</div>
				<div class="content_wrap">
					<textarea name="help_content" class="help_w_content"  placeholder="1:1문의 내용을 입력해주세요." required></textarea>
				</div>
			<!-- help_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">작성하기</button>
				 <button class="back_btn" type="button" onclick="location.href='${pageContext.request.contextPath}/help/helpList'">목록으로</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
</div>
<c:import url="../footer.jsp"></c:import>
</body>
</html>