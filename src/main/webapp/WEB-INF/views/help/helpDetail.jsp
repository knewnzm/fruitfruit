<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프룻프룻 1:1문의 | ${h.help_title}</title>
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
      	<input type="hidden" name="help_num" value="${h.help_num}" />
      	<div class="help_line">
      			<div class="help_type">
      					 <c:if test="${h.help_type ==1}">[회원정보]</c:if>
                   		 <c:if test="${h.help_type ==2}">[주문]</c:if>
                   		 <c:if test="${h.help_type ==3}">[상품]</c:if>
                   		 <c:if test="${h.help_type ==4}">[배송]</c:if>
                   		 <c:if test="${h.help_type ==5}">[기타]</c:if>
      			</div>
      			<div class="help_title">
      					<h1 class="title_text">${h.help_title}</h1>
      			</div>
      			<div class="help_btn_wrap">
      					<c:if test="${sessionScope.user_id==h.help_writer_id}"> <!-- sesseionScope -->
            				<button  type="button" class="edit_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/helpEdit?help_num=${h.help_num}`" >수정하기
             				</button>
             				<button  type="button" class="del_btn" 
            				onclick="location.href=`${pageContext.request.contextPath}/help/helpDelete?help_num=${h.help_num}`">삭제하기
             				</button>
            		 	</c:if>
            	</div>		 
        </div>     
        <div class="help_line2">
				<div class="help_id_box">
			       	  	회원아이디&nbsp;&nbsp;${h.help_writer_id}
				</div>         
        </div>
         <div class="help_line2">    
				<div class="help_date">
         				등록일&nbsp;&nbsp;${h.help_date}
				</div>
		</div>		
        <div class="help_v_content">
        		<div class="help_img_box">
        			<c:if test="${not empty h.help_path}">
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
        <c:if test="${user_type==3&& empty a}">
        		<div class="hp_d_r_box">
        		<form id="answerForm" action="${pageContext.request.contextPath}/answer/insert" method="post">
        			<textarea name="answer_content" class="reply_w_content">댓글 입력 칸</textarea>
        			<input type="hidden" name="help_num" value="${h.help_num }">
        			<input type="hidden" name="user_id" value="${sessionScope.user_id }">
					<button type="submit" class="hp_r_submit" >등록</button>					
					</form>
       		 	</div>
        </c:if>    
       
       </div>
    
     <c:if test="${not empty a}">
       	<div class="reply_list">
       		<div class="r_title_box">
       				상담사 ${m.user_name } | 등록일 ${a.answer_date}
       				<c:if test="${sessionScope.user_id==a.user_id}">
       					<div class="hr_btn_wrap">
            				<button type="button" class="modal_btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">수정하기</button>
             				<button  type="button" class="del_btn" 
             				onclick="location.href='${pageContext.request.contextPath}/answer/delete?answer_num=${a.answer_num }'">삭제하기</button>
             			</div>	
            		</c:if>
      	 	</div>
       		<div class="r_content_box">
       		${a.answer_content }	
       		</div>
      </div> 
      </c:if>
	<!-- </form> -->
			<div class="back_btn_box">
           				<button class="back_btn" type="button" onclick="location.href='${pageContext.request.contextPath}/help/helpList'">목록으로</button>
           </div>
	</div> 		     
 </main>
<footer>
	<c:import url="../footer.jsp"></c:import>
</footer>
<!--수정 Modal -->
<form name="e" action="${pageContext.request.contextPath }/answer/edit" method="post">
					 <div class="modal">
    					 <div class="modal_container">
    					 	<div class="modal_header">
      							<h2>문의 답글 수정</h2>
      						</div>
      						<div class="modal_body">
      							<textarea name="answer_content" class="reply_e_content">${a.answer_content }
      							</textarea>
      						</div>
      						<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn"  data-bs-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="modal_edit_btn" onclick="document.e.submit()">수정</button>
      						</div>
    					 </div>
    				</div>
    				      <input type="hidden" name="answer_num" value="${a.answer_num }">
    				      <input type="hidden" name="help_num" value="${a.help_num }">
      </form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
/* 모달 */
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.modal_btn');
      const btnClose = document.querySelector('.modal_close_btn');

      /* 버튼 눌렀을 때  */
      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });
		/* esc 키 눌러서  */
      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
		/* 취소 버튼 눌러서 */
      btnClose.addEventListener('click', () => {
    	  modal.classList.remove('show');
    	  body.style.overflow = 'auto';
    	});
//

</script>
</html>