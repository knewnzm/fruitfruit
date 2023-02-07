<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>helpList</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<<<<<<< Upstream, based on origin/test
<<<<<<< Upstream, based on origin/test
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpList.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
/* 탭 메뉴 */
$(document).ready(function(){
	  
	  $('ul.tab_list li').click(function(){
	    var tab_id = $(this).attr('data-tab');
=======
=======
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/helpList.css" />
>>>>>>> 8661a35 0206
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
/* 탭 메뉴 */
$(document).ready(function(){
	  
	  $('ul.tab_list li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tab_list li').removeClass('current');
	    $('.tab_pannel').removeClass('current');

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
<<<<<<< Upstream, based on origin/test
>>>>>>> 74807c4 0205

	    $('ul.tab_list li').removeClass('current');
	    $('.tab_pannel').removeClass('current');

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
<header>
		<c:import url="../head.jsp"></c:import>
   		 <c:import url="../header.jsp"></c:import>
</header>
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
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
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
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
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
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
					
							<div class="tab_pannel " id="tab2" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
													<c:if test="${h.help_type ==1}"> 회원정보 </c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
					
					
							<div class="tab_pannel " id="tab3" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==2}"> 주문</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
				
					
							<div class="tab_pannel " id="tab4" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==3}"> 상품</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
					
					
							<div class="tab_pannel " id="tab5" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==4}"> 배송</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
				
					
							<div class="tab_pannel" id="tab6" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==5}"> 기타</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
				</div> <!-- pannel end -->	
        	  <c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />
			  <c:if test="${user_type == 1 || user_type == 2}">
=======
<header>
		<c:import url="../head.jsp"></c:import>
   		 <c:import url="../header.jsp"></c:import>
</header>
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
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
    						  </div>
        					</li>
        					<li class="faq_items">
        						<div class="faq_q_title">
        					 			<span class="faq_icon">Q.</span>
          								제목이 들어갑니다.
        						</div>
        						<div class="faq_a_content">
        								내용이 들어갑니다.
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
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
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
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
					
							<div class="tab_pannel " id="tab2" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
													<c:if test="${h.help_type ==1}"> 회원정보 </c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
					
					
							<div class="tab_pannel " id="tab3" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==2}"> 주문</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
				
					
							<div class="tab_pannel " id="tab4" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==3}"> 상품</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
					
					
							<div class="tab_pannel " id="tab5" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==4}"> 배송</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
				
					
							<div class="tab_pannel" id="tab6" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 문의가 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${h.help_type ==5}"> 기타</c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/help/helpDetail?help_num=${h.help_num}">
                                        	    	${h.help_title}</a>
                                        	    </th>
												<th class="list_date">${h.help_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
				</div> <!-- pannel end -->	
        	  <c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />
			  <c:if test="${user_type == 1}">
>>>>>>> 8661a35 0206
					 <div class="write_btn_box">
							<button type="button" id="write_btn"  onclick="location.href='${pageContext.request.contextPath}/help/helpForm'">작성하기</button>
					 </div>
			 </c:if>
        	  </div><!-- help wrap -->
        </div> <!-- content end -->
	</main> <!-- container end -->
</div> <!-- wrap end -->
<footer>
	<c:import url="../footer.jsp"></c:import>
</footer>
</body>
</html>