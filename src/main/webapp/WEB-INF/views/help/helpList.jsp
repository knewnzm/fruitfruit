<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>helpList</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
	  
	  $('ul.tab_list li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tab_list li').removeClass('current');
	    $('.tab_pannel').removeClass('current');

	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	})
</script>
<body>

</body>
</html>