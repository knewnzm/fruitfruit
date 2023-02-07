<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>notice List</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/loginForm.css" />
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript">
        $(document).ready(function () {
            $("#login_btn").click(function () {
                if ($("#user_id").val() == "") {
                    document.getElementById("msg").innerHTML = "이메일을 입력해주세요.";
                } else if ($("#user_pwd").val() == "") {
                    document.getElementById("msg").innerHTML = "패스워드를 입력해주세요.<br>";
                } else {
                    id = $("#user_id").val();
                    pwd = $("#user_pwd").val();
                    $.ajax({
                        url: "/member/loginChk",
                        type: "post",
                        data: { id, pwd },
                        success: function (data) {
                            if (data.res == "fail") {
                                document.getElementById("msg").innerHTML = "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.<br>";
                            } else {
                                $("form").submit();
                                /* location.href="/member/joinForm"; */
                            }
                        },
                    });
                }
            });
        });
        </script>
    </head>
<body>
	<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<div class="wrap">
	<main id="cantainer" class="container">
		<div id="content" class="content">
				<form name="K" action="${pageContext.request.contextPath}/member/login" method="post">
			<div class="login_wrap">
				<div class="logo">
					<a><img src="${pageContext.request.contextPath}/static/img/frLogo.png" class="fruit_Logo"></a> 
				</div>
					<!-- login -->
					<div class="login_panner">
					<div class="login_box">
						<div class="id_line">
							<div class="login_icon">
								<img src="${pageContext.request.contextPath}/static/img/login_user.png" class="login_img">
							</div>
							<input type="text" name="user_id" id="user_id"  placeholder="아이디를 입력해주세요.">
						</div>
						<div class="pwd_line">
							<div class="login_icon">
								<img src="${pageContext.request.contextPath}/static/img/login_padlock.png" class="login_img">
							</div>
							<input type="password" name="user_pwd" id="user_pwd"  placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<span id="msg" class="my-3 py-2 msg"></span>
					<div class="login_option">
						<div class="keep_wrap">
							<input type="checkbox"  id="id_keep" name="id_keep" value="off">
								<label for="id_keep" class="keep_text">
									로그인 상태 유지
								</label>
						</div>
						<div class="login_find">
							<ul class="find_inner" id="find_inner">
								<li><a target="_parent" href="" class="find_text">아이디 찾기</a></li> 
								<li><a target="_parent" href="" class="find_text">비밀번호 찾기</a></li>
							</ul>
						</div>
					</div>
					<div class="login_btn_wrap">
						<button type="button" id="login_btn">
							<span class="login_btn_text">로그인</span>
						</button>
					</div>
				</div>
				<!-- login end -->
				</form>
				<div class="join_wrap">
					<button type="button" id="join_btn"  id="join_btn" 
						onclick="location.href='/member/joinForm'">
						<span class="join_btn_text">회원가입</span>
					</button>
				</div>
				<div class="social_wrap">
					<div class="social_login">
						<ul class="social_inner" id="social_inner">
								<li class="social_btn">
									<a href="" onclick="" >
										<i class="icon_naver"></i>
											<img src="${pageContext.request.contextPath}/static/img/login_naver_icon.png" class="social_icon"><br>
												<span class="social_text">네이버</span>
									</a>
								</li>
								<li class="social_btn">
									<a href="kakaotalk.png" onclick="" >
										<i class="icon_kakao"></i>
											<img src="${pageContext.request.contextPath}/static/img/login_kakaotalk_icon.png" class="social_icon"><br>
												<span class="social_text">카카오</span>
									</a>
								</li>
								<li class="social_btn">
									<a href="" onclick="" >
										<i class="icon_google"></i>
											<img src="${pageContext.request.contextPath}/static/img/login_google_icon.png"  class="social_icon"><br>
										<span class="social_text">구글</span>
									</a>
								</li>
							</ul>
					</div>
				<!-- social end -->
				</div>
			</div>
			</form>
		<!-- content end -->
		</div>
	</main>
<!-- wrap end -->
</div>
	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
</body>
</html>
