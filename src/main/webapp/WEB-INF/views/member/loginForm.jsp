<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<<<<<<< HEAD
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<<<<<<< HEAD
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/loginForm.css" />
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
=======
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
 <head>
 <title>notice List</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/loginForm.css" />
<<<<<<< HEAD
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
=======
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
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
<<<<<<< HEAD
=======
<div class="wrap">
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
	<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<div class="wrap">
	<main id="cantainer" class="container">
		<div id="content" class="content">
			<div class="login_wrap">
				<div class="logo">
					<a><img src="${pageContext.request.contextPath}/static/img/frLogo.png" class="fruit_Logo"></a> 
				</div>
				<form name="K" action="${pageContext.request.contextPath}/member/login" method="post">
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
<<<<<<< HEAD
<<<<<<< HEAD
					<span id="msg" class="my-3 py-2 msg">아이디 비번 공백 확인 메시지</span>
=======
					<span id="msg" class="my-3 py-2 msg"></span>
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
=======
					<span id="msg" class="my-3 py-2 msg"></span>
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
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
<<<<<<< HEAD
<<<<<<< HEAD
						<button type="button" id="login_btn" >
=======
						<button type="button" id="login_btn">
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
=======
						<button type="button" id="login_btn">
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
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
<<<<<<< HEAD
			</form>
=======
				</form>
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
			</div>
		<!-- content end -->
		</div>
	</main>
<<<<<<< HEAD
<<<<<<< HEAD
	<footer>
		<%-- <c:import url="../footer.jsp"></c:import> --%>
	</footer>
=======
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
=======
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
<!-- wrap end -->
</div>
	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
</body>
=======
        <title>sadaRe: 사다리 - 로그인</title>
        <c:import url="../head.jsp"></c:import>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member_loginForm.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/member_msg.css" />
        <script>
            const re = document.location.href.split("?")[0];
            const re2 = document.location.href.split(re)[1];
            $(document).ready(function () {
                if (re !== undefined) {
                    // refer값이 있으면
                    document.getElementById("ref").value = re2;
                }
                $("#login").click(function () {
                    if ($("#user_id").val() == "") {
                        document.getElementById("msg").innerHTML = "아이디를 입력해주세요.";
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
        <c:import url="../header.jsp"></c:import>
        <section class="py-5">
            <div class="container">
                <div class="py-3">
                    <h1>로그인</h1>
                </div>
                <form action="${pageContext.request.contextPath}/member/login" method="post">
                    <div class="col-md-5 my-2">
                        <input type="text" class="my-3 py-2 form-control" name="user_id" id="user_id" placeholder="ID" />
                        <input type="password" class="my-3 py-2 form-control" name="user_pwd" id="user_pwd" placeholder="PASSWORD" />
                        <span id="msg" class="my-3 py-2 msg"> </span>
                        <button type="button" id="login" class="btn btn-success py-2">로그인하기</button>
                    </div>
                    <input type="hidden" name="refer" id="ref" />
                </form>
                <a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>
                <a href="${pageContext.request.contextPath}/member/findPwd">비밀번호 찾기</a>
            </div>
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
>>>>>>> origin/jeongmin
</html>
