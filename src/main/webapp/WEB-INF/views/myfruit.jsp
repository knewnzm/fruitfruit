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
		<%-- ������ �α��� �� --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�� ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">ȸ������</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">��ǰ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">�Ű� ��� Ȯ��</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">ī�װ��� ����</a></li>
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
		<%-- ������ �α��� �� --%>
        <%-- <c:when test="${sessionScope.user_type == 3}">
			<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/member/main">�� ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/list">ȸ������</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">��ǰ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/report/reportList">�Ű� ��� Ȯ��</a></li>
			  <li><a href="${pageContext.request.contextPath}/admin/category">ī�װ� ����</a></li>
>>>>>>> d2785119e8b1c407fca0b4a1328d6853658bacc6
			</ul>
		</c:when>
		
<<<<<<< HEAD
		<%-- �Ǹ��� �α��� �� --%>
		<%-- <c:when test="${sessionScope.user_type == 1}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�� ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�Ǹ� ���</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">��ǰ �߰��ϱ�</a></li>
=======
		�Ǹ��� �α��� ��
		<c:when test="${sessionScope.user_type == 2}">
			<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/member/main">�� ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�Ǹ� ���</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">��ǰ �߰��ϱ�</a></li>
>>>>>>> d2785119e8b1c407fca0b4a1328d6853658bacc6
			</ul>
		</c:when> --%>
		
		<%-- �Ǹ��� �α��� �� --%>
        <c:when test="${sessionScope.user_type == 1}">
        	<ul class="myfruit">
<<<<<<< HEAD
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�� �Ǹ� ���</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">�� �˶� ��ȸ</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">�� ���� ����</a></li>
=======
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�� �Ǹ� ���</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">�� �˶� ��ȸ</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">�� ���� ����</a></li>
>>>>>>> d2785119e8b1c407fca0b4a1328d6853658bacc6
			</ul>        	
        </c:when>
	</c:choose>
</body>
</html>