<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8" />
 <title>ㅍㄿㄹ - ${n.notice_title}</title>
</head>
<style type="text/css">
*{
  padding:0;
  margin: 0;
  box-sizing: border-box; 
  border: 0;
  font-family: 'Noto Sans KR', sans-serif;
  font-weight: 400;
}
a {
   text-decoration:none !important;
   cursor: pointer;
}
a:hover { 
	text-decoration:none !important;
}
li{
display : inline-block;
}
ul{
list-style:none;
}
.ntcontainer{
	width:auto;
 	height:1500px;
	display: flex;
	justify-content: center;
}
.content{
	width:1000px;
	margin-top:100px;
    text-align : center;
    padding : 0px;
    grid-template-columns: 
        [left-navbar-start] 20%
        [left-navbar-end content-start] 60%
        [content-end right-sidebar-start] 20%
        [right-sidebar-end];
    grid-template-rows: 
        [body-start] 80%
        [body-end footer-start] 20%
        [footer-end];
}
.notice_wrap{
	border: 1px solid #f02c11;
	border-radius:8px;
	padding-left: 30px;
    padding-right: 30px;
}
.notice_line_1{
	display: flex;
	text-align : center;
	align-items: center;
	padding-top:30px;
}
.notice_line{
	display: flex;
	text-align : center;
	align-items: center;
	padding-bottom:10px;
	border-bottom: 1px solid #B6B6B4;
}
.notice_type{
	width:100px;
	text-align:left;
}
.notice_title{
	width:600px;
	text-align:left;
	margin-right:100px;
}
.notice_btn_wrap{
	width:200px;
}
.notice_date{
	width:180px;
	color:#777;
}
.notice_hit{
	width:90px;
	color:#777;
	margin-left:5px;
}
.notice_v_content{
	padding-top:50px;
	padding-bottom:50px;
}
.back_btn_box{
	padding-top:50px;
}
.edit_btn{
	width:80px;
	height:35px;
	background:#f02c11;
  	color:white;
  	font-size:13px;
}
.del_btn{
	width:80px;
	height:35px;
	border:1px solid #f02c11;
	background:white;
	color:#f02c11;
	font-size:13px;
}
.back_btn{
  width:200px;
  height: 50px;
  background:#f02c11;
  color:white;
  border-radius:5px;
  text-align:center;
  cursor: pointer; 
  font-size:15px;
}
</style>
<body>
	<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<main class="ntcontainer"> <!-- 프룻프룻 옮길 때 수정 -->
<form id="contentForm" action="${pageContext.request.contextPath}">
	<div class="content">
	  <div class="notice_wrap">
      	<input type="hidden" name="notice_num" value="${n.notice_num}" />
      	<div class="notice_line_1">
      			<div class="notice_type">
      					[공지사항]
      			</div>
      			<div class="notice_title">
      					<h1>${n.notice_title}</h1>
      			</div>
      			<div class="notice_btn_wrap">
      					<c:if test="${user_type==2}">
            				<button  type="button" class="edit_btn" 
            				<%-- onclick="location.href=`${pageContext.request.contextPath}/notice/notice_edit?notice_num=${n.notice_num}`" --%>>수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/notice/notice_delete?notice_num=${n.notice_num}`">삭제하기
             				</button>
            		 	</c:if>
            	</div>		 
        </div>     
        <div class="notice_line">
				<div class="notice_date">
         				<fmt:formatDate value="${n.notice_date}" pattern="YYYY년 MM월 dd일 hh:mm" />
				</div>
				<div class="notice_hit">
			       	  	조회수 | ${n.notice_hits}
				</div>         
        </div>    
        <div class="notice_v_content">
           		${n.notice_content}
        </div>    
       </div>   
			<div class="back_btn_box">
           				<button class="back_btn" type="button" onClick="history.back();">목록으로</button>
           </div>
	</div> 		     
    </form>
 </main>
 	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
</body>
</html>