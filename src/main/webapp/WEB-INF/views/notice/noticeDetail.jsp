<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8" />
 <title>ㅍㄿㄹ - ${n.notice_title}</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<body>
	<header>
		<c:import url="../head.jsp"></c:import>
        <c:import url="../header.jsp"></c:import>
	</header>
<<<<<<< HEAD
<main class="ntcontainer">
<form id="contentForm" action="${pageContext.request.contextPath}">
=======
<main class="ntcontainer"> <!-- 프룻프룻 옮길 때 수정 -->
<form id="contentForm" action="${pageContext.request.contextPath}/notice/noticeEdit">
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
	<div class="content">
	  <div class="notice_wrap">
      	<input type="hidden" name="notice_num" value="${n.notice_num}" />
      	<div class="notice_line_1">
      			<div class="notice_type">
<<<<<<< HEAD
      					<c:if test="${n.notice_type ==1}"> 공지사항 </c:if>
                   		<c:if test="${n.notice_type ==2}"> 이벤트 </c:if>
      			</div>
      			<div class="notice_btn_wrap">
      					<c:if test="${user_type==3}">
            				<button  type="button" class="edit_btn" 
            				<%-- onclick="location.href=`${pageContext.request.contextPath}/notice/notice_edit?notice_num=${n.notice_num}`" --%>>수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/notice/notice_delete?notice_num=${n.notice_num}`">삭제하기
=======
      					[공지사항]
      			</div>
      			<div class="notice_btn_wrap">
      					<c:if test="${user_type==3}">
            				<button  type="submit" class="edit_btn" 
            				>수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/notice/noticeDelete?notice_num=${n.notice_num}`">
            				삭제하기
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
             				</button>
            		 	</c:if>
            	</div>		 
      			<div class="notice_title">
      					<h1 class="title_text">${n.notice_title}</h1>
      			</div>
        </div>     
<<<<<<< HEAD
         <div class="notice_line">
=======
        <div class="notice_line">
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
				<div class="notice_date">
         				${n.notice_date}
				</div>
				<div class="notice_hit">
			       	  	조회수 | ${n.notice_hit}
				</div>         
        </div>    
        <div class="notice_v_content">
<<<<<<< HEAD
        		<div class="notice_img_box">
=======
        		<div class="notice_path_box">
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
        			<c:if test="${not empty n.notice_path}">
                                <div class="carousel-item active">
                                    <a href="${n.notice_path}" target="blank">
                                        <img src="${n.notice_path}" alt="${n.notice_title}" id="img1" class="d-block w-100 product-img" itemid="0" />
                                    </a>
                                </div>
<<<<<<< HEAD
                     </c:if>
        		</div>
        		<div class="nt_d_content_box">
           		${n.notice_content}
        		</div>
        </div>    
		</div>
		<div class="back_btn_box">
           		<button class="back_btn" type="button" onClick="history.back();">목록으로</button>
          </div>
=======
                            </c:if>
        		</div>
           		${n.notice_content}
        </div>    
       </div>   
			<div class="back_btn_box">
           				<button class="back_btn" type="button" onClick="history.back();">목록으로</button>
           </div>
>>>>>>> 99ca4051e843273392edc4615f4b12587c1b6258
	</div> 		     
    </form>
 </main>
 	<footer>
		 <c:import url="../footer.jsp"></c:import>
	</footer>
</body>
</html>