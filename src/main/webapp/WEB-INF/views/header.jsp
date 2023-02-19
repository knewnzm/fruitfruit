<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<<<<<<< HEAD

        <!DOCTYPE html>
        <html lang="ko">

  <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"> -->
        <title>Document</title>
        <script type="text/javascript">
        function search() {
	           const keyword = document.getElementById("headerSearchId").value;
	           window.location.href = "${pageContext.request.contextPath}/product/productSearch?keyword=" + keyword;
	         }

        ///////////////////////////////////
        function makeBtn2(data, cate_type = 2) { //하나의 행 element를 data라 부르기로 하자
            let html = ` 
            	<li>
                <a href="/product/csearch?frfr_category2=${"${data.cate_num}"}" class="on title">
                    <span>${"${data.cate_name}"}</span>
                </a>
            </li>
            `;
            return html; //그렇게 만든 하나의 html을 makeBtnList함수의 html값에 합쳐준다
        }
        /////////////////////////////////////////
        function makeBtn(data, cate_type = 1) { //하나의 행 element를 data라 부르기로 하자
        	/* 
        	<div> id=c"${cate_type}"+"${cate_num}" ex)c1+1
        	<input> name=c"${cate_type}" , id=c"${cate_type}"-"${cate_num}" ex) name=c1 ,id=c1-1
        	<label> 
            for=c"${cate_type}"-"${cate_num}" ex) c1-1 
            */
            
          //class가 menuArea인 li태그를 만들고
          //Mapping의 value가 /product/csearch이고 @RequestPram값으로 키값frfr_category1,밸류가 data의 cate_num값인
          //컨트롤러로 가는 링크를 생성한다
          //span 태그에 data의 cate_name값을 넣어준다
            let html = ` 
            	<li class="menuArea"> 
                <a href="/product/csearch?frfr_category1=${"${data.cate_num}"}" class="title on"> 
                    <span id="c${'${cate_type}'}-${'${data.cate_num}'}" class="text">${"${data.cate_name}"}</span>
                </a>
                <ul id="c${'${cate_type}'}_${'${data.cate_num}'}" class="category-wrap">
                </ul>
                </li>
            `;
            return html; //그렇게 만든 하나의 html을 makeBtnList함수의 html값에 합쳐준다
        }
        ///////////////////////////////
        function makeBtnList(array, cate_type = 1) {
            let html = "";
            for (let i = 0; i < array.length; i++) {
                const element = array[i]; //array에 들어있는 각각의 행 element를 순서대로 꺼낸다 [object Object]
                
                if(cate_type==1){
                html += makeBtn(element, cate_type); //makeBtn함수에 element값을 순서대로 넣는다
                                                                          //그 결과를 빈 html변수에 순서대로 합친다
                }else if(cate_type==2){
                	html += makeBtn2(element, cate_type);
                }
            }
            return html; //합쳐진 html값을 getCategoryList함수로 다시 보내준다
        }
        /////////////////////////////////
        function getCategoryList(cate_type, cate_parent_num = -1) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/category/getCategory",
                data: { cate_type, cate_parent_num },
                success: function (response) { //카테고리 대분류 전체 리스트가 들어있는 GSON값을 받는다
                   const arr = $.parseJSON(response); //받아온 GSON값을 parseJSON하여 arr이라는 변수에 담는다
                    let html = makeBtnList(arr, cate_type); //makeBtnList함수에 arr과 cate_type을 보내고,
                                                                                 //보낸 결과값을 html이라는 변수에 담는다
                                                                                 
                                                                                 if(cate_type==1){
                    $("#c" + cate_type + "-list").html(html);//아이디가 c1-list꼴인 form의 내용을 html로 교체한다
                                                                                 }else if(cate_type==2){
                                                                                	 
                    $("#c1_"+ cate_parent_num).html(html);//아이디가 c1-list꼴인 form의 내용을 html로 교체한다
                                                                                 }
                    
                }
            });
        }
        ////////////////////
         function categoryBtnHandler(e) {
        	 const data = $(e.target).attr("id").split("-");// $(e.target)은 <a>태그, a태그의 id에서 "-"를 기준으로 값을 나눠 data에 담는다 ex)c1,2
             const cate_type = parseInt(data[0].substr(1)); //그중 맨앞의 값인 data[0]값의 맨 앞의 하나를 뺀다 .substr(1) c1-> 1
             const cate_num = data[1]; //그 다음값인 data[1]값을 cate_num변수에 담는다 ex)2 
             getCategoryList(cate_type + 1, cate_num);
            }
        //////////////////////
        $(document).ready(function(){
        	getCategoryList(1);
        	
        	$(document).on("mouseover", "span.text", function (e) { //class가 menuArea인 li태그에 마우스를 올렸을때 
        		categoryBtnHandler(e); //categoryBtnHandler함수를 실행한다
        	});
        	
        });
        	
        
        </script>
    </head>


        <body>
            <!-- Navigation-->
            <header class="headArea fruit">
                <div class="util innerContent wrap">
                    <ul class="accountArea">
                        <c:choose>
                            <%-- 비 로그인 상태 --%>
                                <c:when test="${empty sessionScope.user_id}">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/member/loginForm">로그인</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/help/helpList">1:1문의</a>
                                    </li>
                                </c:when>
                                <%-- 로그인 상태 --%>
                                    <c:otherwise>
                                        <c:choose>
                                            <%-- 관리자 로그인 시 --%>
                                                <c:when test="${sessionScope.user_type == 3}">
                                                    <li class="nav-item">
                                                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                                            role="button" data-bs-toggle="dropdown"
                                                            aria-expanded="false">
                                                            <span class="type-wrap"><span class="mem-type">관리자</span>내
                                                                메뉴</span>
                                                        </a>
                                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/member/main">내정보</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/member/userList">회원관리</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/product/list">제품관리</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/report/reportList">신고
                                                                    목록 확인</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/category/category">카테고리
                                                                    관리</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link"
                                                            href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                                                    </li>
                                                </c:when>

                                                <%-- 판매자 로그인 시 --%>
                                                    <c:when test="${sessionScope.user_type == 2}">
                                                        <li class="nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" id="navbarDropdown"
                                                                href="#" role="button" data-bs-toggle="dropdown"
                                                                aria-expanded="false">
                                                                <span class="type-wrap"><span
                                                                        class="mem-type">판매자</span>내 메뉴</span>
                                                                <c:if test="${alram_size >= 1}">
                                                                    <span class="
                                                position-absolute
                                                top-25
                                                start-0
                                                translate-middle
                                                p-1
                                                bg-danger
                                                border border-light
                                                rounded-circle
                                                ">
                                                                        <span class="visually-hidden">새 알람</span>
                                                                    </span>
                                                                </c:if>
                                                            </a>
                                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                                <li class="dropdown-item">
                                                                    <a class="dropdown-item-a"
                                                                        href="${pageContext.request.contextPath}/member/main">내정보
                                                                        <c:if test="${alram_size >= 1}">
                                                                            <span
                                                                                class="badge bg-danger">${alram_size}</span>
                                                                        </c:if>
                                                                    </a>
                                                                </li>
                                                                <li class="dropdown-item">
                                                                    <hr class="dropdown-divider" />
                                                                </li>
                                                                <li class="dropdown-item">
                                                                    <a class="dropdown-item-a"
                                                                        href="${pageContext.request.contextPath}/product/add">상품
                                                                        등록하기</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link"
                                                                href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                                                        </li>
                                                    </c:when>

                                                    <%-- 구매자 로그인 시 --%>
                                                        <c:otherwise>
                                                            <li class="nav-item dropdown">
                                                                <a class="nav-link dropdown-toggle" id="navbarDropdown"
                                                                    href="#" role="button" data-bs-toggle="dropdown"
                                                                    aria-expanded="false">
                                                                    <span class="type-wrap"><span
                                                                            class="mem-type">구매자</span>내 메뉴</span>
                                                                    <c:if test="${alram_size >= 1}">
                                                                        <span class="
                                                position-absolute
                                                top-25
                                                start-0
                                                translate-middle
                                                p-1
                                                bg-danger
                                                border border-light
                                                rounded-circle
                                                ">
                                                                            <span class="visually-hidden">새 알람</span>
                                                                        </span>
                                                                    </c:if>
                                                                </a>
                                                                <ul class="dropdown-menu"
                                                                    aria-labelledby="navbarDropdown">
                                                                    <li class="dropdown-item">
                                                                        <a class="dropdown-item-a"
                                                                            href="${pageContext.request.contextPath}/member/myPage">마이페이지
                                                                            <c:if test="${alram_size >= 1}">
                                                                                <span
                                                                                    class="badge bg-danger">${alram_size}</span>
                                                                            </c:if>
                                                                        </a>
                                                                    </li>
                                                                    <li class="dropdown-item">
                                                                        <a class="dropdown-item-a"
                                                                            href="${pageContext.request.contextPath}/wish/wishList">찜
                                                                            목록</a>
                                                                    </li>
                                                                    <li class="dropdown-item">
                                                                        <a class="dropdown-item-a"
                                                                            href="${pageContext.request.contextPath}/">구매
                                                                            목록
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link"
                                                                    href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                                                            </li>
                                                        </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="main innerContent">
                        <!-- Logo -->
                        <h1 class="logoArea fruit">
                            <a href="${pageContext.request.contextPath}/">
                                <img src="${pageContext.request.contextPath}/static/img/logo.png" alt="프룻프룻 로고"
                                    style="width:150px;">
                            </a>
                        </h1>
 						<div class="searchAreaWrap">
                            <form>
                                <div class="searchArea fruit TXT">
                                  <input title="검색어 입력" id="headerSearchId" placeholder="검색어를 입력하세요" class="TXT" type="search" name="keyword">
								  <button type="button" class="btnSearchInner" onclick="search()"></button>
								</div>
                            </form>
                        </div>
                        <div class="buttonArea">
                            <c:choose>
                                <%-- 판매자 로그인시 --%>
                                    <c:when test="${sessionScope.user_type == 2}">
                                        <div class="icon">
                                            <a href="${pageContext.request.contextPath}/product/mylist"
                                                class="heart"><span>아이콘</span></a>
                                        </div>
                                        <div class="icon">
                                            <a href="${pageContext.request.contextPath}/member/myPage"
                                                class="mypage"><span>아이콘</span></a>
                                        </div>
                                        <div class="icon">
                                            <a href="${pageContext.request.contextPath}/help/helpForm"
                                                class="chat"><span>아이콘</span></a>
                                        </div>
                                    </c:when>

                                    <c:otherwise>
                                        <%-- 그 외 --%>
                                            <div class="icon">
                                                <a href="${pageContext.request.contextPath}/wish/wishList"
                                                    class="heart"><span>아이콘</span></a>
                                            </div>
                                            <div class="icon">
                                                <a href="${pageContext.request.contextPath}/member/myPage"
                                                    class="mypage"><span>아이콘</span></a>
                                            </div>
                                            <div class="icon">
                                                <a href="${pageContext.request.contextPath}/help/helpForm"
                                                    class="chat"><span>아이콘</span></a>
                                            </div>
                                    </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
             <div class="sub">
                <div class="inner">
                    <div class="category fruit">
                        <div class="moreViewWrap">
                            <button type="button" class="moreView">
                                <span class="bar"></span>
                                <span>카테고리</span>
                            </button>
                            <div class="dep1 hidden">
                                <ul id="c1-list" class="category-wrap">
                                
                                    
                                                                  
                                </ul>
                            </div>
                        </div>
                        <div class="menu">
                            <div id="menuInner" class="menuInner">
                               <ul>
                                                    <li class>
                                                        <a href="${pageContext.request.contextPath}/">신상품</a>
                                                    </li>
                                                    <li class>
                                                        <a href="${pageContext.request.contextPath}/member/myPage">MD PICK</a>
                                                    </li>
                                                    <li class>
                                                        <a href="${pageContext.request.contextPath}/member/myPage">인기베스트</a>
                                                    </li>
                                                    <li class>
                                                        <a
                                                            href="${pageContext.request.contextPath}/notice/noticeList">이벤트/공지</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
            </header>


        </body>

        </html>
=======
    
    <!DOCTYPE html>
    <html lang="ko">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"> -->
        <title>Document</title>
    </head>


    <body>
        <!-- Navigation-->
        <header class="headArea fruit">
            <div class="util innerContent wrap">
                <ul class="accountArea">
                    <c:choose>
                        <%-- 비 로그인 상태 --%>
                        <c:when test="${empty sessionScope.user_id}">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/member/loginForm">로그인</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>
                            </li>
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/help/helpList">1:1문의</a>
                            </li>
                        </c:when>
                        <%-- 로그인 상태 --%>
                        <c:otherwise>
                            <c:choose>
                                <%-- 관리자 로그인 시 --%>
                                <c:when test="${sessionScope.user_type == 3}">
                                    <li class="nav-item">
                                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                        role="button" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <span class="type-wrap"><span class="mem-type">관리자</span>내 메뉴</span>
                                    </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/member/main">내정보</a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/member/list">회원관리</a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/product/list">제품관리</a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/report/reportList">신고
                                                목록 확인</a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/admin/category">카테고리
                                                관리</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link"
                                        href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                                    </li>
                                </c:when>

                                <%-- 판매자 로그인 시 --%>
                                <c:when test="${sessionScope.user_type == 2}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="type-wrap"><span class="mem-type">판매자</span>내 메뉴</span>
                                            <c:if test="${alram_size >= 1}">
                                                <span class="
                                                position-absolute
                                                top-25
                                                start-0
                                                translate-middle
                                                p-1
                                                bg-danger
                                                border border-light
                                                rounded-circle
                                                ">
                                                    <span class="visually-hidden">새 알람</span>
                                                </span>
                                            </c:if>
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/member/main">내정보
                                                    <c:if test="${alram_size >= 1}">
                                                        <span class="badge bg-danger">${alram_size}</span>
                                                    </c:if>
                                                </a>
                                            </li>
                                            <li class="dropdown-item">
                                                <hr class="dropdown-divider" />
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/product/add">제품
                                                추가하기</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link"
                                        href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                                    </li>
                                </c:when>

                                <%-- 구매자 로그인 시 --%>
                                <c:otherwise>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                            <span class="type-wrap"><span class="mem-type">구매자</span>내 메뉴</span>
                                            <c:if test="${alram_size >= 1}">
                                                <span class="
                                                position-absolute
                                                top-25
                                                start-0
                                                translate-middle
                                                p-1
                                                bg-danger
                                                border border-light
                                                rounded-circle
                                                ">
                                                    <span class="visually-hidden">새 알람</span>
                                                </span>
                                            </c:if>
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/member/main">내정보
                                                    <c:if test="${alram_size >= 1}">
                                                        <span class="badge bg-danger">${alram_size}</span>
                                                    </c:if>
                                                </a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/product/add">제품
                                                추가하기</a>
                                            </li>
                                            <li class="dropdown-item">
                                                <a class="dropdown-item-a"
                                                href="${pageContext.request.contextPath}/product/add">제품
                                                추가하기</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link"
                                        href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </ul>
                    <div class="main innerContent">
                        <!-- Logo -->
                        <h1 class="logoArea fruit">
                            <a href="${pageContext.request.contextPath}/">
                                <img src="${pageContext.request.contextPath}/static/img/logo.png" alt="프룻프룻 로고" style="width:150px;">
                            </a>
                        </h1>
                        <div class="searchAreaWrap">
                            <form>
                                <div class="searchArea fruit TXT">
                                    <input title="검색어 입력" id="headerSearchId" placeholder="검색어를 입력하세요" class="TXT"
                                        type="search">
                                    <button type="button" class="btnSearchInner"></button>
                                </div>
                            </form>
                        </div>
                        <div class="buttonArea">
                            <div class="icon">
                                <a href="${pageContext.request.contextPath}/wish/wishList" class="heart"><span>나의 찜</span></a>
                            </div>
                            <div class="icon">
                                <a href="${pageContext.request.contextPath}/" class="mypage"><span>마이페이지</span></a>
                            </div>
                            <div class="icon">
                                <a href="${pageContext.request.contextPath}/help/helpForm.jsp" class="chat"><span>1:1문의</span></a>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
            <div class="sub">
                <div class="inner">
                    <div class="category fruit">
                        <div class="moreViewWrap">
                            <button type="button" class="moreView">
                                <span class="bar"></span>
                                <span>카테고리</span>
                            </button>
                            <div class="dep1 hidden">
                                <ul class="category-wrap">
                                    <li class="menuArea">
                                        <a href="#" class="title on">
                                            <span class="text">과일</span>
                                        </a>
                                        <ul class="category-wrap">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">사과/배</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">감귤/한라봉</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">감/밤/대추</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">토마토/수박/참외</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">딸기/블루베리/베리류</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">키위/참다래/매실</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">오렌지/자몽/레몬</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">포도/복숭아/자두</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="menuArea">
                                        <a href="#" class="title on">
                                            <span class="text">채소</span>
                                        </a>
                                        <ul class="category-wrap">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">고구마/감자/당근</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">옥수수/오이/호박</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">파프리카/고추</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">양파/마늘/생강/파</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">쌈채소/샐러드</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">마/우엉/연근/인삼</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">배추/무/열무</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">양배추/양상추</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="title on">
                                            <span class="text">축산물</span>
                                        </a>
                                        <ul class="category-wrap">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">돼지고기</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">소고기</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">닭/기타</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="title on">
                                            <span class="text">수산물</span>
                                        </a>
                                        <ul class="category-wrap">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">새우/게/갑각류</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">멸치/건어물/기타</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">생선</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">전복/굴/조개류</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">오징어/문어</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">미역/김/해조류</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="title on">
                                            <span class="text">쌀/잡곡</span>
                                        </a>
                                        <ul class="category-wrap">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">쌀</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">현미/찹쌀/찰현미</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">콩/보리/귀리</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">흑미/팥/율무</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">기장/조/수수</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">기타잡곡</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" class="title on">
                                            <span class="text">견과/약재</span>
                                        </a>
                                        <ul class="category-wrap">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">밤/잣/은행</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">인삼/기타약재</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">땅콩/아몬드/호두/기타</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="menu">
                            <div id="menuInner" class="menuInner">
                                <ul>
                                    <li class>
                                        <a href="#">신상품</a>
                                    </li>
                                    <li class>
                                        <a href="#">MD PICK</a>
                                    </li>
                                    <li class>
                                        <a href="#">인기베스트</a>
                                    </li>
                                    <li class>
                                        <a href="${pageContext.request.contextPath}/notice/noticeList">이벤트/공지</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        
    </body>

    </html>
>>>>>>> refs/remotes/daegyu/daegyu
