<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myfruit.css" />
</head>
<body>
	<c:choose>
<<<<<<< HEAD
		<%-- 관리자 로그인 시 --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">내 정보</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">회원관리</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">제품관리</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">신고 목록 확인</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">카테고리 관리</a></li>
			</ul>
		</c:when> --%>
		
		<%-- 판매자 로그인 시 --%>
		<%-- <c:when test="${sessionScope.user_type == 1}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">내 정보</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">판매 목록</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">제품 추가하기</a></li>
			</ul>
		</c:when> --%>
		
		<%-- 판매자 로그인 시 --%>
        <c:when test="${sessionScope.user_type == 1}">
        	<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/product/mylist">내 판매 목록</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">내 알람 조회</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">내 정보 수정</a></li>
=======
		<%-- 愿�由ъ옄 濡쒓렇�씤 �떆 --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�궡 �젙蹂�</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">�쉶�썝愿�由�</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�젣�뭹愿�由�</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">�떊怨� 紐⑸줉 �솗�씤</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">移댄뀒怨좊━ 愿�由�</a></li>
			</ul>
		</c:when> --%>
		
		<%-- �뙋留ㅼ옄 濡쒓렇�씤 �떆 --%>
		<%-- <c:when test="${sessionScope.user_type == 1}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�궡 �젙蹂�</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�뙋留� 紐⑸줉</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">�젣�뭹 異붽���븯湲�</a></li>
			</ul>
		</c:when> --%>
		
		<%-- �뙋留ㅼ옄 濡쒓렇�씤 �떆 --%>
        <c:when test="${sessionScope.user_type == 1}">
        	<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�궡 �뙋留� 紐⑸줉</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">�궡 �븣�엺 議고쉶</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">�궡 �젙蹂� �닔�젙</a></li>
>>>>>>> 09fa1094dfb85a9589b0bc4d496a1a4fde0f20be
			</ul>        	
        </c:when>
	</c:choose>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myfruit.css" />
</head>
<body>
	<c:choose>
		<%-- 愿�由ъ옄 濡쒓렇�씤 �떆 --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�궡 �젙蹂�</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">�쉶�썝愿�由�</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�젣�뭹愿�由�</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">�떊怨� 紐⑸줉 �솗�씤</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">移댄뀒怨좊━ 愿�由�</a></li>
			</ul>
		</c:when> --%>
		
		<%-- �뙋留ㅼ옄 濡쒓렇�씤 �떆 --%>
		<%-- <c:when test="${sessionScope.user_type == 1}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�궡 �젙蹂�</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�뙋留� 紐⑸줉</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">�젣�뭹 異붽���븯湲�</a></li>
			</ul>
		</c:when> --%>
		
		<%-- �뙋留ㅼ옄 濡쒓렇�씤 �떆 --%>
        <c:when test="${sessionScope.user_type == 1}">
        	<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�궡 �뙋留� 紐⑸줉</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">�궡 �븣�엺 議고쉶</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">�궡 �젙蹂� �닔�젙</a></li>
			</ul>        	
        </c:when>
	</c:choose>
</body>
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
</html>