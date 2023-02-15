<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8" />
 <title>프룻프룻
       	  <c:if test="${n.notice_type ==1}"> 공지사항 </c:if>
          <c:if test="${n.notice_type ==2}"> 이벤트 </c:if>
		   | ${n.notice_title}
  </title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<main class="ntcontainer">
<form id="contentForm" action="${pageContext.request.contextPath}">
	<div class="content">
	  <div class="notice_wrap">
      	<input type="hidden" name="notice_num" value="${n.notice_num}" />
      	<div class="notice_line_1">
      			<div class="notice_type">
      					<c:if test="${n.notice_type ==1}"> 공지사항 </c:if>
                   		<c:if test="${n.notice_type ==2}"> 이벤트 </c:if>
      			</div>
      			<div class="notice_btn_wrap">
      					<c:if test="${user_type==3}">
            				<button  type="button" class="edit_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/notice/noticeEdit?notice_num=${n.notice_num}`" >수정하기
             				</button>
             				<button  type="button" class="modal_btn" data-bs-toggle="modal"  data-target="#ndModal"> 삭제하기 </button>
            		 	</c:if>
            	</div>		 
      			<div class="notice_title">
      					<h1 class="title_text">${n.notice_title}</h1>
      			</div>
        </div>     
         <div class="notice_line">
				<div class="notice_date">
         				${n.notice_date}
				</div>
				<div class="notice_hit">
			       	  	조회수 | ${n.notice_hit}
				</div>         
        </div>    
        <div class="notice_v_content">
        		<div class="notice_img_box">
        			<c:if test="${not empty n.notice_path}">
                                <div class="carousel-item active">
                                    <a href="${n.notice_path}" target="blank">
                                        <img src="${n.notice_path}" alt="${n.notice_title}" id="img1" class="d-block w-100 product-img" itemid="0" />
                                    </a>
                                </div>
                     </c:if>
        		</div>
        		<div class="nt_d_content_box">
           			${n.notice_content}
        		</div>
        </div>    
		</div>
		<div class="back_btn_box">
           		<button class="back_btn" type="button" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList'">목록으로</button>
          </div>
	</div> 		     
    </form>
 </main>
		 <c:import url="../footer.jsp"></c:import>
	

<form name="nd" action="${pageContext.request.contextPath}/notice/noticeDelete?notice_num=${n.notice_num}" method="post">
	<div class="modal" id="ndModal">
    		<div class="modal_container">
    				<div class="modal_header">
      						<h2>삭제하기</h2>
      				</div>
      				<div class="modal_body">
      							등록한 문의글을 삭제하시겠습니까?
      				</div>
      				<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn"  data-bs-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="modal_del_btn" onclick="document.nd.submit()">삭제</button>
      				</div>
    		 </div>
    	</div>
 </form>  	
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.modal_btn');
const btnClose = document.querySelector('.modal_close_btn');

	 btnOpenPopup.addEventListener('click', () => {
			modal.classList.toggle('show');
			   if (modal.classList.contains('show')) {
	  			}
	});

	modal.addEventListener('click', (event) => {
			 if (event.target === modal) {
				 modal.classList.toggle('show');
				 if (!modal.classList.contains('show')) {
					 body.style.overflow = 'auto';
					 }
			 }
	});
	btnClose.addEventListener('click', () => {
			modal.classList.remove('show');
				 body.style.overflow = 'auto';
	});

</script>
</html>