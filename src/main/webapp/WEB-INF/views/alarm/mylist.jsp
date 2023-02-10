<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>sadaRe: 사다리 - 알람조회</title>
    <script>
        if ("${sessionScope.user_id}" === "") {
            alert("로그인이 필요한 페이지입니다.");
            location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
        }
    </script>
    <link rel="stylesheet" href="/static/css/alram_list.css" />
</head>
<body>
	<div style="width:100%">
		<div class="left">
			<c:import url="../myfruit.jsp" />
		</div>
	</div>
	
	<div class="right">
		<div class="container">
			<h1>내 알람 조회</h1>
			<c:import url="./importList.jsp"></c:import>
		</div>
	</div>
</body>
</html>
