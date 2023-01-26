<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/loginForm.css" />
    </head>
    <body>
<div class="wrap">
	<header>
		<h3>헤더 입니다</h3>
	</header>
	<main id="cantainer" class="container">
		<div id="content" class="content">
			<div class="login_wrap">
				<div class="logo">
					<a> 
					<img src="${pageContext.request.contextPath}/static/image/Logo.png" class="fruit_Logo"></a> 
				</div>
				<form name="K" action="${pageContext.request.contextPath}/member/login" method="post">
				<!-- login -->
				<div class="login_panner">
					<div class="login_box">
						<div class="id_line">
							<div class="login_icon">
								<img src="${pageContext.request.contextPath}/static/image/user.png" class="login_img">
							</div>
							<input type="text" name="user_id" id="user_id"  placeholder="아이디를 입력해주세요.">
						</div>
						<div class="pwd_line">
							<div class="login_icon">
								<img src="${pageContext.request.contextPath}/static/image/padlock.png" class="login_img">
							</div>
							<input type="password" name="user_pwd" id="user_pwd"  placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<div class="login_option">
						<div class="keep_wrap">
							<input type="checkbox"  id="id_keep" name="id_keep" value="off">
								<label for="id_keep" class="keep_text">
									로그인 상태 유지
								</label>
						</div>
						<div class="login_find">
							<ul class="find_inner" id="find_inner">
								<li><a target="_parent" href="" class="find_text">아이디 찾기</a></li> |
								<li><a target="_parent" href="" class="find_text">비밀번호 찾기</a></li>
							</ul>
						</div>
					</div>
					<div class="login_btn_wrap">
						<button type="submit" id="login_btn"  id="login_btn" >
							<span class="login_btn_text">로그인</span>
						</button>
					</div>
				</div>
				<!-- login end -->
				</form>
				<div class="join_wrap">
					<button type="button" id="join_btn"  id="join_btn" 
						onclick="location.href='joinForm.jsp'">
					<!-- 	onclick="location.href='{pageContext.request.contextPath }/member/joinForm.jsp'"> -->
						<span class="join_btn_text">회원가입</span>
					</button>
				</div>
				<div class="social_wrap">
					<div class="social_login">
						<ul class="social_inner" id="social_inner">
								<li class="social_btn">
									<a href="" onclick="" >
										<i class="icon_naver"></i>
											<img src="${pageContext.request.contextPath}/static/image/naver_icon.png" class="social_icon"><br>
												<span class="social_text">네이버</span>
									</a>
								</li>
								<li class="social_btn">
									<a href="kakaotalk.png" onclick="" >
										<i class="icon_kakao"></i>
											<img src="${pageContext.request.contextPath}/static/image/kakaotalk_icon.png" class="social_icon"><br>
												<span class="social_text">카카오</span>
									</a>
								</li>
								<li class="social_btn">
									<a href="" onclick="" >
										<i class="icon_google"></i>
											<img src="${pageContext.request.contextPath}/static/image/google_icon.png"  class="social_icon"><br>
										<span class="social_text">구글</span>
									</a>
								</li>
							</ul>
					</div>
				<!-- social end -->
				</div>
			<!-- login_wrap -->
			</div>
		<!-- content -->
		</div>
	</main>
	<footer>
		<h3>footer 자리 입니다</h3>
	</footer>
<!-- wrap end -->
</div>
</body>
</html>
