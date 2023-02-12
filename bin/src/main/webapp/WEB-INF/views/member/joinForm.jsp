<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>join form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/join.css" />
</head>
<body>
<div class="wrap">
	<header>
		<h3>헤더 입니다</h3>
	</header>
	<main class="container">
		<div id="content" class="content">
			<div class="main_text">
				<h1 class="main_title">회원가입</h1>
			</div>
			<div class="line">
				<hr>
			</div>
			<div class="join_wrap">
				<div class="join_content">
					<div class="join_box">
						<div class="type_wrap">
							<div class="join_title">
								<label for="user_type">
									회원 구분
								</label>
							</div>
							<div class="join_type">
								<div class="type1">
									<input type="checkbox" name="user_type" id="user_type" value="1"> 
										<label for="user_type" class="type_text">관리자</label>
								</div>
								<div class="type2">
									<input type="checkbox" name="user_type" id="user_type" value="2"> 
										<label for="user_type" class="type_text">일반</label>
								</div>
								<div class="type3">
									<input type="checkbox" name="user_type" id="user_type" value="3"> 
										<label for="user_type" class="type_text">판매자</label>
								</div>
							</div>
						</div>
					</div>
					<div class="join_box">
						<div class="join_id_wrap">
							<div class="join_id">
								<div class="join_title">
									<label for="user_id">
										아이디
									</label>
								</div>
								<div class="join_input">
									<input type="text" name="user_id" id="user_id"  placeholder="아이디를 입력해주세요.">
								</div>
								<div class="join_btn">
									<button class="id_check_btn" name="id_check_btn" >
										<span class="btn_text">
											중복확인
										</span>
									</button>
									</div>
							</div>
							<div class="id_check_box">
								<span class="id_check_text">중복확인 문구 들어갈 자리</span>
							</div>
						</div>
					</div>
					<div class="join_box">
						<div class="join_title">
							<label for="user_pwd">
								비밀번호
							</label>
						</div>
						<div class="join_input">
							<input type="text" name="user_pwd" id="user_pwd"  placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<div class="join_box">
						<div class="join_title">
							<label for="user_name">
								이름
							</label>
						</div>
						<div class="join_input">
							<input type="text" name="user_name" id="user_name"  placeholder="이름을 입력해주세요.">
						</div>
					</div>
					<div class="join_box">
						<div class="join_title">
							<label for="user_nick">
								닉네임
							</label>
						</div>
						<div class="join_input">
							<input type="text" name="user_nick" id="user_nick"  placeholder="닉네임을 입력해주세요.">
						</div>
					</div>
					<div class="join_box">
						<div class="join_title">
							<label for="user_tel">
								전화번호
							</label>
						</div>
						<div class="join_input">
							<input type="text" name="user_tel" id="user_tel"  placeholder="숫자만 입력해주세요.">
						</div>
					</div>
					<div class="join_box">
						<div class="addr_wrap">
							<div class="addr_top_wrap">
								<div class="join_title">
									<label for="user_addr">
										우편번호
									</label>	
								</div>
								<div class="addr_postcode">
									<input type="text" name="user_postcode" id="user_postcode"  placeholder="우편번호">
								</div>
								<div class="addr_btn">
									<button class="addr_search_btn" name="addr_search_btn" >
										<span class="search_text">주소 검색</span>
										<img src="search.png" class="search_img">
									</button>	
								</div>
							</div>
							<div class="addr_wrap1">
								<input type="text" name="user_addr1" id="user_addr1"  placeholder="도로명 주소">
							</div>
							<div class="addr_wrap2">
								<input type="text" name="user_addr2" id="user_addr2"  placeholder="상세항목">
							</div>
						</div>
					</div>
					<div class="join_box">
						<div class="join_title">
							<label for="user_account">
								계좌번호
							</label>
						</div>
						<div class="account_select">
							<select name="user_bank" id="user_bank" class="user_bank">
								<option value="국민은행">국민은행
								<option value="우리은행">우리은행
								<option value="농협은행">농협은행
								<option value="신한은행">신한은행
								<option value="기업은행">기업은행
								<option value="하나은행">KEB 하나은행
								<option value="외한은행">외환은행
								<option value="제일은행">제일은행
								<option value="시티은행">한국시티은행
								<option value="카카오뱅크">카카오뱅크
								<option value="케이뱅크">케이뱅크
							</select>
						</div>
						<div class="account_input">
							<input type="text" name="user_account" id="user_account" placeholder="계좌번호를 입력해주세요.">
						</div>
					</div>
					<div class="submit_wrap">
						<input type="submit" name="submit" id="submit" value="가입하기">
					</div>
				<!-- join content -->	
				</div>
			<!-- join wrap -->
			</div>	
		<!-- content -->
		</div>
	</main>
	<footer>
		<h1>footer 입니다</h1>
	</footer>
<!-- wrap end -->
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</html>
