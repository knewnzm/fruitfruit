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

$(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
    });
   
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=150 height=150 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });


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
	
	<main class="container">
		<div class="content">
			<div class="main_title_box">
				<h1 class="main_title">판매글 작성</h1>
			</div>

			<div class="line">
				<hr>
			</div>

			<form id="productForm" action="${pageContext.request.contextPath}/product/productForm" method="post" enctype="multipart/form-data">
				<div class="product_form_wrap">	
					<div class="edit_content">	
						<div class="product_box">
							<div class="product_title">
								<label for="product_title">
									제목
								</label>
							</div>
							
							<div class="product_input">
								<input type="text" name="product_title" id="product_title"  class="ed_input">
							</div>
						</div>
							
						<div class="product_box">
							<div class="product_title">
								<label for="product_img">
									이미지
								</label>
							</div>	

							<label class="uploadBTN" for="uploadFile">
								이미지 추가하기
							</label>
							<input type="file" name="uploadFile" id="uploadFile" style="display:none" multiple>
						</div>
						
						<div id="preview"></div>
						    
						<div class="product_box">
							<div class="product_title">
								<label for="product_cate">
									카테고리
								</label>
							</div>
							
							<div class="product_cateinput">
								<select class="product_select" name="frfr_category1" required>
									<option value=1>대분류</option>
								</select>
							</div>
								
							<div class="product_cateinput">
								<select class="product_select"  name="frfr_category2" required>
									<option value=1>소분류</option>
								</select>
							</div>
						</div>
						
						<div class="product_box">
							<div class="product_title">
								<label for="product_price">
									가격
								</label>
							</div>
							
							<div class="product_input">
								<input type="number"  class="ed_input" name="product_price" class="ed_input" id="price" >
							</div>
						</div>
						
						<div class="product_box">
							<div class="product_title">
								<label for="product_quantity">
									수량
								</label>
							</div>
							
							<div class="product_input">
								<input type="number"  class="ed_input" name="product_quantity" id="quantity" >
							</div>
						</div>
						
						<div class="product_box">
							<div class="product_title">
								<label for="product_detail">
									상세내용
								</label>
							</div>
							
							<div class="product_content_input">
								<textarea name="product_content_textarea" class="product_content_textarea"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="submit_wrap">
					 <button type="submit" name="submit" id="submit">작성하기</button>
				</div>
				<input type="hidden" name="product_seller_id" value="${sessionScope.user_id}" required /> <!--7 -->	
			
			</form>	
		</div>	
	</main>
 
	<c:import url="../footer.jsp"></c:import>
	
</body>
</html>