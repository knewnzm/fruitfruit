
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
$('input[name="notice_path"]').change(function(){
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

<link rel="stylesheet" href="/static/css/product_list.css" />

<body>
	<c:import url="../head.jsp"></c:import>
	<c:import url="../header.jsp"></c:import>
	

		<div class="container">
			<div class="content">
				<div class="title_wrap">
					<div>					
						<h1 class="main_text">리뷰 작성</h1>
					</div>
				</div>
				
				<form id="reviewForm" action="${pageContext.request.contextPath}/review/reviewForm" method="post" enctype="multiple">
					<div class="review_form_wrap">		
						<div class="review_box">
							<div class="reivew_title">
								<label for="review_title">
									제목
								</label>
							</div>
						
							<div class="review_input">
								<input type="text" name="review_title" id="title" >	<!--1 -->
							</div>
						</div>
						
						<div class="review_box">
							<div class="review_title">
								<label>
									이미지
								</label>
							</div>
						
							<div class="review_path_wrap">
								<input type="file" name="review_path" id="review_path" multiple>
								<label for="review_path" class="file_label">업로드</label>
							</div>
						</div>
							
						<div class="path_wrap" >
							<img src=""  id="preview" onerror="imgError()"/>
						</div>
				
						
						<div class="content_wrap">
							<label for="review_quantity">
								상세내용
							</label>
							<textarea name="review_content" class="review_content"></textarea>	<!--6 -->
						</div>
						
			<!-- notice_form_wrap end -->
					</div>
					
					<div class="submit_wrap">
						 <button type="submit" name="submit" id="submit">작성하기</button>
					</div>
					
			</form>
		<!-- content end -->
		</div>	
	</div>

	
		 <c:import url="../footer.jsp"></c:import>
	
</body>
</html>