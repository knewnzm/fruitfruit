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
               function search(event) {
                    const keyword = document.getElementById("headerSearchId").value;
                    window.location.href = "${pageContext.request.contextPath}/product/productSearch?keyword=" + keyword;
                } 

                ///////////////////////////////////
                function hmakeBtn(data, cate_type = 1) {
 
                    let html = ` 
            	<li class="menuArea"> 
                <a href="/product/productCsearch?frfr_category1=${"${data.cate_num}"}" class="title on"> 
                    <span id="c${'${cate_type}'}x${'${data.cate_num}'}" class="text">${"${data.cate_name}"}</span>
                </a>
                <ul id="c${'${cate_type}'}_${'${data.cate_num}'}" class="category-wrap">
                </ul>
                </li>
            `;
                    return html; 
                }


                function hmakeBtn2(data, cate_type = 2) { 
                    let html = ` 
            	<li>
                    
                <a href="/product/productCsearch?frfr_category2=${"${data.cate_num}"}" class="on title">
                    <span>${"${data.cate_name}"}</span>
                </a>
            </li>
            `;
                    return html;
                }


                function hmakeBtnList(array, cate_type = 1) {
                    let html = "";
                    for (let i = 0; i < array.length; i++) {
                        const helement = array[i]; 

                        if (cate_type == 1) {
                            html += hmakeBtn(helement, cate_type); 
                           
                        } else if (cate_type == 2) {
                            html += hmakeBtn2(helement, cate_type);
                        }
                    }
                    return html;
                }
          
                function hgetCategoryList(cate_type, cate_parent_num = -1) {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/category/getCategory",
                        data: { cate_type, cate_parent_num },
                        success: function (response) {
                            const harr = $.parseJSON(response); 
                            let hhtml = hmakeBtnList(harr, cate_type); 
                          

                            if (cate_type == 1) {
                                $("#c" + cate_type + "xlist").html(hhtml);
                            } else if (cate_type == 2) {

                                $("#c1_" + cate_parent_num).html(hhtml);
                            }

                        }
                    });
                }
           
                function categoryBtnHandler(e) {
                    const indata = $(e.target).attr("id").split("x");
                    const h_cate_type = parseInt(indata[0].substr(1)); 
                    const h_cate_num = indata[1];
                    hgetCategoryList(h_cate_type + 1, h_cate_num);
                }

                $(document).ready(function(){
    hgetCategoryList(1);

    $(document).on("mouseover", "span.text", function (e) { 
        categoryBtnHandler(e); 
    });
});

/*     var searchField = document.getElementById("headerSearchId");
    searchField.addEventListener("keyup", function(event) {
        event.preventDefault();
        if (event.keyCode === 13) {
            document.querySelector(".btnSearchInner").click();
        }
    }); */






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
                                                                    href="${pageContext.request.contextPath}/member/editForm">내정보</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/member/userList">회원관리</a>
                                                            </li>
                                                            <li class="dropdown-item">
                                                                <a class="dropdown-item-a"
                                                                    href="${pageContext.request.contextPath}/product/productList">제품관리</a>
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
                                                                        href="${pageContext.request.contextPath}/member/editForm">내정보
                                                                        <c:if test="${alram_size >= 1}">
                                                                            <span
                                                                                class="badge bg-danger">${alram_size}</span>
                                                                        </c:if>
                                                                    </a>
                                                                </li>
                                                                <li class="dropdown-item">
                                                                    <a class="dropdown-item-a"
                                                                        href="${pageContext.request.contextPath}/product/productForm">상품
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
                                                                            href="${pageContext.request.contextPath}/member/editForm">마이페이지
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
                                                                            href="${pageContext.request.contextPath}/product/mylist">구매
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
                            <form  action="${pageContext.request.contextPath}/product/productSearch">
                                <div class="searchArea fruit TXT">
                                    <input title="검색어 입력" id="headerSearchId" placeholder="검색어를 입력하세요" class="TXT"
                                        type="search" name="keyword">
                                    <button type="button" class="btnSearchInner" onclick="search()"></button>
                                </div>
                            </form>
                        </div>
                        <div class="buttonArea">
                            <c:choose>
                                <%-- 관리자 로그인시 --%>
                                    <c:when test="${sessionScope.user_type == 3}">
                                        <div class="icon">
                                                <a href="${pageContext.request.contextPath}/product/productList"
                                                    class="heart"><span>아이콘</span></a>
                                            </div>
                                            <div class="icon">
                                                <a href="${pageContext.request.contextPath}/member/userList"
                                                    class="mypage"><span>아이콘</span></a>
                                            </div>
                                            <div class="icon">
                                                <a href="${pageContext.request.contextPath}/help/helpList"
                                                    class="chat"><span>아이콘</span></a>
                                            </div>
                                    </c:when>

                                    <c:otherwise>
                                     <%-- 일반회원 로그인시 --%>
                                        <div class="icon">
                                            <a href="${pageContext.request.contextPath}/product/mylist"
                                                class="heart"><span>아이콘</span></a>
                                        </div>
                                        <div class="icon">
                                            <a href="${pageContext.request.contextPath}/member/editForm"
                                                class="mypage"><span>아이콘</span></a>
                                        </div>
                                        <div class="icon">
                                            <a href="${pageContext.request.contextPath}/help/helpList"
                                                class="chat"><span>아이콘</span></a>
                                        </div>
                                 
                                        <%-- 관리자 로그인시 --%>
                                            
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
                                    <ul id="c1xlist" class="category-wrap">



                                    </ul>
                                </div>
                            </div>
                            <div class="menu">
                                <div id="menuInner" class="menuInner">
                                    <ul>
                                        <li class>
                                            <a href="#new-product">신상품</a>
                                        </li>
                                        <li class>
                                            <a href="#md-product">MD PICK</a>
                                        </li>
                                        <li class>
                                            <a href="#best-product">인기베스트</a>
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