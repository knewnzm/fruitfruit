<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프룻프룻 1:1문의 작성</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/helpForm.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
 	$(document).ready(function() {
		$('#file1').change(function() {
			setImageAndFileNameFromFiles(this); //this = <input id="file1">
		});
	});
	function setImageAndFileNameFromFiles(input) {
		if (input.files && input.files[0]) { //input.files = FileList 객체, 파일 선택을 통해 선택한 파일들의 정보를 담고 있음 (배열과 유사한 형태)
			$(".path_wrap").html("");
			$('.file_name_label').html("");
		for(let i=0; i<input.files.length; i++){
			var reader = new FileReader(); //FileReader객체 생성
			reader.readAsDataURL(input.files[i]); //FileReader로 <input>의 fileList[0]을 URL로 읽어들임
			reader.onload = function(e) { //읽는작업이 완료되면 함수실행, e는 reader.onload를 의미
				var image = `<img src = "\${e.target.result}" class="preview">`
				$(".path_wrap").append(image);
				var labelText= `\${input.files[i].name}\n`
				$('.file_name_label').append(labelText);
			}
		}

		}
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
				<form action="${pageContext.request.contextPath}/help/helpForm"
					method="post" enctype="multipart/form-data">
					<div class="help_form_wrap">
						<div class="help_box">
							<div class="help_title">
								<label for="help_type"> 구분 </label>
							</div>
							<div class="help_type">
								<div class="type1">
									<input type="radio" name="help_type" value="1" checked>
									<label for="help_type" class="type_text">회원정보</label>
								</div>
								<div class="type2">
									<input type="radio" name="help_type" value="2"> <label
										for="help_type" class="type_text">상품</label>
								</div>
								<div class="type3">
									<input type="radio" name="help_type" value="3"> <label
										for="help_type" class="type_text">주문</label>
								</div>
								<div class="type4">
									<input type="radio" name="help_type" value="4"> <label
										for="help_type" class="type_text">배송</label>
								</div>
								<div class="type5">
									<input type="radio" name="help_type" value="5"> <label
										for="help_type" class="type_text">기타</label>
								</div>
							</div>
						</div>
						<input type="hidden" name="help_writer_id" value="${user_id }"
							required />
						<div class="help_box">
							<div class="help_title">
								<label for="help_title"> 제목 </label>
							</div>
							<div class="help_input">
								<input type="text" name="help_title" id="title" required />
							</div>
						</div>
						<div class="help_box">
							<div class="help_title">
								<label> 이미지 </label>
							</div>
							<div class="file_name_wrap">
								<label for="help_path" class="file_name_label"></label>
							</div>
							<div class="help_path_wrap">
								<input class="form-control" type="file" name="file1" id="file1"
									accept="image/*" multiple> <label for="file1"
									class="file_label">업로드</label>
							</div>
						</div>
						<div class="path_wrap">
						</div>
						<div class="content_wrap">
							<textarea name="help_content" class="help_w_content"
								placeholder="1:1문의 내용을 입력해주세요." required></textarea>
						</div>
						<!-- help_form_wrap end -->
					</div>
					<div class="submit_wrap">
						<button type="submit" name="submit" id="submit">작성하기</button>
						<button class="back_btn" type="button"
							onclick="location.href='${pageContext.request.contextPath}/help/helpList'">목록으로</button>
					</div>
				</form>
				<!-- content end -->
			</div>
		</main>
	</div>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>