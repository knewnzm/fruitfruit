<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프룻프룻  공지사항/이벤트 </title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/noticeList.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
	  $('.tab').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('.tab').removeClass('current');
	    $('.tab_pannel').removeClass('current');

	    $(this).addClass('current');
	    $("#" + tab_id).addClass('current');
	  });
	});
</script>
<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<div class="wrap">
      <main class="container">
        <div class="content">
        	<!-- 타이틀 -->
        	<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">공지사항/이벤트</h1>
				</div>
			</div>
			
			<div class="notice_wrap">
				<div class="notice_tab_wrap">
						<div class="menu_tab">
							<ul class="tab_list" role="tablist">
								<li class="tab current" role="tab" data-tab="tab1" >
									전체
								</li>
								<li class="tab"  role="tab" data-tab="tab2">
									공지
								</li>
								<li class="tab"  role="tab" data-tab="tab3">
									이벤트
								</li>
							</ul>
						</div>
					
						<div class="pannel_wrap">
							<div class="tab_pannel current" id="tab1" role="tabpannel" >
								<table  class="list" id="all_list">
									<tbody>
										 <c:if test="${empty list}">
                            				<tr>
                                			<th colspan="3" style=" border-bottom-width: 0px;">등록된 공지/이벤트 글이 없습니다.</th>
                            				</tr>
                        				</c:if>
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 	<tr>
												<th class="list_type">
													<c:if test="${n.notice_type ==1}"> 공지사항 </c:if>
                   							    	<c:if test="${n.notice_type ==2}"> 이벤트 </c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/notice/noticeDetail?notice_num=${n.notice_num}">
                                        	    	${n.notice_title}</a>
                                        	    </th>
												<th class="list_date">${n.notice_date }</th>
											</tr>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
							
							<div class="tab_pannel" id="tab2" role="tabpannel" >
								<table  class="list" id="notice_list">
									<tbody>
										<c:set var="st">
                             						 		<tr>
                                       							<th colspan="3" style=" border-bottom-width: 0px;">등록된 공지 글이 없습니다.</th>
                                   							 </tr>
                          				</c:set>	
                          				<c:forEach var="n" items="${list}" varStatus="status">								
										<c:if test="${n.notice_type==1 }">
												<c:set var="st"></c:set>
                        				</c:if>
                        				</c:forEach>
                        				 		${st }   
                        				<c:if test="${not empty list}">
										<c:forEach var="n" items="${list}" varStatus="status">
										<c:if test="${n.notice_type==1 }">
                           				 	<tr>     				 	
												 <th class="list_type">
													<c:if test="${n.notice_type ==1}"> 공지사항 </c:if>
												</th>
												<th class="list_title"> 
													<a class="link" href="${pageContext.request.contextPath}/notice/noticeDetail?notice_num=${n.notice_num}">
                                        	    	${n.notice_title}</a>
                                        	    </th>
												<th class="list_date">${n.notice_date }</th>
											</tr>
											</c:if>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
							
							<div class="tab_pannel" id="tab3" role="tabpannel" >
								<table  class="list" id="notice_list">
									<tbody>
										<c:set var="st">
                             						 		<tr>
                                       							<th colspan="3" style=" border-bottom-width: 0px;">등록된 이벤트 글이  없습니다.</th>
                                   							 </tr>
                          				</c:set>	
                          				<c:forEach var="n" items="${list}" varStatus="status">								
										<c:if test="${n.notice_type==2 }">
												<c:set var="st"></c:set>
                        				</c:if>
                        				</c:forEach>
                        				 		${st }   
                        				<c:if test="${not empty list}">
                           				 <c:forEach var="n" items="${list}" varStatus="status">
                           				 <c:if test="${n.notice_type==2 }">
                           				 	<tr>
												<th class="list_type">
                   							    	<c:if test="${n.notice_type ==2}"> 이벤트 </c:if>
												</th>
												<th class="list_title">
													<a class="link" href="${pageContext.request.contextPath}/notice/noticeDetail?notice_num=${n.notice_num}">
                                        	    	${n.notice_title}</a>
                                        	    </th>
												<th class="list_date">${n.notice_date }</th>
											</tr>
											</c:if>
                           				 </c:forEach>
                            			</c:if>
									</tbody>
								</table>
							</div>
							
					</div> <!-- pannel wrap -->	
				</div><!-- notice tab wrap -->
			</div> <!-- notice wrap end -->
				
			<c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />
				<c:if test="${user_type == 3}">
					  	<div class="write_btn_box">
						<button type="button" id="write_btn"  onclick="location.href='${pageContext.request.contextPath}/notice/noticeForm'">작성하기</button>
						</div>
				 </c:if>
					  
        </div> <!-- content end -->
      </main> <!-- container end -->
  	</div> <!-- wrap end-->
		 <c:import url="../footer.jsp"></c:import>
</body>
</html>