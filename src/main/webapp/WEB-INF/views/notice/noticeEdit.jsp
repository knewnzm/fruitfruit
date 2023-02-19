<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<<<<<<< HEAD
<title>프룻프룻
       	  <c:if test="${n.notice_type ==1}"> 공지사항 </c:if>
          <c:if test="${n.notice_type ==2}"> 이벤트 </c:if> 
          수정
		   | ${n.notice_title} 
</title>		   
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<div class="nwrap">
    <main class="container">
		<div class="content">
			<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">공지사항/이벤트 게시글 수정</h1>
				</div>
			</div>
			<form name="" action="${pageContext.request.contextPath }/notice/Edit" method="post">
			<input type="hidden" name="notice_num" value="${n.notice_num }" >
			<div class="notice_form_wrap">
				<div class="notice_box">
						<div class="notice_title">
							<label for="notice_type">
								구분
							</label>
						</div>
						<div class="notice_type">
						<c:if test="${n.notice_type==1 }">
								<c:set var="type1">checked</c:set>
								</c:if>
								<c:if test="${n.notice_type==2 }">
								<c:set var="type2">checked</c:set>
								</c:if>
								<div class="type1">								
									<input type="radio" name="notice_type"  value="1" ${type1}> 
										<label for="notice_type" class="type_text">공지</label>
								</div>
								<div class="type2">
									<input type="radio" name="notice_type"  value="2" ${type2}> 
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
							<input type="text" name="notice_title" id="title" value="${n.notice_title }" required>
						</div>
					</div>
				
				<div class="content_wrap">
					<textarea name="notice_content" class="notice_w_content" required>${n.notice_content }</textarea>
				</div>
			<!-- notice_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">수정하기</button>
				 <button class="back_btn" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList'">목록으로</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
</div>
<c:import url="../footer.jsp"></c:import>
</body>
</html>
=======
<title>notice_edit</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
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
					<h1 class="main_text">공지사항/이벤트 게시글 수정</h1>
				</div>
			</div>
			<form name="" action="" method="post" enctype="multiple">
			<div class="notice_form_wrap">
				<div class="notice_box">
						<div class="notice_title">
							<label for="notice_type">
								구분
							</label>
						</div>
						<div class="notice_type">
								<div class="type1">
									<input type="radio" name="notice_type"  value="1" <c:if test="${n.notice_type==1}">checked</c:if>> 
										<label for="notice_type" class="type_text">공지</label>
								</div>
								<div class="type2">
									<input type="radio" name="notice_type"  value="2" <c:if test="${n.notice_type==1}">checked</c:if>> 
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
						<input type="file" name="notice_path" id="notice_path" multiple>
							<label for="notice_path" class="file_label">업로드</label>
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
				 <button type="submit" name="submit" id="submit">수정하기</button>
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
>>>>>>> refs/remotes/daegyu/daegyu
