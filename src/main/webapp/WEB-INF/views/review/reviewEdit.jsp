<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeForm</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reviewForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
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
    <header>
		<c:import url="../head.jsp"></c:import>
   		 <c:import url="../header.jsp"></c:import>
	</header>
        <div class="wrap">
            <main class="container">
		<div class="content">
			<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">리뷰 수정하기</h1>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/review/reviewEdit" method="post" enctype="multipart/form-data">
			<div class="notice_form_wrap">	
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
						<label for="notice_writer_id">
							user id
						</label>
					</div>
					<div class="notice_input">
						<input type="text" name="notice_title" id="title" value="${writer_id}" readonly>
					</div>
				</div>
				<div class="content_wrap">
					<textarea name="notice_content" class="notice_w_content"></textarea>
				</div>
			<!-- notice_form_wrap end -->
			</div>
			<div class="submit_wrap">
                <button type="submit" name="submit" id="submit">수정하기</button>
				<button class="back_btn" type="button" onClick="history.back();">작성 취소</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
        </div>
	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

>>>>>>> refs/remotes/daegyu/daegyu
</body>
</html>