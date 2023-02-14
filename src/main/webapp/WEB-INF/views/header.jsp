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
        <script type="text/javascript">
        $(document).ready(function(){
        	$.ajax({
        		url:"/header",
        		type:"post",
        		success: function(data){
        			var data = data;
        			
        			let html=`
                            <li class="menuArea">
                                <a href="#" class="title on">
                                    <span class="text">${"${data[0].cate_name}"}</span>
                                </a>
                                </li>
                	`;
                	
                	$(".category-wrap").append(html);
        			}
        		}
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
                                                href="${pageContext.request.contextPath}/member/userList">회원관리</a>
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
                                <a href="${pageContext.request.contextPath}/product/mylist" class="mypage"><span>마이페이지</span></a>
                            </div>
                            <div class="icon">
                                <a href="${pageContext.request.contextPath}/help/helpList" class="chat"><span>1:1문의</span></a>
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
                                <c:forEach var="c1" items="${c1 }">
                                    <li class="menuArea">
                                        <a href="#" class="title on">
                                            <span class="text">${c1.cate_name }</span>
                                        </a>
                                        <ul class="category-wrap">
                                        <%--  <c:forEach var="c2" items="${c2 }">
                                         <c:if test="${c1.cate_num==c2.cate_parent_num }">
                                            <li>
                                                <a href="#" class="on title">
                                                    <span class="text">${c2.cate_name }</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        </c:forEach>
                                        </ul>
                                    </li>
                                    </c:forEach> --%>                                 
                                </ul> 
                            </div>
                        </div>
                        <div class="menu">
                            <div id="menuInner" class="menuInner">
                                <ul>
                                    <li class="ddd">
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