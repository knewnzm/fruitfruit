<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpDetail  ${h.help_title}</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<header>
	<c:import url="../head.jsp"></c:import>
	<c:import url="../header.jsp"></c:import>
</header>
<body>
<main class="hpcontainer"> <!-- 프룻프룻 옮길 때 수정 -->
<form id="contentForm" action="${pageContext.request.contextPath}">
	<div class="content">
	  <div class="help_wrap">
      	<input type="hidden" name="help_num" value="${h.help_num}" />
      	<div class="help_line">
      			<div class="help_type">
      					[회원정보]
      			</div>
      			<div class="help_title">
      					<h1 class="title_text">제목입니다${h.help_title}</h1>
      			</div>
      			<div class="help_btn_wrap">
      					<c:if test="${user_type==3}"> <!-- sesseionScope -->
            				<button  type="button" class="edit_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/help_edit?help_num=${h.help_num}`" >수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/help_delete?help_num=${h.help_num}`">삭제하기
             				</button>
            		 	</c:if>
            	</div>		 
        </div>     
        <div class="help_line2">
				<div class="help_id_box">
			       	  	회원아이디 ${h.writer_id}
				</div>         
        </div>
         <div class="help_line2">    
				<div class="help_date">
         				등록일 <fmt:formatDate value="${h.help_date}" pattern="YYYY년 MM월 dd일 hh:mm" />
				</div>
		</div>		
        <div class="help_v_content">
        		<div class="help_path_box">
        			이미지 들어 올 자리
        		</div>
           		${h.help_content}
        </div>    
       </div>   
			<div class="back_btn_box">
           				<button class="back_btn" type="button" onClick="history.back();">목록으로</button>
           </div>
	</div> 		     
    </form>
 </main>
</body>
<footer>
	<c:import url="../footer.jsp"></c:import>
</footer>
</html>