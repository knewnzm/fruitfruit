<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프룻프룻  1:1문의</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpList.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
/* 탭 메뉴 */
$(document).ready(function(){
	  
	  $('.tab').click(function(){ //<li>
	    var tab_id = $(this).data('tab'); //data-tab 속성값을 가져옴
	    $('.tab').removeClass('current'); //<li>
	    $('.tab_pannel').removeClass('current'); //해당하는 목록
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })
	})
/* 아코디언 */
$(function(){
  var accordionButton = $('.faq_q_list .faq_items > .faq_q_title');
  accordionButton.on('click', function(e){
    e.preventDefault();
    var $this = $(this);
    var target = $this.parent();
    var description = $this.siblings('.faq_a_content');
    var other = target.siblings('.faq_items');
    var otherDescription = other.find('.faq_a_content');
    accordionToggle(target, description, other, otherDescription);
  });
  function accordionToggle(target, description, other, otherDescription){
    if (target.hasClass('active')) {
      target.removeClass('active');
      description.stop().slideUp(300);
    } else {
      target.addClass('active');
      description.stop().slideDown(300);
    }
    if (other && otherDescription) {
      other.removeClass('active');
      otherDescription.stop().slideUp(300);
    }
  };
});
</script>
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<div class="wrap">
	<main class="container">
        <div class="content">
        	  <div class="faq_wrap">
        				<div class="faq_title">
        						<h1 class="faq_title_text">자주하는 질문 FAQ</h1>
        				</div>
        				<ul class="faq_q_list">
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          									ID를 변경하고 싶어요.
        						</div>
        						<div class="faq_a_content">
        								아이디 변경을 원하실 경우, 탈퇴 후 재가입을 통한 아이디변경만 가능합니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								개인정보 수정/변경은 어떻게 하나요?
        						</div>
        						<div class="faq_a_content">
        								 [회원 정보 관리 > 개인정보 수정]에서 수정 및 변경이 가능합니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								 수취인 연락처를 변경할수 있나요?
        						</div>
        						<div class="faq_a_content">
        								주문건에 대한 수취인 연락처 변경은 판매자에게 직접 문의해 주셔야 하며
        								그 외 등록된 배송지 리스트 관리는 [마이페이지 > 내정보 수정]에서 배송지 등록 및 변경이 가능합니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								  판매 상품을 등록하고 싶어요.
        						</div>
        						<div class="faq_a_content">
        								 [판매 목록 > 판매 등록]에서 상품 등록이 가능합니다.
    						  </div>
        					</li>
        				</ul>
        		</div>
        		<div class="help_wrap">
        				<div class="help_title">
        						<h1 class="help_title_text">1:1 문의</h1>
        				</div>
        				<div class="help_tab_wrap">
						<div class="menu_tab">
								<ul class="tab_list" role="tablist">
									<li class="tab current" role="tab" data-tab="tab1" >
										전체
									</li>
									<li class="tab"  role="tab" data-tab="tab2">
										회원정보
									</li>
									<li class="tab"  role="tab" data-tab="tab3">
										주문
									</li>
									<li class="tab"  role="tab" data-tab="tab4">
										상품
									</li>
									<li class="tab"  role="tab" data-tab="tab5">
										배송
									</li>
									<li class="tab"  role="tab" data-tab="tab6">
										기타
									</li>
							</ul>
				    </div>
        		   </div>
        		   <div class="pannel_wrap">
							<div class="tab_pannel current" id="tab1" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
											<c:set var="st">
                             						 		<tr>
                                       							<th colspan="4" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                                   							 </tr>
                          					</c:set>
                             				<c:forEach var="h" items="${list}" varStatus="status">
                             				<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                              								<c:set var="st"></c:set>
                              				</c:if>				
                             				</c:forEach>
                                        			 ${st }   
                        					<c:if test="${not empty list}">
                           				 	<c:forEach var="h" items="${list}" varStatus="status">
                           					<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                           				 					<tr>
                           				 						 <c:if test="${h.answer_status==0 }">
                           				 							  <th class="list_state">
                           				 							  		<div class="state_box0">답변 대기중</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
                           				 						<c:if test="${h.answer_status==1 }">
                           				 							  <th class="list_state">
                           				 							  		<div class="state_box">답변 완료</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
																	  <th class="list_type">
																			<c:if test="${h.help_type ==1}"> 회원정보 </c:if>
                   							    							<c:if test="${h.help_type ==2}"> 주문</c:if>
                   							    							<c:if test="${h.help_type ==3}"> 상품</c:if>
                   							    							<c:if test="${h.help_type ==4}"> 배송</c:if>
                   							    							<c:if test="${h.help_type ==5}"> 기타</c:if>
																	 </th>
																	 <th class="list_title"> 
																			<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    										  				 ${h.help_title}</a>
                                        	    					 </th>
																	 <th class="list_date">${h.help_date }</th>
																</tr>
											</c:if>
                           					</c:forEach>
                            				</c:if>
									</tbody>
								</table>
							</div>
					
					
							<div class="tab_pannel " id="tab2" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
											<c:set var="st">
                             						 		<tr>
                                       							<th colspan="4" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                                   							 </tr>
                          					</c:set>
                             				<c:forEach var="h" items="${list}" varStatus="status">
                             				<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                              								<c:if test="${ h.help_type==1}">
                              								<c:set var="st"></c:set>
                              								</c:if>
                              				</c:if>				
                             				</c:forEach>
                                        					 ${st }   
                        					<c:if test="${not empty list}">
                           				 	<c:forEach var="h" items="${list}" varStatus="status">
                           					<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                           				   	<c:if test="${h.help_type ==1}">
                           				 					<tr>
                           				 						 <c:if test="${h.answer_status==0 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box0">답변 대기중</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
                           				 						<c:if test="${h.answer_status==1 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box">답변 완료</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
																	  <th class="list_type">
																			<c:if test="${h.help_type ==1}"> 회원정보 </c:if>
																	 </th>
																	 <th class="list_title"> 
																			<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    										  ${h.help_title}</a>
                                        	    					 </th>
																	 <th class="list_date">${h.help_date }</th>
																</tr>
											</c:if>
											</c:if>
                           					</c:forEach>
                            				</c:if>
									</tbody>
								</table>
							</div>
					

							<div class="tab_pannel " id="tab3" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
											<c:set var="st">
                             						 		<tr>
                                       							<th colspan="4" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                                   							 </tr>
                          					</c:set>
                             				<c:forEach var="h" items="${list}" varStatus="status">
                             				<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                              								<c:if test="${ h.help_type==2}">
                              								<c:set var="st"></c:set>
                              								</c:if>
                              				</c:if>				
                             				</c:forEach>
                                        					 ${st }   
                        					<c:if test="${not empty list}">
                           				 	<c:forEach var="h" items="${list}" varStatus="status">
                           					<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                           				   	<c:if test="${h.help_type ==2}">
                           				 					<tr>
                           				 						 <c:if test="${h.answer_status==0 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box0">답변 대기중</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
                           				 						<c:if test="${h.answer_status==1 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box">답변 완료</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
																	  <th class="list_type">
                   							    							<c:if test="${h.help_type ==2}"> 주문</c:if>
																	 </th>																			
																	 <th class="list_title"> 
																			<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    										  ${h.help_title}</a>
                                        	    					 </th>
																	 <th class="list_date">${h.help_date }</th>
																</tr>
											</c:if>
											</c:if>
                           					</c:forEach>
                            				</c:if>
									</tbody>
								</table>
							</div>

							<div class="tab_pannel " id="tab4" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
											<c:set var="st">
                             						 		<tr>
                                       							<th colspan="4" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                                   							 </tr>
                          					</c:set>
                             				<c:forEach var="h" items="${list}" varStatus="status">
                             				<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                              								<c:if test="${ h.help_type==3}">
                              								<c:set var="st"></c:set>
                              								</c:if>
                              				</c:if>				
                             				</c:forEach>
                                        					 ${st }   
                        					<c:if test="${not empty list}">
                           				 	<c:forEach var="h" items="${list}" varStatus="status">
                           					<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                           				   	<c:if test="${h.help_type ==3}">
                           				 					<tr>
                           				 						 <c:if test="${h.answer_status==0 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box0">답변 대기중</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
                           				 						<c:if test="${h.answer_status==1 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box">답변 완료</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
																	  <th class="list_type">
                   							    							<c:if test="${h.help_type ==3}"> 상품</c:if>
																	 </th>																		
																	 <th class="list_title"> 
																			<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    										  ${h.help_title}</a>
                                        	    					 </th>
																	 <th class="list_date">${h.help_date }</th>
																</tr>
											</c:if>
											</c:if>
                           					</c:forEach>
                            				</c:if>
									</tbody>
								</table>
							</div>

							
							<div class="tab_pannel " id="tab5" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
											<c:set var="st">
                             						 		<tr>
                                       							<th colspan="4" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                                   							 </tr>
                          					</c:set>
                             				<c:forEach var="h" items="${list}" varStatus="status">
                             				<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                              								<c:if test="${ h.help_type==4}">
                              								<c:set var="st"></c:set>
                              								</c:if>
                              				</c:if>				
                             				</c:forEach>
                                        					 ${st }   
                        					<c:if test="${not empty list}">
                           				 	<c:forEach var="h" items="${list}" varStatus="status">
                           					<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                           				   	<c:if test="${h.help_type ==4}">
                           				 					<tr>
                           				 						 <c:if test="${h.answer_status==0 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box0">답변 대기중</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
                           				 						<c:if test="${h.answer_status==1 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box">답변 완료</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
																	  <th class="list_type">
                   							    							<c:if test="${h.help_type ==4}"> 배송</c:if>
																	 </th>																		
																	 <th class="list_title"> 
																			<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    										  ${h.help_title}</a>
                                        	    					 </th>
																	 <th class="list_date">${h.help_date }</th>
																</tr>
											</c:if>
											</c:if>
                           					</c:forEach>
                            				</c:if>
									</tbody>
								</table>
							</div>
							
							
							<div class="tab_pannel " id="tab6" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
											<c:set var="st">
                             						 		<tr>
                                       							<th colspan="4" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                                   							 </tr>
                          					</c:set>
                             				<c:forEach var="h" items="${list}" varStatus="status">
                             				<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                              								<c:if test="${ h.help_type==5}">
                              								<c:set var="st"></c:set>
                              								</c:if>
                              				</c:if>				
                             				</c:forEach>
                                        					 ${st }   
                        					<c:if test="${not empty list}">
                           				 	<c:forEach var="h" items="${list}" varStatus="status">
                           					<c:if test="${user_type==3 or h.help_writer_id==sessionScope.user_id}">
                           				   	<c:if test="${h.help_type ==5}">
                           				 					<tr>
                           				 						 <c:if test="${h.answer_status==0 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box0">답변 대기중</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
                           				 						<c:if test="${h.answer_status==1 }">
                           				 							  <th class="list_state">
                           				 							  <div class="state_box">답변 완료</div>
                           				 							  </th>                       				 		
                           				 						</c:if>
																	  <th class="list_type">
                   							    							<c:if test="${h.help_type ==5}"> 기타</c:if>
																	 </th>																		
																	 <th class="list_title"> 
																			<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    										  ${h.help_title}</a>
                                        	    					 </th>
																	 <th class="list_date">${h.help_date }</th>
																</tr>
											</c:if>
											</c:if>
                           					</c:forEach>
                            				</c:if>
									</tbody>
								</table>
							</div>
							
							
				</div> <!-- pannel end -->	
        	  <c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />
			  <c:if test="${user_type == 1 || user_type == 2}">
					 <div class="write_btn_box">
							<button type="button" id="write_btn"  onclick="location.href='${pageContext.request.contextPath}/help/helpForm'">작성하기</button>
					 </div>
			 </c:if>
        	  </div><!-- help wrap -->
        </div> <!-- content end -->
	</main> <!-- container end -->
</div> <!-- wrap end -->
<c:import url="../footer.jsp"></c:import>
</body>
</html>
