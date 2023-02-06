<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpDetail  ${h.help_title}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpDetail.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
</head>
<body>
<header>
	<c:import url="../head.jsp"></c:import>
	<c:import url="../header.jsp"></c:import>
</header>
<main class="hpcontainer"> 
	<div class="content">
	  <div class="help_wrap">
	  <form id="contentForm" action="${pageContext.request.contextPath}">
      	<input type="hidden" name="help_num" value="${h.help_num}" />
      	<div class="help_line">
      			<div class="help_type">
      					[회원정보]
      			</div>
      			<div class="help_title">
      					<h1 class="title_text">제목입니다${h.help_title}</h1>
      			</div>
      			<div class="help_btn_wrap">
      					<c:if test="${user_type==1}"> <!-- sesseionScope -->
            				<button  type="button" class="edit_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/help_edit?help_num=${h.help_num}`" >수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/help_delete?help_num=${h.help_num}`">삭제하기
             				</button>
            		 	</c:if>
            		 	<c:if test="${user_type==2}"> <!-- sesseionScope -->
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
        		<div class="help_img_box">
        			<c:if test="${not empty h.help_path}">
        						이미지 들어올 자리
                                <div class="carousel-item active">
                                    <a href="${h.help_path}" target="blank">
                                        <img src="${h.help_path}" alt="${h.help_title}" id="img1" class="d-block w-100 product-img" itemid="0" />
                                    </a>
                                </div>
                     </c:if>
        		</div>
           		<div class="hp_d_content_box">
           			${h.help_content}
        		</div>
        </div>
        <c:if test="${user_type==3}">
        		<div class="hp_d_r_box">
        			<textarea name="reply_content" class="reply_w_content">댓글 입력 칸</textarea>
					<button type="submit" class="hp_r_submit" >등록</button>
       		 	</div>
        </c:if>    
       </form>
       </div>
     <%-- <form id="replyForm" action="${pageContext.request.contextPath}"> --%>
       	<div class="reply_list">
       		<div class="r_title_box">
       				<input type="hidden" name="reply_num" value="${hr.reply_num}" />
       				<input type="hidden"name="user_id" value="${hr.user_id}"/>
       				프룻프룻 | 등록일 2023.02.05 ${hr.reply_date}
       				<c:if test="${user_type==3}"> <!-- sesseionScope -->
       					<div class="hr_btn_wrap">
            				<button type="button" class="modal_btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">수정하기</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/reply_delete?help_num=${hr.reply_num}`">삭제하기
             				</button>
             			</div>	
            		</c:if>
      	 	</div>
       		<div class="r_content_box">
       				확인용 댓글 출력칸입니다. ${hr.reply_content}
       				확인용 댓글 출력칸입니다.확인용 댓글 출력칸입니다.
       				확인용 댓글 출력칸입니다. 확인용 댓글 출력칸입니다.
       				확인용 댓글 출력칸입니다.확인용 댓글 출력칸입니다.
       				확인용 댓글 출력칸입니다. 확인용 댓글 출력칸입니다.
       				확인용 댓글 출력칸입니다. 확인용 댓글 출력칸입니다.
       		</div>
      </div> 
	<!-- </form> -->
			<div class="back_btn_box">
           				<button class="back_btn" type="button" onClick="history.back();">목록으로</button>
           </div>
	</div> 		     
 </main>
<footer>
	<c:import url="../footer.jsp"></c:import>
</footer>
<!--수정 Modal -->
					 <div class="modal">
    					 <div class="modal_container">
    					 	<div class="modal_header">
      							<h2>문의 답글 수정</h2>
      						</div>
      						<div class="modal_body">
      							<textarea name="reply_content" class="reply_e_content" value="">
      								문의 답글 내용입니다 문의 답글 내용입니다 문의 답글 내용입니다 
      								문의 답글 내용입니다 문의 답글 내용입니다 문의 답글 내용입니다 
      								문의 답글 내용입니다 문의 답글 내용입니다 문의 답글 내용입니다 
      								문의 답글 내용입니다 문의 답글 내용입니다 문의 답글 내용입니다
      							</textarea>
      						</div>
      						<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn"  data-bs-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="modal_edit_btn" >수정</button>
      						</div>
    					 </div>
    				</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
/* 모달 */
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.modal_btn');
      const btnClose = document.querySelector('.modal_close_btn');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
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