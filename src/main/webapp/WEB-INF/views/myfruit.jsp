<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/myfruit.css" />
</head>
<body>
	<c:choose>
		<%-- ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">È¸ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">ï¿½ï¿½Ç°ï¿½ï¿½ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">ï¿½Å°ï¿½ ï¿½ï¿½ï¿½ È®ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">Ä«ï¿½×°ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½</a></li>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/static/css/myfruit.css" />
</head>
<body>
	<c:choose>
		<%-- °ü¸®ÀÚ ·Î±×ÀÎ ½Ã --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/member/main">³» Á¤º¸</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">È¸¿ø°ü¸®</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">Á¦Ç°°ü¸®</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">½Å°í ¸ñ·Ï È®ÀÎ</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">Ä«Å×°í¸® °ü¸®</a></li>
>>>>>>> d2785119e8b1c407fca0b4a1328d6853658bacc6
			</ul>
		</c:when>
		
<<<<<<< HEAD
		<%-- ï¿½Ç¸ï¿½ï¿½ï¿½ ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ --%>
		<%-- <c:when test="${sessionScope.user_type == 1}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">ï¿½Ç¸ï¿½ ï¿½ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">ï¿½ï¿½Ç° ï¿½ß°ï¿½ï¿½Ï±ï¿½</a></li>
=======
		ÆÇ¸ÅÀÚ ·Î±×ÀÎ ½Ã
		<c:when test="${sessionScope.user_type == 2}">
			<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/member/main">³» Á¤º¸</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">ÆÇ¸Å ¸ñ·Ï</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">Á¦Ç° Ãß°¡ÇÏ±â</a></li>
>>>>>>> d2785119e8b1c407fca0b4a1328d6853658bacc6
			</ul>
		</c:when> --%>
		
		<%-- ï¿½Ç¸ï¿½ï¿½ï¿½ ï¿½Î±ï¿½ï¿½ï¿½ ï¿½ï¿½ --%>
        <c:when test="${sessionScope.user_type == 1}">
        	<ul class="myfruit">
<<<<<<< HEAD
			  <li><a href="${pageContext.request.contextPath}/product/mylist">ï¿½ï¿½ ï¿½Ç¸ï¿½ ï¿½ï¿½ï¿½</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">ï¿½ï¿½ ï¿½Ë¶ï¿½ ï¿½ï¿½È¸</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½</a></li>
=======
			  <li><a href="${pageContext.request.contextPath}/product/mylist">³» ÆÇ¸Å ¸ñ·Ï</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">³» ¾Ë¶÷ Á¶È¸</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">³» Á¤º¸ ¼öÁ¤</a></li>
>>>>>>> d2785119e8b1c407fca0b4a1328d6853658bacc6
			</ul>        	
        </c:when>
	</c:choose>
</body>
</html>