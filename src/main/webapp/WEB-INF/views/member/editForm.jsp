<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>edit form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editForm.css" />
</head>
<body>
<div class="wrap">
	<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
	<main class="container">
		<div id="content" class="content">
			<div class="main_title_box">
				<h1 class="main_title">회원정보 수정</h1>
			</div>
			<div class="line">
				<hr>
			</div>
			<%-- <form name="E" action="${pageContext.request.ContextPath }/member/edit" action="post"> --%>
			<div class="edit_wrap">
				<div class="edit_content">
					<div class="edit_box">
						<div class="type_wrap">
							<div class="edit_title">
								<label for="user_type">
									회원 구분
								</label>
							</div>
							<div class="edit_readonly">
								<input type="text" name="user_type" id="user_type" value="${ m.user_type}" readonly>
							</div>
						</div>
					</div>	
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_id">
									아이디
								</label>
						</div>
						<div class="edit_readonly">
							<input type="text" name="user_id" id="user_id" value="${m.user_id }" readonly>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title" >
							<label for="user_pwd" id="pwd_title">
								비밀번호
							</label>
						</div>
						<div class="edit_pwd_wrap">
							<div class="edit_pwd">
								<div class="edit_input">
									<input type="password" name="user_pwd" id="pwd_input1">
								</div>
							</div>
							<div class="pwd_check_wrap">
								<div class="check_box">
									<input type="password" name="pwd_check">
								</div>
								<div class="check_text_box">
									<span class="pwd_check_text">비밀번호 확인 문구 들어갈 자리</span>
								</div>
							</div>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_name">
								이름
							</label>
						</div>
						<div class="edit_readonly">
							<input type="text" name="user_name" id="user_name"  value="${m.user_name }" readonly>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_nick">
								닉네임
							</label>
						</div>
						<div class="edit_input">
							<input type="text" name="user_nick" id="user_nick"  value="${m.user_nick }">
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_tel">
								전화번호
							</label>
						</div>
						<div class="edit_input">
							<input type="text" name="user_tel" id="user_tel"  value="${m.user_tel }">
						</div>
					</div>
					<div class="edit_box">
						<div class="addr_wrap">
							<div class="addr_top_wrap">
								<div class="edit_title">
									<label for="user_addr">
										우편번호
									</label>	
								</div>
								<div class="addr_postcode">
									<input type="text" name="user_postcode" id="user_postcode" value="${m.user_postcode }">
								</div>
								<div class="addr_btn">
									<button class="addr_search_btn" name="addr_search_btn" >
										<span class="search_text">주소 검색</span>
										<img src="${pageContext.request.contextPath}/static/img/join_edit_search.png" class="search_img">
									</button>	
								</div>
							</div>
							<div class="addr_wrap1">
								<input type="text" name="user_addr1" id="user_addr1"  value="${m.user_addr1 }">
							</div>
							<div class="addr_wrap2">
								<input type="text" name="user_addr2" id="user_addr2"  value="${m.user_addr2 }">
							</div>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_account">
								계좌번호
							</label>
						</div>
						<div class="account_select">
							<select name="user_bank" id="user_bank" class="user_bank" onchange="selectBoxChange(this.value);">
								<option value="1">국민은행
								<option value="2">우리은행
								<option value="3">농협은행
								<option value="4">신한은행
								<option value="5">기업은행
								<option value="6">KEB 하나은행
								<option value="7">외환은행
								<option value="8">제일은행
								<option value="9">한국시티은행
								<option value="10">카카오뱅크
								<option value="11">케이뱅크
							</select>
						</div>
						<div class="account_input">
							<input type="text" name="user_account" id="user_account" value="${m.user_account }">
						</div>
					</div>
					<div class="submit_wrap">
						<input type="submit" name="submit" id="submit" value="수정하기">
						<button type="button" class="del_btn">탈퇴하기</button>
					</div>
				<!-- ↓edit content -->	
				</div>
			<!-- edit wrap -->
			</div>
	<!-- 	</form>	 -->
		<!-- content -->
		</div>
	</main>
	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
<!-- wrap end -->
</div>
</body>
</html>
