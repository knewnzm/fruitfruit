<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프룻프룻 1:1문의 수정 | ${h.help_title} </title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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
			<form action="${pageContext.request.contextPath }/help/Edit" method="post">
			<input type="hidden" name="help_num" value="${h.help_num }"  required>
			<div class="help_form_wrap">
				<div class="help_box">
						<div class="help_title">
							<label for="help_type">
								구분
							</label>
						</div>
						<div class="help_type">
								<div class="type1">
									<input type="radio" name="help_type"  value="1" <c:if test="${h.help_type==1}">checked</c:if>> 
										<label for="help_type" class="type_text">회원정보</label>
								</div>
								<div class="type2">
									<input type="radio" name="help_type"  value="2" <c:if test="${h.help_type==2}">checked</c:if>> 
										<label for="help_type" class="type_text">상품</label>
								</div>
								<div class="type3">
									<input type="radio" name="help_type"  value="3" <c:if test="${h.help_type==3}">checked</c:if>> 
										<label for="help_type" class="type_text">주문</label>
								</div>
								<div class="type4">
									<input type="radio" name="help_type"  value="4" <c:if test="${h.help_type==4}">checked</c:if>> 
										<label for="help_type" class="type_text">배송</label>
								</div>
								<div class="type5">
									<input type="radio" name="help_type"  value="5" <c:if test="${h.help_type==5}">checked</c:if>> 
										<label for="help_type" class="type_text">기타</label>
								</div>
						</div>
				</div>		
				<div class="help_box">
						<div class="help_title">
							<label for="help_title">
								제목
							</label>
						</div>
						<div class="help_input">
							<input type="text" name="help_title" id="title"  value="${h.help_title }" required>
						</div>
					</div>
				<div class="content_wrap">
					<textarea name="help_content" class="help_w_content"  required>${h.help_content }</textarea>
				</div>
			<!-- help_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">수정하기</button>
				 <button class="back_btn" type="button" onClick="history.back();">돌아가기</button>
			</div>
			</form>
		<!-- content end -->
		</div>	
	</main>
</div>
<c:import url="../footer.jsp"></c:import>
</body>
</html>