<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프룻프룻 회원정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/editForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript">

//enter submit 방지 함수
$(document).ready(function () {    
    $("#editForm").find("input").keydown(function () {
        if (event.keyCode === 13) {
            event.preventDefault();
        }       
    });
    
    /* 버튼 클릭 비활성화 */
      $("#submit, #button").prop("disabled",true); //수정버튼, 탈퇴버튼
                var checkP = false;
      
      /* 비밀번호 값 입력시 유효성 검사 */
                $("#user_pwd, #pwdCheck").on("input", function () { //비밀번호와 확인란의 값이 변경되었을때
                        chkPwd();
                });
      
      /* 유효성 검사 함수 */
    function chkPwd() {
            checkP = false; //true상태에서 다시 변경했을때 방지
    	if ($("#user_pwd").val() == "") { //비밀번호가 빈값
            $(".pwd_check_text").text("비밀번호를 입력해주세요.");
        } else if ($("#pwdCheck").val() == "") { //비밀번호 확인이 빈값
            $(".pwd_check_text").text("비밀번호 확인란을 입력해주세요.");
        } else if ($("#user_pwd").val() != $("#pwdCheck").val()) { //비밀번호와 확인이 불일치
            $(".pwd_check_text").text("비밀번호가 일치하지 않습니다.");
        } else if("${m.user_pwd}" != $("#user_pwd").val()){ //회원 비밀번호와 입력비밀번호가 불일치
            	$(".pwd_check_text").text("회원정보와 일치하지 않습니다.");
        }else{
            	$(".pwd_check_text").empty();
            	checkP = true; 
            }
        }
    	
    	 if (checkP) {       
         $("#submit, #button").attr("disabled", false); //disabled해제                 
     } else{
    	 $("#submit, #button").attr("disabled", true); //재변경시 disabled  
     }

    	 /* 회원 탈퇴 */
    $("#memberOut").click(function () {
        alert("탈퇴처리 되었습니다.\n이용해주셔서 감사합니다.");
        location.href = `${pageContext.request.contextPath}/member/out`;
    });
    	 
    /* 모달 */
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.modal_btn');
      const btnClose = document.querySelector('.modal_close_btn');
      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');
        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });
      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');
          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      btnClose.addEventListener('click', () => {
    	  modal.classList.remove('show');
    	  body.style.overflow = 'auto';
    	});
    ////
});
</script>
</head>
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<main class="container">
	<div id="content" class="content">
			<div class="main_title_box">
				<h1 class="main_title">회원정보 수정</h1>
			</div>
			<div class="line">
				<hr class="e_hr">
			</div>
			<form id="editForm" name="e" action="${pageContext.request.contextPath }/member/edit" method="post">
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
								<input type="text" name="user_type" class="readonly" id="user_type" value="${ m.user_type}" readonly>
								  <c:if test="${m.user_type ==1}"> 구매자 </c:if>
                   				  <c:if test="${m.user_type ==2}"> 판매자 </c:if>
                   				  <c:if test="${m.user_type ==3}"> 관리자 </c:if>
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
							<input type="text" name="user_id" id="user_id" class="readonly"  value="${m.user_id }" readonly>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_pwd">
								비밀번호 수정
							</label>
						</div>
						<div class="edit_input">
							<input type="password" name="user_pwd" id="user_pwd"  class="ed_input" placeholder="비밀번호를 입력해주세요" required>
						</div>
					</div>
					<div class="edit_check_wrap">
						<div class="edit_box" id="check_wrap">
							<div class="edit_title">
									<label for="pwd_check">
										비밀번호 확인
									</label>
							</div>
							<div class="edit_input">
								<input type="password" name="pwd_check" id="pwdCheck" class="ed_input"placeholder="비밀번호를 확인해주세요" required>
							</div>
						</div>
						<div class="check_text_box">
							<span class="pwd_check_text"></span>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_name">
								이름
							</label>
						</div>
						<div class="edit_readonly">
							<input type="text" name="user_name" id="user_name"  class="readonly" value="${m.user_name }" readonly>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_nick">
								닉네임
							</label>
						</div>
						<div class="edit_input">
							<input type="text" name="user_nick" id="user_nick"  class="ed_input" value="${m.user_nick }" required>
						</div>
					</div>
					<div class="edit_box">
						<div class="edit_title">
							<label for="user_tel">
								전화번호
							</label>
						</div>
						<div class="edit_input">
							<input type="text" name="user_tel" id="user_tel" class="ed_input"  value="${m.user_tel }"required>
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
								<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script src="/static/js/postcode.js"></script>
								<div class="addr_postcode">
									<input type="text" name="user_postcode" class="ed_input" id="user_postcode" value="${m.user_postcode }" readonly>
								</div>
								<div class="addr_btn">
									<button type="button" class="addr_search_btn" name="addr_search_btn" onclick="sample6_execDaumPostcode()">
										<span class="search_text">주소 검색</span>
										<img src="${pageContext.request.contextPath}/static/img/join_edit_search.png" class="search_img">
									</button>	
								</div>
							</div>
							<div class="addr_wrap1">
								<input type="text" name="user_addr1" id="user_addr1" class="ed_input" value="${m.user_addr1 }" readonly>
							</div>
							<div class="addr_wrap2">
								<input type="text" name="user_addr2" id="user_addr2" class="ed_input" value="${m.user_addr2 }" required>
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
							<select name="user_bank" id="user_bank" class="user_bank"  onchange="selectBoxChange(this.value);">
								<option value="" disabled selected>선택</option>
								<option value="1"  <c:if test="${m.user_bank==1}">selected</c:if>>국민은행</option>
								<option value="2" <c:if test="${m.user_bank==2}">selected</c:if>>우리은행</option>
								<option value="3" <c:if test="${m.user_bank==3}">selected</c:if>>농협은행</option>
								<option value="4" <c:if test="${m.user_bank==4}">selected</c:if>>신한은행</option>
								<option value="5" <c:if test="${m.user_bank==5}">selected</c:if>>기업은행</option>
								<option value="6" <c:if test="${m.user_bank==6}">selected</c:if>>KEB 하나은행</option>
								<option value="7" <c:if test="${m.user_bank==7}">selected</c:if> >외환은행</option>
								<option value="8" <c:if test="${m.user_bank==8}">selected</c:if>>제일은행</option>
								<option value="9" <c:if test="${m.user_bank==9}">selected</c:if> >한국시티은행</option>
								<option value="10" <c:if test="${m.user_bank==10}">selected</c:if>>카카오뱅크</option>
								<option value="11" <c:if test="${m.user_bank==11}">selected</c:if>>케이뱅크</option>
							</select>
						</div>
						<div class="account_input">
							<input type="text" name="user_account" id="user_account" class="ed_input" value="${m.user_account }" required>
						</div>
					</div>
					<div class="submit_wrap">
						<button type="submit" name="submit" id="submit" disabled="disabled">수정하기</button>
						<button type="button" id="button" class="modal_btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled="disabled">탈퇴하기</button>
					</div>
				<!-- ↓edit content -->	
				</div>
			<!-- edit wrap -->
			</div>
	</form>
		<!-- content -->
</div>
</main>
<c:import url="../footer.jsp"></c:import>
					<!--탈퇴 Modal -->
					 <div class="modal">
    					 <div class="modal_container">
    					 	<div class="modal_header">
      							<h2>탈퇴하기</h2>
      						</div>
      						<div class="modal_body">
      							탈퇴 시 철회할 수 없으며 가입하신 아이디로<br> 
      							작성한 글/댓글은 모두 삭제처리됩니다. <br>
                          	 	탈퇴하시겠습니까?
      						</div>
      						<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn"  data-bs-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="del_btn" id="memberOut" >탈퇴</button>
      						</div>
    					 </div>
    				</div>
</body>
</html>
