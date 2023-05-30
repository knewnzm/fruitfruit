<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/static/js/postcode.js"></script>
    <title>join form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/joinForm.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            // 엔터를 눌렀을때 폼을 submit 하는 것을 막기
            $("#joinForm").find("input").keydown(function () { //아이디가 joinForm인 것의 하위의 모든 input요소
                if (event.keyCode === 13) { //keyCode 13은 enter를 의미함
                    event.preventDefault(); //기본 설정대로 실행되는것을 막는다는뜻
                }
            });

            //아이디 유효성 검사
            $(".id_check_btn").click(function () {
                $.get("/member/idCheck", { user_id: $("#user_id").val() })
                    .done(function (data) {
                        $(".id_check_text").text(data.result);
                    });
            });

            //회원가입 유효성 검사
            $("#join").click(function () {
                if ( $(".id_check_text").text() == "사용 가능한 이메일입니다" ) { //중복확인 검사
                    if ($("#user_postcode").val() == "" || $("#user_addr1").val() == "") { //readonly와 required를 함께 사용할 수 없기 떄문에 작성
                        alert("주소를 입력해주세요");
                        return false;
                    }
                } else {
                    alert("id 중복확인을 먼저 완료해주세요");
                    return false;
                }
            });
        });
    </script>
</head>

<body>
    <c:import url="../head.jsp"></c:import>
    <c:import url="../header.jsp"></c:import>
    
    <main class="container">
        <div id="content" class="content">
            <div class="main_title_box">
                <h1 class="main_title">회원가입</h1>
            </div>
            <div class="line">
                <hr>
            </div>
            <!-- 회원가입폼 -->
            <form id="joinForm" name="j" action="${pageContext.request.contextPath }/member/joinForm" method="post">
                <div class="join_wrap">
                    <div class="join_content">
                        <div class="join_box">
                            <div class="type_wrap">
                                <div class="join_title">
                                    <label for="user_type">
                                        회원 구분
                                    </label>
                                </div>
                                <!-- 회원타입 -->
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
                        <!-- 회원아이디 -->
                        <div class="join_box">
                            <div class="join_id_wrap">
                                <div class="join_id">
                                    <div class="join_title">
                                        <label for="user_id">
                                            아이디
                                        </label>
                                    </div>
                                    <div class="join_input">
                                        <input type="text" name="user_id" id="user_id" class="j_input"
                                            placeholder="아이디를 입력해주세요." required>
                                    </div>
                                    <div class="join_btn">
                                        <button class="id_check_btn" type="button">
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
                        <!-- 회원비밀번호 -->
                        <div class="join_box">
                            <div class="join_title">
                                <label for="user_pwd">
                                    비밀번호
                                </label>
                            </div>
                            <div class="join_input">
                                <input type="password" name="user_pwd" id="user_pwd" class="j_input"
                                    placeholder="비밀번호를 입력해주세요." required>
                            </div>
                        </div>
                        <!-- 회원이름 -->
                        <div class="join_box">
                            <div class="join_title">
                                <label for="user_name">
                                    이름
                                </label>
                            </div>
                            <div class="join_input">
                                <input type="text" name="user_name" id="user_name" class="j_input"
                                    placeholder="이름을 입력해주세요." required>
                            </div>
                        </div>
                        <!-- 회원닉네임 -->
                        <div class="join_box">
                            <div class="join_title">
                                <label for="user_nick">
                                    닉네임
                                </label>
                            </div>
                            <div class="join_input">
                                <input type="text" name="user_nick" id="user_nick" class="j_input"
                                    placeholder="닉네임을 입력해주세요." required>
                            </div>
                        </div>
                        <!-- 회원전화번호 -->
                        <div class="join_box">
                            <div class="join_title">
                                <label for="user_tel">
                                    전화번호
                                </label>
                            </div>
                            <div class="join_input">
                                <input type="number" name="user_tel" id="user_tel" class="j_input"
                                    placeholder="숫자만 입력해주세요." required>
                            </div>
                        </div>
                        <!-- 회원우편번호 -->
                        <div class="join_box">
                            <div class="addr_wrap">
                                <div class="addr_top_wrap">
                                    <div class="join_title">
                                        <label for="user_addr">
                                            우편번호
                                        </label>
                                    </div>
                                    <div class="addr_postcode">
                                        <input type="text" name="user_postcode" id="user_postcode" class="j_input"
                                            placeholder="우편번호" readonly>
                                    </div>
                                    <div class="addr_btn">
                                        <button class="addr_search_btn" type="button" name="addr_search_btn"
                                            onclick="sample6_execDaumPostcode()">
                                            <span class="search_text">주소 검색</span>
                                            <img src="${pageContext.request.contextPath}/static/img/join_edit_search.png"
                                                class="search_img">
                                        </button>
                                    </div>
                                </div>
                                <div class="addr_wrap1">
                                    <input type="text" name="user_addr1" id="user_addr1" class="j_input"
                                        placeholder="도로명 주소" readonly>
                                </div>
                                <div class="addr_wrap2">
                                    <input type="text" name="user_addr2" id="user_addr2" class="j_input"
                                        placeholder="상세항목" required>
                                </div>
                            </div>
                        </div>
                        <!-- 회원계좌번호 -->
                        <div class="join_box">
                            <div class="join_title">
                                <label for="user_account">
                                    계좌번호
                                </label>
                            </div>
                            <div class="account_select">
                                <select name="user_bank" id="user_bank" class="user_bank" required>
                                    <option value="" disabled selected>선택</option>
                                    <option value="1">국민은행</option>
                                    <option value="2">우리은행</option>
                                    <option value="3">농협은행</option>
                                    <option value="4">신한은행</option>
                                    <option value="5">기업은행</option>
                                    <option value="6">KEB 하나은행</option>
                                    <option value="7">외환은행</option>
                                    <option value="8">제일은행</option>
                                    <option value="9">한국시티은행</option>
                                    <option value="10">카카오뱅크</option>
                                    <option value="11">케이뱅크</option>
                                </select>
                            </div>
                            <div class="account_input">
                                <input type="number" name="user_account" id="user_account" class="j_input"
                                    placeholder="계좌번호를 입력해주세요." required>
                            </div>
                        </div>
                        <!-- 가입버튼 -->
                        <div class="submit_wrap">
                            <button type="submit" id="join">가입하기</button>
                            <button class="back_btn" type="button"
                                onClick="location.href=`${pageContext.request.contextPath}/`">목록으로</button>
                        </div>
                        <!-- join content -->
                    </div>
                    <!-- join wrap -->
                </div>
                <!-- content -->
            </form>
        </div>
    </main>
    <c:import url="../footer.jsp"></c:import>
    <!-- wrap end -->
</body>
</html>