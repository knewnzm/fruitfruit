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
			</ul>        	
        </c:when>
	</c:choose>
</body>
</html>