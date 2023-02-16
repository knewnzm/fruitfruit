<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8" />
	    <title>fruitfruit - 구매자목록</title>
	    <script>
	        if ("${sessionScope.user_id}" === "") {
	            alert("로그인이 필요한 페이지입니다.");
	            location.href = `${pageContext.request.contextPath}/member/loginForm`;
	        }
	        
	    </script>
	    <link rel="stylesheet" href="/static/css/product_list.css" />
	</head>
	<body>
		<c:import url="../head.jsp"></c:import>
		<c:import url="../header.jsp"></c:import>

		<div style="width:100%; min-height:100%">
			<div class="left">
				<c:import url="../myfruit.jsp" />
		    </div>
		    
		    <div class="right">
				<div class="container">
					<div>
						<h1>구매자 목록 조회하기</h1>
					</div>		
							
					<div>
		                <c:import url="./orderImportList.jsp"></c:import>
					</div>
		        </div>
		    </div>	
		</div>	
		
		<c:import url="../footer.jsp"></c:import>	
		 
	</body>
</html>
