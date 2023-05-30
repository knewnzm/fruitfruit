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
//카테고리 하나 생성
//바로 템플릿 리터럴 사용시 jstl의 el문으로 인식하기 때문에 백틱임을 인식시키기 위해 \를 붙임
 function makeCategory(item, cate_type = 1) { 
 	/* 
 	<div> id="c1+1"
 	<input> name="c1" id="c1-1"
 	<label> 
     for="c1-1"
     */
     let html = ` 
     <div class="btn-group" id="c\${cate_type}-\${item.cate_num}"> 
         <input type="radio" class="btn-check" name="c\${cate_type}" id="c\${cate_type}-\${item.cate_num}" value="\${item.cate_num}">
         <label class="btn-outline" for="c\${cate_type}-\${item.cate_num}">
                 \${item.cate_name}
             </label>
         <button type="button" class="btn-delete" name="remove" itemid="\${item.cate_num}" >삭제</button>
     </div>
     `;
     return html;
 }
            // 카테고리 목록 생성
            function makeCategoryList(arr, cate_type = 1) {
                let html = "";
                $.each(arr, function(i, item) {
                    html += makeCategory(item, cate_type);
                });
                return html;
            }
            // 카테고리 데이터 가져오기
            function getCategoryList(cate_type, cate_parent_num = 0) { //cate_type 1 : 대분류, 2 : 소분류 // cate_parent_num : 부모 시퀀스 번호. 없다면 기본값 -1
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/category/getCategory",
                    data: { cate_type, cate_parent_num }, //{ cate_type: "1", cate_parent_num: "0" }
                    success: function (response) { //response는 문자열
                        const arr = JSON.parse(response); //JSON객체로 변환
                        let html = makeCategoryList(arr, cate_type); //카테고리 버튼 생성 함수에 객체와 타입을 전달
                        $("#c" + cate_type + "-list").html(html);
                    }
                });
            }
            
            //카테고리 등록
            function addCategory(e) {
                const form = $(e.target); // 이벤트가 발생한 요소를 선택
                const data = {};

                // 데이터 생성
                if (form.find('[name="cate_name"]').val() !== "") {
                    data["cate_name"] = form.find('[name="cate_name"]').val(); //{"cate_name" : ?}
                } else {
                    alert("분류 이름을 입력하세요!");
                    form.find('[name="cate_name"]').focus();
                    return false;
                }

                let cate_type = form.find('[name="cate_type"]').val(); //카테고리 등록 후에 카테고리 목록을 갱신하기 위함
                data["cate_type"] = cate_type;//{"cate_type" : ?}

                if (form.find('[name="cate_parent_num"]').length !== 0) { //cate_parent_num이 존재하는 소분류폼만 조건문 실행
                    if (form.find('[name="cate_parent_num"]').val() !== "") { //대분류를 선택했다면
                        data["cate_parent_num"] = form.find('[name="cate_parent_num"]').val(); //{"cate_parent_num" : ?}
                    } else { //소분류 폼인데 cate_parent_num을 선택하지 않은 경우
                        alert("먼저 상위 분류를 선택하세요!");
                        return false;
                    }
                }
                
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/category/add",
                    data: data,
                    success: function (response) { //category/getCategory에서 받은 gson 응답
                        const array = JSON.parse(response);
                        let html = makeCategoryList(array, data["cate_type"]);
                        $("#c" + cate_type + "-list").html(html);
                    },
                });
            }
            // 카테고리 삭제
            function removeCategory(e) {
                const btn = $(e.target);
                const data = btn.parent().attr("id").split("-"); // 아까 만든 div태그에서 id값을 split ex)c2,16
                const cate_type = parseInt(data[0].substr(1)); // ex)2
                const cate_num = data[1]; // ex)16
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/category/delete",
                    data: { cate_type, cate_num },
                    success: function (response) {
                        const arr = JSON.parse(response);
                        let html = makeCategoryList(arr, cate_type);
                        $("#c" + cate_type + "-list").html(html);
                    },
                });
            }
            // 카테고리 버튼 클릭 시 (하위 카테고리를 추가하기 위한 상위 카테고리 선택 시)
            function categoryRadioClickHandler(e) {
                const data = $(e.target).attr("id").split("-"); // $(e.target)은 radio, id값에서 "-"를 기준으로 data[]에 담는다 ex)c1,2
                const cate_type = parseInt(data[0].substr(1)); //문자열의 인덱스1 이후의 값을 잘라내서 int로 변환 .substr(1) c1-> 1
                const cate_num = data[1];
                if(cate_type === 1){ //선택한 요소가 대분류일때
                	getCategoryList(2, cate_num); //선택한 cate_num을 부모로 하는 소분류 리스트를 불러옴
                }
                $("#c2-parent").val(cate_num); // 소분류 폼의 "input[name='cate_parent_num']"을 현재 cate_num으로 설정
            }
         
            $(document).ready(function () {
                getCategoryList(1); // 카테고리 데이터 가져오기
            	
                // 카테고리를 추가할 때
                $(".c_form").submit(function (e) { //등록 버튼을 누르면 이벤트객체 전달
                	e.preventDefault(); 
                    addCategory(e); //이벤트 객체를 카테고리추가함수에 전달
                });
                
                // 카테고리 선택시 이벤트 핸들러
                $(document).on("change", "input[type='radio']", function (e) { //동적 요소이므로 이벤트 위임
                    categoryRadioClickHandler(e);
                });
                
                // 카테고리 삭제
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
  
   <form itemref="c1-list" class="c_form">
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
   
   <form itemref="c2-list" class="c_form">
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