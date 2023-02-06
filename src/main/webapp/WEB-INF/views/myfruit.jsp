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
			</ul>
		</c:when> --%>
		
		<%-- �Ǹ��� �α��� �� --%>
		<%-- <c:when test="${sessionScope.user_type == 1}">
			<ul>
			  <li><a href="${pageContext.request.contextPath}/member/main">�� ����</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�Ǹ� ���</a></li>
			  <li><a href="${pageContext.request.contextPath}/product/add">��ǰ �߰��ϱ�</a></li>
			</ul>
		</c:when> --%>
		
		<%-- �Ǹ��� �α��� �� --%>
        <c:when test="${sessionScope.user_type == 1}">
        	<ul class="myfruit">
			  <li><a href="${pageContext.request.contextPath}/product/mylist">�� �Ǹ� ���</a></li>
			  <li><a href="${pageContext.request.contextPath}/alram/mylist">�� �˶� ��ȸ</a></li>
			  <li><a href="${pageContext.request.contextPath}/member/editForm">�� ���� ����</a></li>
			</ul>        	
        </c:when>
	</c:choose>
</body>
</html>