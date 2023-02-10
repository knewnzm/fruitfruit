<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
[
	<c:forEach var="i" items="${cate_list }" varStatus="status">
		<c:if test="${not status.first }">
			,
		</c:if>
		{"num":${i.cate_num }, "name":"${i.cate_name }"}
	</c:forEach>
]
 --%>