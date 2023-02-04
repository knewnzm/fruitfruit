<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<meta charset="UTF-8" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>join form</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/joinForm.css" />
<script type="text/javascript">
$(document).ready(function() {
	var chkid = false;
	
	// 엔터를 눌렀을때 submit 하는 것을 막기
	$('input[type="text"]').keydown(function () { 
        if (event.keyCode === 13) { //keyCode 13은 enter를 의미함
            event.preventDefault(); //기본 설정대로 실행되는것을 막는다는뜻
        }
    });
	
	//아이디 중복체크 여부 검사
	function join() {
        $("#submit").attr("disabled", true); 
        if (chkid) {           
            	$("#submit").attr("disabled", false);            
        }
    }
	
	//아이디 중복 확인
	$(".id_check_btn").click(function() {
		
		$.post( "/member/idCheck", { user_id: $("#user_id").val()} )
	    .done(function( data ) {
	    	$(".id_check_text").text(data);
	  });
	});
	
	//중복체크 여부 확인
	$("#submit").click(function() {		
		if($(".id_check_text").text().trim()=="사용 가능한 이메일입니다"){
			$("form").submit();
		}else{
			alert("id 중복확인을 먼저 완료해주세요");
			return false;
		}
		//빈값 확인
		if ($("#user_pwd").val() == ""||
			$("#user_name").val() == ""||
			$("#user_nick").val() == ""||
			$("#user_tel").val() == ""||
			$("#user_postcode").val() == ""||
			$("#user_addr1").val() == ""||
			$("#user_addr2").val() == ""||
			$("#user_user_bank").val() == ""||
			$("#user_account").val() == "") {
            alert("입력되지 않은 값이 존재합니다 다시 확인해주세요");
            return false;
		}
	});
});
</script>
</head>
<body>
<div class="wrap">
	<header>
		<h3>헤더 입니다</h3>
	</header>
	<main class="container">
		<div id="content" class="content">
			<div class="main_title_box">
				<h1 class="main_title">회원가입</h1>
			</div>
			<div class="line">
				<hr>
			</div>

			<form name="j" action="${pageContext.request.contextPath }/member/joinForm" method="post">
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
									<input type="radio" name="user_type" class="user_type" value="1" checked> 
										<label for="user_type" class="type_text">구매자</label>
								</div>
								<div class="type2">
									<input type="radio" name="user_type" class="user_type" value="2"> 
										<label for="user_type" class="type_text">판매자</label>
								</div>
								<div class="type3">
									<input type="radio" name="user_type" class="user_type" value="3"> 
										<label for="user_type" class="type_text">관리자</label>
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
									<input type="text" name="user_id" id="user_id"  placeholder="이메일을 입력해주세요.">
								</div>
								<div class="join_btn">
									<button class="id_check_btn" type="button" >
										<span class="btn_text">
											중복확인
										</span>
									</button>
									</div>
							</div>
							<div class="id_check_box">
								<span class="id_check_text"></span>
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
							<input type="password" name="user_pwd" id="user_pwd"  placeholder="비밀번호를 입력해주세요.">
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
									<button class="addr_search_btn" type="button" name="addr_search_btn">
										<span class="search_text">주소 검색</span>
										<img src="${pageContext.request.contextPath}/static/image/search.png" class="search_img">
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
							<input type="text" name="user_account" id="user_account" placeholder="계좌번호를 입력해주세요.">
						</div>
					</div>
					<div class="submit_wrap">
						<input type="submit" id="submit" value="가입하기">
					</div>
				<!-- join content -->	
				</div>
			<!-- join wrap -->
			</div>	
		<!-- content -->
		</form>
		</div>
	</main>
	<footer>
		<h1>footer 입니다</h1>
	</footer>
<!-- wrap end -->
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
=======
    <head>
        <meta charset="UTF-8" />
        <title>sadaRe: 사다리 - 회원가입</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <c:import url="../head.jsp"></c:import>
        <link rel="stylesheet" href="/static/css/member_joinForm.css" />

        <script>
            $(document).ready(function () {
                // enter 금지
                $('input[type="text"]').keydown(function () {
                    if (event.keyCode === 13) {
                        event.preventDefault();
                    }
                });
                var chkid = false;
                var chkp = false;
                var chkname = false;
                var chkemail = false;
                //var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                // 회원가입 창 유효성 검사 method
                function join() {
                    $("#join").attr("disabled", true);
                    if (chkid) {
                        if (chkp) {
                            if (chkname) {
                                if (chkemail) {
                                    $("#join").attr("disabled", false);
                                }
                            }
                        }
                    }
                }
                // 비밀번호 유효성검사 method
                function chkPwd() {
                    if ($("#user_pwd").val() != $("#pwdCheck").val()) {
                        $("#pwd2Result").text("비밀번호가 일치하지 않습니다.");
                        chkp = false;
                    } else {
                        $("#pwd2Result").empty();
                        chkp = true;
                    }
                }
                // id textbox
                $("#user_id").on("propertychange change keyup paste input blur", function () {
                    var rule = /^[A-Za-z0-9]{4,12}$/; // id rule 정규식
                    var id = $("#user_id").val();
                    if (!rule.test(id)) {
                        if ($("#user_id").val() == "") {
                            $("#idResult").text("필수 정보입니다.");
                        } else if (id.length < 4 || 12 < id.length) {
                            $("#idResult").text("아이디는 4글자 이상 13글자 미만으로 입력해주세요.");
                        } else if (!rule.test(/^[A-Za-z0-9]*$/)) {
                            $("#idResult").text("아이디에 사용할 수 없는 문자가 있습니다.");
                        }
                        /* $("#user_id").focus(); */
                        chkid = false;
                        document.getElementById("idResult").classList.remove("success");
                        document.getElementById("idResult").classList.add("message");
                        $("#join").attr("disabled", true);
                        // id 중복체크
                    } else {
                        $.ajax({
                            url: "/member/idCheck",
                            type: "post",
                            data: { id },
                            success: function (data) {
                                chkid = data.bool;
                                if (chkid) {
                                    document.getElementById("idResult").classList.add("success");
                                    document.getElementById("idResult").classList.remove("message");
                                } else {
                                    document.getElementById("idResult").classList.remove("success");
                                    document.getElementById("idResult").classList.add("message");
                                }
                                $("#idResult").text(data.str);

                                join();
                            },
                        });
                    }
                });
                // pwd textbox
                $("#user_pwd").on("propertychange change keyup paste input blur", function () {
                    chkp = false;
                    $("#pwd1Result").empty();
                    $("#pwd2Result").empty();

                    if ($("#user_pwd").val() == "") {
                        $("#pwd1Result").text("필수 정보입니다.");
                    } else if ($("#pwdCheck").val() != "") {
                        chkPwd();
                    }
                });

                $("#pwdCheck").on("propertychange change keyup paste input blur", function () {
                    chkp = false;
                    $("#pwd2Result").empty();

                    if ($("#pwdCheck").val() == "") {
                        $("#pwd2Result").text("필수 정보입니다.");
                    } else {
                        chkPwd();
                    }
                });

                $("#user_name").on("propertychange change keyup paste input blur", function () {
                    chkname = false;
                    if ($("#user_name").val() == "") {
                        $("#nameResult").text("필수 정보입니다.");
                    } else {
                        $("#nameResult").empty();
                        chkname = true;
                    }
                });

                /* function emailchk(){
               		if (regExp.test($("#user_email").val())
               			
               	} */
                // email textbox
                $("#user_email1, #user_email2, user_email").on("propertychange change keyup paste input blur", function () {
                    chkemail = false;

                    if ($("#user_email1").val() == "") {
                        $("#emailResult").text("필수 정보입니다.");
                    } else {
                        $("#emailResult").empty();
                        chkemail = true;
                    }
                });

                // email select box
                $("#email_list").change(function () {
                    if ($(this).val() != "") {
                        document.getElementById("user_email2").readOnly = true;
                    } else {
                        document.getElementById("user_email2").readOnly = false;
                    }
                    document.getElementById("user_email2").value = document.getElementById("email_list").value;
                    document.getElementById("user_email2").focus();
                });

                // birth
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = "0" + dd;
                }
                if (mm < 10) {
                    mm = "0" + mm;
                }
                today = yyyy + "-" + mm + "-" + dd;

                $("#user_birth").attr("max", today);
                $("#user_birth").attr("value", today);

                $("input, select").on("propertychange change keyup paste input blur", function () {
                    document.getElementById("user_email").value = document.getElementById("user_email1").value + "@" + document.getElementById("user_email2").value;
                    join();
                });
            });

            function changeEmail(value) {
                if (value != "") {
                    document.getElementById("user_email2").readOnly = true;
                } else {
                    document.getElementById("user_email2").readOnly = false;
                }
                document.getElementById("user_email2").value = value;
                document.getElementById("user_email2").focus();
            }
        </script>
    </head>
    <body>
        <c:import url="../header.jsp"></c:import>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5 container1 col-md-6">
                <h3>회원가입</h3>
                <form action="/member/join" id="form" method="post">
                    <!-- 아이디 -->
                    <div class="mb-3">
                        <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디" />
                        <span id="idResult"></span>
                    </div>

                    <!-- 비밀번호 -->
                    <div class="mb-3">
                        <input type="password" class="form-control" name="user_pwd" id="user_pwd" placeholder="비밀번호" />
                        <span id="pwd1Result" class="message"></span>
                    </div>
                    <!-- 비밀번호 확인 -->
                    <div class="mb-3">
                        <input type="password" class="form-control" id="pwdCheck" placeholder="비밀번호 확인" />
                        <span id="pwd2Result" class="message"></span>
                    </div>
                    <!-- 이름 -->
                    <div class="mb-3">
                        <input type="text" class="form-control" name="user_name" id="user_name" placeholder="이름" />
                        <span id="nameResult" class="message"></span>
                    </div>
                    <!-- 닉네임 -->
                    <div class="mb-3">
                        <input type="text" class="form-control" name="user_nickname" id="user_nickname" placeholder="닉네임" />
                    </div>
                    <!-- 이메일 -->
                    <div class="input-group mb-3">
                        <input type="text" name="user_email1" id="user_email1" class="form-control" placeholder="이메일" aria-label="이메일" />
                        <span class="input-group-text">@</span>
                        <input type="text" id="user_email2" class="form-control" />
                        <!-- 이메일선택 -->
                        <button class="btn btn-outline-secondary dropdown-toggle" id="email_list" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" onclick="changeEmail('')" value="">직접입력</a></li>
                            <li>
                                <a class="dropdown-item" onclick="changeEmail('naver.com')" value="naver.com">네이버</a>
                            </li>
                            <li>
                                <a class="dropdown-item" onclick="changeEmail('hanmail.net')" value="hanmail.com">다음</a>
                            </li>
                            <li>
                                <a class="dropdown-item" onclick="changeEmail('google.com')" value="google.com">구글</a>
                            </li>
                        </ul>
                    </div>
                    <input type="hidden" id="user_email" name="user_email" readonly />
                    <span id="emailResult" class="message"></span>

                    <!-- 전화번호 -->
                    <div class="mb-3"><input type="text" class="form-control" name="user_tel" id="user_tel" placeholder="전화번호" /><br /></div>
                    <!-- 우편번호 검색 -->
                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script src="/static/js/postcode.js"></script>
                    <div class="mb-3 postcode">
                        <input type="text" name="user_postcode" id="user_postcode" style="width: 100px" class="form-control" placeholder="우편번호" readonly />
                        <button type="button" id="postcode" class="btn btn-secondary btn" onclick="sample6_execDaumPostcode()">주소찾기</button>
                    </div>
                    <!-- 주소1 -->
                    <div class="mb-3">
                        <input type="text" name="user_addr1" id="user_addr1" class="form-control" placeholder="주소" readonly />
                    </div>
                    <!-- 주소2 -->
                    <div class="mb-3">
                        <input type="text" name="user_addr2" id="user_addr2" class="form-control" placeholder="상세주소" />
                    </div>
                    <!-- 생일 -->
                    <div class="mb-3">
                        <input id="user_birth" name="user_birth" type="date" min="1900-01-01" max="2000-01-01" class="form-control" value="1900-01-01" />
                    </div>
                    <!-- 타입 -->
                    type<br />
                    <label><input type="radio" name="user_type" id="user_type" value="1" checked />일반회원</label>
                    <label><input type="radio" name="user_type" id="user_type" value="2" />관리자</label><br />
                    <!-- 가입버튼 -->
                    <button type="submit" id="join" class="btn btn-primary btn" disabled="disabled">가입하기</button>
                </form>
            </div>
        </section>
        <c:import url="../footer.jsp"></c:import>
    </body>
>>>>>>> origin/jeongmin
</html>
