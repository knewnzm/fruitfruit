<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>fruitfruit - 알람조회</title>
    <script>
        if ("${sessionScope.user_id}" === "") {
            alert("로그인이 필요한 페이지입니다.");
            location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
        }
    </script>
    <link rel="stylesheet" href="/static/css/alram_list.css" />
</head>
<body>
	<c:import url="../head.jsp"></c:import>
	<c:import url="../header.jsp"></c:import>
	
	<div style="width:100%; height:100%">
		<div class="left">
			<c:import url="../myfruit.jsp" />
	    </div>
	
		<div class="right">
			<div class="container">
				<h1>내 알람 조회</h1>
			</div>
			
			<div>
				<c:import url="./importList.jsp"></c:import>
			</div>
		</div>
	</div>
</body>
</html>
