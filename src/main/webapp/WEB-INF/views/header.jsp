<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
                            <li>
                                <a href="${pageContext.request.contextPath}/member/loginForm">로그인</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/help/helpList">1:1문의</a>
                            </li>
                        </c:when>
                        <%-- 로그인 상태 --%>
                        <c:otherwise>
                            <c:choose>
                                <%-- 관리자 로그인 시 --%>
                                <c:when test="${sessionScope.user_type == 3}">
                                    <li>
                                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                        role="button" data-bs-toggle="dropdown"
                                        aria-expanded="false">관리자 메뉴</a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/member/main">내정보</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider" />
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/member/list">회원관리</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/product/list">제품관리</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/report/reportList">신고
                                                목록 확인</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
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
                                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                            내 메뉴
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
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/member/main">내정보
                                                    <c:if test="${alram_size >= 1}">
                                                        <span class="badge bg-danger">${alram_size}</span>
                                                    </c:if>
                                                </a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider" />
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
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
                                                            내 메뉴
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
                                            <li>
                                                <a class="dropdown-item"
                                                href="${pageContext.request.contextPath}/member/main">내정보
                                                    <c:if test="${alram_size >= 1}">
                                                        <span class="badge bg-danger">${alram_size}</span>
                                                    </c:if>
                                                </a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider" />
                                            </li>
                                            <li>
                                                <a class="dropdown-item"
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
                                        <a href="${pageContext.request.contextPath }/notice/noticeList">이벤트/공지</a>
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