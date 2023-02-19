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
</script>
<body>

		<c:import url="../head.jsp"></c:import>
   		 <c:import url="../header.jsp"></c:import>

        <div class="wrap">
            <main class="container">
		<div class="content">
			<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">리뷰 작성하기</h1>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/review/reviewForm" method="post" enctype="multipart/form-data">
			<div class="notice_form_wrap">	
				<div class="notice_box">
						<div class="notice_title">
							<label for="notice_title">
								제목
							</label>
						</div>
						<div class="notice_input">
							<input type="text" name="review_title" id="title" >
						</div>
						<!-- <div class="product_box">
							<div class="product_title">
								<label>
									이미지
								</label>
							</div>
						
							<div class="product_path_wrap">
								<input type="file" name="file" id="file" multiple>
								<label for="file" class="file_label">업로드</label>
							</div>
						</div>
							
						<div class="path_wrap" >
							<img src=""  id="preview" onerror="imgError()"/>
						</div> -->
						<div class="content_wrap">
							<textarea name="review_content" class="notice_w_content"></textarea>
						</div>
				</div>
					</div>
				<div class="notice_box">
					<div class="notice_title">
						<label for="notice_writer_id">
							user id
						</label>
					</div>
					<div class="notice_input">
						<input type="text" name="review_writer" id="title" value="${user_id}" readonly>
					</div>
				</div>
				<div class="notice_box">
					<div class="notice_title">
						<label for="notice_writer_id">
							product_num
						</label>
					</div>
					<div class="notice_input">
						<input type="text" name="review_product_num" id="title" value="${product_num}" readonly>
					</div>
				</div>
				

			<!-- notice_form_wrap end -->
			
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">작성하기</button>
				 <button class="back_btn" type="button" onClick="history.back();">작성 취소</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
        </div>

		 <c:import url="../footer.jsp"></c:import>
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