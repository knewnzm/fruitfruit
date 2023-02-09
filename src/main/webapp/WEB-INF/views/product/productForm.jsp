<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page trimDirectiveWhitespaces="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeForm</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/productForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$('input[name="notice_path"]').change(function(){
    setImageFromFile(this, '#preview');
});

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
    $(expression).attr('src', e.target.result);
  }
  reader.readAsDataURL(input.files[0]);
  }
}


// 카테고리 버튼 생성
function makeOption(data, category_type = 1) {
    let html = `
        <option id="c${"${category_type}"}-${"${data.category_num}"}" value="${"${data.category_num}"}">${"${data.category_name}"}</option>
    `;
    return html;
}
// 카테고리 목록 생성
function makeOptionList(array, category_type = 1) {
    let html = `<option value="">선택하세요!</option>`;
    for (let i = 0; i < array.length; i++) {
        const element = array[i];
        html += makeOption(element, category_type);
    }
    return html;
}
// 카테고리 데이터 가져오기
function getCategoryList(category_type, parent_category_num = -1) {
    $.ajax({
        type: "post",
        url: "${pageContext.request.contextPath}/category/getCategory",
        data: { category_type, parent_category_num },
        success: function (response) {
            const arr = $.parseJSON(response);
            let html = makeOptionList(arr, category_type);
            $("#c" + category_type + "-list").html(html);
        },
    });
}
function removeCategoryList(category_type) {
    if (category_type <= 2) {
        $("#c" + (category_type + 1) + "-list").html("");
    }
    if (category_type <= 1) {
        $("#c" + (category_type + 2) + "-list").html("");
    }
}
// 카테고리 버튼 클릭 시 (하위 카테고리를 추가하기 위한 상위 카테고리 선택 시)
function categorySelectChangeHandler(e) {
    const selectedOption = $("#" + $(e.target).attr("id") + " option:selected");
    const data = selectedOption.attr("id").split("-");
    const category_type = parseInt(data[0].substr(1));
    if (category_type != 3) {
        const category_num = data[1];
        getCategoryList(category_type + 1, category_num);
        $("#c" + (category_type + 1) + "-parent").val(category_num);
    }
}
$(document).ready(function () {
    // 기본 대분류 카테고리 목록 가져옴
    getCategoryList(1);
    // 카테고리 선택 버튼
    $(document).on("change", "select", function (e) {
        const category_type = parseInt(
            $("#" + $(e.target).attr("id") + " option:selected")
                .attr("id")
                .split("-")[0]
                .substr(1)
        );
        categorySelectChangeHandler(e);
        removeCategoryList(category_type);
    });
});
</script>
<body>
    
		<c:import url="../head.jsp"></c:import>
   		 <c:import url="../header.jsp"></c:import>
	
        <div class="wrap">
            <main class="container">
		<div class="content">
			<div class="title_wrap">
				<div class="main_title">
					<h1 class="main_text">판매 글 작성</h1>
				</div>
			</div>
			<form id="productForm" action="${pageContext.request.contextPath}/product/productForm" method="post" enctype="multipart/form-data">
			<div class="product_form_wrap">		
				<div class="product_box">
						<div class="notice_title">
							<label for="product_title">
								제목
							</label>
						</div>
						<div class="product_input">
							<input type="text" name="product_title" id="title" >	<!--1 -->
						</div>
					</div>
				<div class="product_box">
					<div class="product_title">
						<label>
							이미지
						</label>
					</div>
					<div class="product_path_wrap">
						<input type="file" name="file" id="file" multiple>
							<label for="file" class="file_label">업로드</label>
					</div>
				</div>
				<div class="path_wrap" >
						<img src=""  id="preview" onerror="imgError()"/>
				</div>
				<div class="product_category">
					<select name="frfr_category1" required>
						<option value=1>대</option>		<!--2 -->
					</select>
					<select name="frfr_category2" required>
						<option value=1>소</option>		<!--3 -->
					</select>
				</div>
				<div class="product_box">
					<div class="product_price">
						<label for="product_price">
							가격
						</label>
					</div>
					<div class="product_input">
						<input type="number" name="product_price" id="price" >	<!--4 -->
					</div>
				</div>
				<div class="product_box">
					<div class="product_quantity">
						<label for="product_quantity">
							수량
						</label>
					</div>
					<div class="product_input">
						<input type="number" name="product_quantity" id="quantity" >	<!--5 -->
					</div>
				</div>
				<div class="content_wrap">
					<label for="product_quantity">
						상세내용
					</label>
					<textarea name="product_content" class="product_content"></textarea>	<!--6 -->
				</div>
			<!-- notice_form_wrap end -->
			</div>
			<div class="submit_wrap">
				 <button type="submit" name="submit" id="submit">작성하기</button>
			</div>
			<input type="hidden" name="product_seller_id" value="${sessionScope.user_id}" required /> <!--7 -->
			</form>
		<!-- content end -->
		</div>	
	</main>
        </div>
	
		 <c:import url="../footer.jsp"></c:import>
	
</body>
</html>