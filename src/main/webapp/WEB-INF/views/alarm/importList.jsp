<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
    if ("${sessionScope.user_id}" === "") {
        alert("로그인이 필요한 페이지입니다.");
        location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
    }
    function readAlram(e) {
        let btn = $(e.target);
        if (btn.prop("tagName") === "SPAN") {
            btn = btn.parent();
        }
        const alram_num = btn.attr("itemid");
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/alram/read",
            data: { alram_num },
            success: function (response) {
                btn.addClass("text-muted");
                if (btn.attr("itemtype") === "5") {
                    $(`#modal-${"${alram_num}"}`).modal("show");
                } else {
                    location.href = `${pageContext.request.contextPath}${"${btn.attr('itemref')}"}`;
                }
            },
        });
    }
    $(document).ready(function () {
        // 알림 목록을 클릭 시
        $("a[name='alram']").click(function (e) {
            e.preventDefault();
            readAlram(e);
        });
        // 알림 삭제 버튼 클릭 시
        $(document).on("click", "button[class='btn-close'], [class='btn btn-link my-1']", function (e) {
            if ($(this).attr("class") === "btn-close") {
                var btn = e.target;
                var alram_num = btn.getAttribute("itemid");
                // 각 알림의 삭제 버튼
                $.ajax({
                    type: "post",
                    url: "/alram/delete",
                    data: { alram_num },
                    success: function (data) {
                        btn.parentNode.parentNode.remove();
                        if (document.getElementById("alram_list").childElementCount <= 1) {
                            document.getElementById("alram_list").innerHTML = "새로운 알림이 없습니다.";
                        }
                    },
                });
            } else {
                // 알림목록 하단의 전체삭제 버튼
                $.ajax({
                    type: "post",
                    url: "/alram/deleteall",
                    success: function (response) {
                        document.getElementById("alram_list").innerHTML = "새로운 알림이 없습니다.";
                    },
                });
            }
        });
    });
</script>

<div>
    <h1>내 알림</h1>
    
    <div class="pannel_wrap">
		<div class="tab_pannel current">
			<table  class="list">
				<tbody>
					<c:if test="${empty aList}"> 새로운 알림이 없습니다. </c:if>
						<c:forEach var="alram" items="${aList}">
							<tr>
								<th>
			                        <a
			                            class="${alram.alram_read==1?'text-muted':''}"
			                            name="alram"
			                            itemid="${alram.alram_num}"
			                            itemref="${alram.alram_href}"
			                            itemtype="${alram.alram_type}"
			                            style="cursor: pointer"
			                            data-toggle="modal"
			                            data-target="#modal-${alram.alram_num}"
			                        >
                            <c:choose>
                                <c:when test="${alram.alram_type==1}">
                                    <span>
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >에 댓글이 <span>${alram.alram_count}개</span> 달렸습니다!
                                    <span>${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==2}">
                                    <span>
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >에 등록한 내 댓글에 추가 댓글이 <span>${alram.alram_count}개</span> 달렸습니다!
                                    <span>${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==3}">
                                    <span>
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span>예약 상태가 취소</span>되었습니다. 어서 구매하세요!
                                    <span>${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==4}">
                                    <span>
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span>예약 상태</span>가 되었습니다.
                                    <span>${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==5}">
                                    <span>
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span>판매완료</span> 되었습니다.
                                    <span>${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==6}">
                                    <span>
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span>판매완료</span> 되었습니다.
                                    <span>${alram.stringDate}</span>
                                </c:when>
                            </c:choose>
                       			 </a>
							</th>
		                </tr>
					</c:forEach>
					<tr class="del-tr">
						<th>
							<c:if test="${not empty aList}">
								<button class="add-btn">알림 전체 삭제</button>
							</c:if>
						</th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

