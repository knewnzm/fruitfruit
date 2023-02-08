<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8" />
 <title>fruitfruit - 신고 상세 페이지 </title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reportForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<body>
	<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<main class="report-container">
<form id="contentForm" action="${pageContext.request.contextPath}">
	<div class="content">
	  <div class="report_wrap">
      	<input type="hidden" name="report_num" value="${n.report_num}" />
      	<div class="report_line_1">
      			<div class="report_btn_wrap">
      					<c:if test="${user_type==3}">
            				<button  type="button" class="edit_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/report/report_edit?report_num=${r.report_num}`" >수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/report/report_delete?report_num=${r.report_num}`">삭제하기
             				</button>
            		 	</c:if>
            	</div>		 
      			<div class="report_title">
      					<h1 class="title_text">${r.report_title}</h1>
      			</div>
        </div>     
         <div class="report_line">
				<div class="report_date">
         				${r.report_date}
				</div>
				<div class="report_hit">
			       	  	조회수 | ${r.report_hit}
				</div>         
        </div>    
        <div class="report_v_content">
        		<div class="report_img_box">
        			<c:if test="${not empty r.report_path}">
                                <div class="carousel-item active">
                                    <a href="${r.report_path}" target="blank">
                                        <img src="${r.report_path}" alt="${r.report_title}" id="img1" class="d-block w-100 product-img" itemid="0" />
                                    </a>
                                </div>
                     </c:if>
        		</div>
        		<div class="report_d_content_box">
           			${r.report_content}
        		</div>
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