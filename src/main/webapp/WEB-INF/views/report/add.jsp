<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//신고하기 버튼

// 신고 제출 버튼
$(document).ready(function(){
	$(document).on("click", "button[id='report']", function () {
	    document.getElementById("report_form").submit();
	});
});

</script>
</head>
<body>
<!-- 신고하기 -->
				<div class="modal-body">
					<form id="report_form" method="post"
						action="${pageContext.request.contextPath}/report/add">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">신고 사유</label>
							<input type="text" class="form-control  w-100"
								id="recipient-name" name="report_title">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">세부 내용을
								적어주세요</label>
							<textarea class="form-control w-100" id="message-text"
								name="report_content"></textarea>
						</div>
						<input type="hidden" id="product_num" name="product_num" value="${p.product_num }"/>
						<input type="hidden" id="report_seller_id" name="report_seller_id" value="${p.product_seller_id }"/>						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="report">신고</button>
				</div>



	<!-- /신고하기 -->
</body>
</html>