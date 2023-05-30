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
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<main class="hpcontainer"> 
	<div class="content">
	  <div class="help_wrap"> 
      	<input type="hidden" name="help_num" value="${h.help_num}" />
      	<div class="help_line">
      			<div class="help_1line">
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
      			</div>
      			<div class="help_btn_wrap">
      					<c:if test="${sessionScope.user_id==h.help_writer_id}"> <!-- sesseionScope -->
            							<button  type="button" class="edit_btn" 
            							 onclick="location.href=`${pageContext.request.contextPath}/help/helpEdit?help_num=${h.help_num}`" >
            							 수정하기
             							</button>
             							<button  type="button" class="hd_modal_btn" data-bs-toggle="modal"  data-target="#hdModal"> 삭제하기 </button>
            		 	</c:if>
            		 	<c:if test="${user_type==3}">
            		 					<button  type="button" class="hd_modal_btn2" data-bs-toggle="modal"  data-target="#hdModal2"> 삭제하기 </button>
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
									<c:forEach var="imagePath" items="${h.help_path}">
										<img src="${imagePath}" alt="Image">
									</c:forEach>
								</a>
                                </div>
                     </c:if>
        		</div>
           		<div class="hp_d_content_box">
           			${h.help_content}
        		</div>
        </div>
           <!-- 답글 등록 -->
        <c:if test="${user_type==3&& empty a}"> <!-- 관리자이고 등록된 답글이 없으면 등록폼 생성 -->
        		<div class="hp_d_r_box">
        		<form id="answerForm" action="${pageContext.request.contextPath}/answer/insert" method="post">
        			<textarea name="answer_content" class="reply_w_content" placeholder="답변을 입력해주세요." required></textarea>
        			<input type="hidden" name="help_num" value="${h.help_num }">
        			<input type="hidden" name="user_id" value="${sessionScope.user_id }">
					<button type="submit" class="hp_r_submit" >등록</button>					
					</form>
       		 	</div>
        </c:if>    
       
       </div>
      <!-- 답글 조회 -->
     <c:if test="${not empty a}">
       	<div class="reply_list">
       		<div class="r_title_box">
       				상담사 ${m.user_nick } | 등록일 ${a.answer_date}
       				<c:if test="${sessionScope.user_id==a.user_id}">
       					<div class="hr_btn_wrap">
            				<button type="button" class="re_modal_btn" data-toggle="modal" data-target="#reModal">수정하기</button>
             				<button type="button" class="rd_modal_btn"  data-toggle="modal" data-target="#rdModal">삭제하기</button>
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
<c:import url="../footer.jsp"></c:import>
<!-- help 삭제 Modal -->
<c:if test="${user_type==1|| user_type==2}">
<form name="hd" action="${pageContext.request.contextPath}/help/helpDelete?help_num=${h.help_num}" method="post">
	<div class="modal hd_modal" id="hdModal">
    		<div class="modal_container">
    				<div class="modal_header">
      						<h2>삭제하기</h2>
      				</div>
      				<div class="modal_body">
      							등록한 문의글을 삭제하시겠습니까?
      				</div>
      				<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn"  data-bs-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="modal_del_btn" onclick="document.hd.submit()">삭제</button>
      				</div>
    				</div>
    	</div>
 </form>  	
 </c:if>
<c:if test="${user_type==3}">

<!-- help 삭제 -->
<form name="hd2" action="${pageContext.request.contextPath}/help/helpDelete?help_num=${h.help_num}" method="post">
	<div class="modal hd_modal2" id="hdModal2">
    		<div class="modal_container">
    				<div class="modal_header">
      						<h2>삭제하기</h2>
      				</div>
      				<div class="modal_body">
      							등록한 문의글을 삭제하시겠습니까?
      				</div>
      				<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn1"  data-bs-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="modal_del_btn" onclick="document.hd2.submit()">삭제</button>
      				</div>
    				</div>
    	</div>
 </form>  	

<!-- answer 수정 Modal -->
<form name="ae" action="${pageContext.request.contextPath }/answer/edit" method="post">
			<div class="modal re_modal" id="reModal">
    					 <div class="modal_container">
    					 	<div class="modal_header">
      							<h2>문의 답글 수정</h2>
      						</div>
      						<div class="modal_body">
      							<textarea name="answer_content" class="reply_e_content">${a.answer_content }
      							</textarea>
      						</div>
      						<div class="modal_footer">
                        	    <button type="button" class="modal_close_btn2"  data-dismiss="modal" aria-label="Close">취소</button>
                              	<button type="button" class="modal_edit_btn" onclick="document.ae.submit()">수정</button>
      						</div>
    					 </div>
    			</div>
    				      <input type="hidden" name="answer_num" value="${a.answer_num }">
    				      <input type="hidden" name="help_num" value="${a.help_num }">
</form>
<!-- answer 삭제 Modal -->
<form name="deleteForm" action="${pageContext.request.contextPath }/answer/delete" method="GET">
 <input type="hidden" name="answer_num" value="${a.answer_num }">
 <input type="hidden" name="_method" value="DELETE"/>
    		<div class="modal rd_modal" id="rdModal">
      				  <div class="modal_container">
            				<div class="modal_header">
               								 <h2>삭제하기</h2>
           					 </div>
           					 <div class="modal_body">
               								 등록한 답변을 삭제하시겠습니까?
          					 </div>
           					 <div class="modal_footer">
                							<button type="button" class="modal_close_btn3"  data-dismiss="modal" aria-label="Close">취소</button>
                							<button type="button" class="r_del_btn" onclick="document.deleteForm.submit()">삭제</button>
                							
            				</div>
       				 </div>
    		</div>
    		</form>
</c:if>  	

</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
/* 모달 */
const userType = "${user_type}"
const body = document.querySelector('body');

const modal = document.querySelector('.hd_modal');
const modal1 = document.querySelector('.hd_modal2');
const modal2 = document.querySelector('.re_modal');
const modal3 = document.querySelector('.rd_modal');

const btnOpenPopup = document.querySelector('.hd_modal_btn');
const btnOpenPopup1 = document.querySelector('.hd_modal_btn2');
const btnOpenPopup2 = document.querySelector('.re_modal_btn');
const btnOpenPopup3 = document.querySelector('.rd_modal_btn');

const btnClose = document.querySelector('.modal_close_btn');
const btnClose1 = document.querySelector('.modal_close_btn1');
const btnClose2 = document.querySelector('.modal_close_btn2');
const btnClose3 = document.querySelector('.modal_close_btn3');

 if (userType === "1" || userType === "2") {
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
 }
 if (userType === "3" ) {
	 	btnOpenPopup1.addEventListener('click', () => {
			modal1.classList.toggle('show');
			   if (modal.classList.contains('show')) {
	  			}
		});
	 	btnOpenPopup2.addEventListener('click', () => {
	 		  modal2.classList.toggle('show');
	 		  if (modal.classList.contains('show')) {
	 		  }
	 	});
	 	btnOpenPopup3.addEventListener('click', () => {
	 		  modal3.classList.toggle('show');
	 		  if (modal.classList.contains('show')) {
	 		  }
	 	});
	 	
	 	modal1.addEventListener('click', (event) => {
			 if (event.target === modal1) {
					 modal1.classList.toggle('show');
					 if (!modal1.classList.contains('show')) {
					 body.style.overflow = 'auto';
						 }
				 }
		});
	 	
	 	modal2.addEventListener('click', (event) => {
			 if (event.target === modal2) {
					 modal2.classList.toggle('show');
					 if (!modal2.classList.contains('show')) {
					 body.style.overflow = 'auto';
						 }
				 }
		});
	 	
	 	modal3.addEventListener('click', (event) => {
			 if (event.target === modal3) {
					 modal3.classList.toggle('show');
					 if (!modal3.classList.contains('show')) {
					 body.style.overflow = 'auto';
						 }
				 }
		});
	 	
		btnClose1.addEventListener('click', () => {
 			modal1.classList.remove('show');
				 body.style.overflow = 'auto';
		});
		btnClose2.addEventListener('click', () => {
 			modal2.classList.remove('show');
				 body.style.overflow = 'auto';
		});
		btnClose3.addEventListener('click', () => {
 			modal3.classList.remove('show');
				 body.style.overflow = 'auto';
		});
}
 	
</script>
</html>