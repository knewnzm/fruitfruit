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
        // modal 닫기 버튼
        $("button[name='close']").click(function (e) {
            e.preventDefault();
            const btn = $(e.target);
            console.log(btn);
            $("div[role='dialog']").modal("hide");
        });
        // modal 저장 버튼
        $("button[name='rate-submit']").click(function (e) {
            e.preventDefault();
            const btn = $(e.target);
            const itemid = btn.attr("itemid");
            const form = $("#rating-" + itemid);
            if (form[0].score.value === "") {
                alert("먼저 평점을 입력해주세요!");
            } else {
                form.submit();
            }
        });
    });
</script>

<div>
    <h5>알림</h5>
    <table class="w-100">
        <tbody class="list-group" id="alram_list">
            <c:if test="${empty aList}"> 새로운 알림이 없습니다. </c:if>
            <c:forEach var="alram" items="${aList}">
                <tr class="w-100 list-group-item d-flex justify-content-between">
                    <td>
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
                                    <span class="fw-bold">
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >에 댓글이 <span class="fw-bold">${alram.alram_count}개</span> 달렸습니다!
                                    <span class="text-right inline-block">${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==2}">
                                    <span class="fw-bold">
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >에 등록한 내 댓글에 추가 댓글이 <span class="fw-bold">${alram.alram_count}개</span> 달렸습니다!
                                    <span class="text-right inline-block">${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==3}">
                                    <span class="fw-bold">
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span class="fw-bold">예약 상태가 취소</span>되었습니다. 어서 구매하세요!
                                    <span class="text-right inline-block">${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==4}">
                                    <span class="fw-bold">
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span class="fw-bold">예약 상태</span>가 되었습니다.
                                    <span class="text-right inline-block">${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==5}">
                                    <span class="fw-bold">
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span class="fw-bold">판매완료</span> 되었습니다. 구매하셨다면 판매자에 대한 평점을 매겨주세요!
                                    <span class="text-right inline-block">${alram.stringDate}</span>
                                </c:when>
                                <c:when test="${alram.alram_type==6}">
                                    <span class="fw-bold">
                                        <c:import url="${pageContext.request.contextPath}/api/product/getName" charEncoding="UTF-8">
                                            <c:param name="product_num" value="${alram.product_num}"></c:param>
                                        </c:import>
                                        제품</span
                                    >이 <span class="fw-bold">판매완료</span> 되었습니다. 평점을 매겨주셔서 감사합니다.
                                    <span class="text-right inline-block">${alram.stringDate}</span>
                                </c:when>
                            </c:choose>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="w-100 d-flex justify-content-end" colspan="2">
                    <c:if test="${not empty aList}">
                        <button class="btn btn-link my-1">알림 전체 삭제</button>
                    </c:if>
                </td>
            </tr>
        </tbody>
    </table>
</div>
