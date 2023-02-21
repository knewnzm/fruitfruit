<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/category.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script>
            // 카테고리 버튼 생성
            function makeBtn(data, cate_type = 1) { 
            	/* 
            	<div> id=c"${cate_type}"+"${cate_num}" ex)c1+1
            	<input> name=c"${cate_type}" , id=c"${cate_type}"-"${cate_num}" ex) name=c1 ,id=c1-1
            	<label> 
                for=c"${cate_type}"-"${cate_num}" ex) c1-1 
                */
                let html = ` 
                <div class="btn-group" id="c${"${cate_type}"}+${"${data.cate_num}"}">  
                    <input type="radio" class="btn-check" name="c${"${cate_type}"}" id="c${"${cate_type}"}-${"${data.cate_num}"}" value="${"${data.cate_num}"}" autocomplete="off">
                    <label class="btn-outline" for="c${"${cate_type}"}-${"${data.cate_num}"}">
                            ${"${data.cate_name}"}
                        </label>
                    <button type="button" class="btn-delete" name="remove" itemid="${"${data.cate_num}"}" >삭제</button>
                </div>
                `;
                return html;
            }
            // 카테고리 목록 생성
            function makeBtnList(array, cate_type = 1) {
                let html = "";
                for (let i = 0; i < array.length; i++) {
                    const element = array[i];
                    html += makeBtn(element, cate_type);
                }
                return html;
            }
            // 카테고리 데이터 가져오기
            function getCategoryList(cate_type, cate_parent_num = -1) {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/category/getCategory",
                    data: { cate_type, cate_parent_num },
                    success: function (response) {
                        const arr = $.parseJSON(response);
                        let html = makeBtnList(arr, cate_type);
                        $("#c" + cate_type + "-list").html(html);
                    }
                });
            }
            // 카테고리 추가
            function addCategory(e) {
                const form = $(e.target);
                const data = {};
                // 데이터 입력
                if (form[0].cate_name.value !== "") {
                    data["cate_name"] = form[0].cate_name.value;
                    form[0].cate_name.value = "";
                } else {
                    alert("분류 이름을 입력하세요!");
                    form[0].cate_name.focus();
                    return false;
                }
                data["cate_type"] = form[0].cate_type.value;
                if (form[0].cate_parent_num === undefined) {
                } else if (form[0].cate_parent_num !== undefined && form[0].cate_parent_num.value !== "") {
                    data["cate_parent_num"] = form[0].cate_parent_num.value;
                } else {
                    alert("먼저 상위 분류를 선택하세요!");
                    return false;
                }
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/category/add",
                    data: data,
                    success: function (response) {
                        const array = $.parseJSON(response);
                        let html = makeBtnList(array, data["cate_type"]);
                        $("#" + form.attr("itemref")).html(html);
                    },
                });
            }
            // 카테고리 삭제
            function removeCategory(e) {
                const btn = $(e.target);
                const data = btn.parent().attr("id").split("+"); // ex)c2,16
                const cate_type = data[0].split("c")[1]; // ex)2
                const cate_num = data[1]; // ex)16
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/category/delete",
                    data: { cate_type, cate_num },
                    success: function (response) {
                        const arr = $.parseJSON(response);
                        let html = makeBtnList(arr, cate_type);
                        $("#c" + cate_type + "-list").html(html);
                    },
                });
            }
            // 카테고리 버튼 클릭 시 (하위 카테고리를 추가하기 위한 상위 카테고리 선택 시)
            function categoryBtnClickHandler(e) {
                const data = $(e.target).attr("id").split("-"); // $(e.target)은 <a>태그, a태그의 id에서 "-"를 기준으로 값을 나눠 data에 담는다 ex)c1,2
                const cate_type = parseInt(data[0].substr(1)); //그중 맨앞의 값인 data[0]값의 맨 앞의 하나를 뺀다 .substr(1) c1-> 1
                const cate_num = data[1]; //그 다음값인 data[1]값
                getCategoryList(cate_type + 1, cate_num);
                $("#c" + (cate_type + 1) + "-parent").val(cate_num);
            }
            $(document).ready(function () {
                // 기본 대분류 카테고리 목록 가져옴
                getCategoryList(1);
                // 카테고리를 추가할 때
                $("form").submit(function (e) {
                    e.preventDefault();
                    addCategory(e);
                });
                // 카테고리 선택 버튼
                $(document).on("change", "input[type='radio']", function (e) {
                    categoryBtnClickHandler(e);
                });
                // 카테고리 삭제 버튼
                $(document).on("click", "button[name='remove']", function (e) {
                    removeCategory(e);
                });
            });
        </script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/category.css" />

</head>

<body>
<c:import url="../head.jsp"></c:import>
<c:import url="../header.jsp"></c:import>
<div class="c_wrapper">
 <div class="c_container">
  <div class="c_h"><h1>카테고리 관리</h1> 
  </div>
  <div class="c_box">
  <div class="c1_box"><div class="c_title"><h1>대분류</h1></div>
  
   <form  action="${pageContext.request.contextPath}/category/add" method="POST" itemref="c1-list" class="c_form">
                                <input
                                    type="text"
                                    class="c_text"
                                    placeholder="대분류 추가"
                                    aria-label="대분류 추가"
                                    aria-describedby="c1-btn"
                                    name="cate_name"
                                />
                                <input type="hidden" name="cate_type" value="1" />
                                 <input type="submit" class="c_btn" id="c1-btn" value="등록">
                            </form>
                            <div>
  <form class = "list-group" id="c1-list"></form>
  </div>
   </div> 
   <div class="c1_box"><div class="c_title"><h1>소분류</h1></div>
   
   <form action="${pageContext.request.contextPath}/category/add" method="POST" itemref="c2-list" class="c_form">
                                <input
                                    type="text"
                                    class="c_text"
                                    placeholder="소분류 추가"
                                    aria-label="소분류 추가"
                                    aria-describedby="c2-btn"
                                    name="cate_name"
                                />
                                <input type="hidden" name="cate_type" value="2" />
                                <input type="hidden" name="cate_parent_num" value="" id="c2-parent" />
                               <input type="submit" class="c_btn" id="c2-btn" value="등록">
                            </form>
                             <div>
  <form class = "list-group" id="c2-list"></form>
  </div>
  </div>
  </div>
 </div>
</div>
<c:import url="../footer.jsp"></c:import>
</body>

</html>