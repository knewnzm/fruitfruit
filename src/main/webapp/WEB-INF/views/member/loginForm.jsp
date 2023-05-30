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
        	 var userLoginId = getCookie("userLoginId");
        	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 쿠키값 없으면 공백.
       	    var userLoginId = getCookie("userLoginId");
       	    $("input[name='user_id']").val(userLoginId); 
       	    
       	    // ID가 있는경우 아이디 저장 체크박스 체크
       	    if($("input[name='user_id']").val() != ""){
       	    	$("#id_keep").attr("checked", true);
       	    }
       	    
       	    // 아이디 저장하기 체크박스 onchange
       	    $("#id_keep").change(function(){
       	    	if($("#id_keep").is(":checked")){  //checked true
       	        	var userLoginId = $("input[name='user_id']").val();
       	            setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
       	         }else{ //checked false
       	         	deleteCookie("userLoginId");
       	        }
       	    });
       	     
       	     
       	     // 아이디 저장하기가  눌린상태에서, ID를 입력한 경우
       	     $("input[name='user_id']").keyup(function(){
       	     	if($("#id_keep").is(":checked")){  //checked true
       	            var userLoginId = $("input[name='user_id']").val();
       	            setCookie("userLoginId", userLoginId, 30); // 30일 동안 쿠키 보관
       	        }
       	    });
       	     
	       	function setCookie(cookieName, value, exdays){
	       	    var exdate = new Date();
	       	    exdate.setDate(exdate.getDate() + exdays);
	       	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	       	    document.cookie = cookieName + "=" + cookieValue;
	       	}
	       	 
	       	function deleteCookie(cookieName){
	       	    var expireDate = new Date();
	       	    expireDate.setDate(expireDate.getDate() - 1);
	       	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	       	}
	       	 
	       	function getCookie(cookieName) {
	       	    cookieName = cookieName + '=';
	       	    var cookieData = document.cookie;
	       	    var start = cookieData.indexOf(cookieName);
	       	    var cookieValue = '';
	       	    if(start != -1){
	       	        start += cookieName.length;
	       	        var end = cookieData.indexOf(';', start);
	       	        if(end == -1)end = cookieData.length;
	       	        cookieValue = cookieData.substring(start, end);
	       	    }
	       	    return unescape(cookieValue);
	       	    
	       	}
       	
	       	/* 로그인 하기 */
            $("#login_btn").click(function () {
                if ($("#user_id").val() == "") {
                    $("#msg").html("이메일을 입력해주세요.");
                } else if ($("#user_pwd").val() == "") {
                	$("#msg").html("패스워드를 입력해주세요."); ;
                } else {
                    var user_id = $("#user_id").val();
                    var user_pwd = $("#user_pwd").val();
                    $.ajax({
                        url: "/member/loginChk",
                        type: "post",
                        data: { user_id, user_pwd },
                        success: function (data) {
                            if (data.res == "fail") {
                            	$("#msg").html("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
                            } else {
                                $("form").submit();
                            }
                        },
                    });
                }
            });
        });
        
        
        </script>
    </head>
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
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
							<input type="text" name="user_id" id="user_id"  placeholder="아이디를 입력해주세요." required/>
						</div>
						<div class="pwd_line">
							<div class="login_icon">
								<img src="${pageContext.request.contextPath}/static/img/login_padlock.png" class="login_img">
							</div>
							<input type="password" name="user_pwd" id="user_pwd"  placeholder="비밀번호를 입력해주세요." required/>
						</div>
					</div>
					<span id="msg" class="my-3 py-2 msg"></span>
					<div class="login_option">
						<div class="keep_wrap">
							<input type="checkbox"  id="id_keep" name="id_keep" value="off">
								<label for="id_keep" class="keep_text">
									아이디 저장
								</label>
						</div>
						<div class="login_find">
							<ul class="find_inner" id="find_inner">
								<li><a target="_parent" href="${pageContext.request.contextPath }/member/findId" class="find_text" >아이디 찾기</a></li> |
								<li><a target="_parent" href="${pageContext.request.contextPath }/member/findPwd" class="find_text">비밀번호 찾기</a></li>
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
				<div class="join_wrap">
					<button type="button" id="join_btn"  id="join_btn" 
						onclick="location.href='/member/joinForm'">
						<span class="join_btn_text">회원가입</span>
					</button>
				</div>
				<div class="social_wrap">
					<div class="social_login">

									<a href="https://kauth.kakao.com/oauth/authorize?client_id=f98b949e06b7e0104ec9a748fdd44138&redirect_uri=	
http://localhost:8081/kakao_callback&response_type=code">
										<i class="icon_kakao"></i>
											<img src="${pageContext.request.contextPath}/static/img/kakao_login_large_wide.png" class="social_icon"><br>
									</a>

					</div>
				<!-- social end -->
				</div>
			  </div>	
			</form>
		</div>
		<!-- content end -->
	</main>
<!-- wrap end -->
</div>
<c:import url="../footer.jsp"></c:import>
</body>
</html>
