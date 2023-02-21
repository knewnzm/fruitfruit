<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeForm</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script>
            // 카테고리 버튼 생성
            function makeBtn(data, cate_type = 1) { 
            	console.log("makeBtn");
          		  	
                let html = ` 
                <div class="btn-group" id="c${"${cate_type}"}+${"${data.cate_num}"}">  
                    <input type="radio" class="btn-check" name="frfr_category${"${cate_type}"}" id="c${"${cate_type}"}-${"${data.cate_num}"}" value="${"${data.cate_num}"}" autocomplete="off">
                    <label class="btn-outline" for="c${"${cate_type}"}-${"${data.cate_num}"}">
                    	${"${data.cate_name}"}
                    </label>
                </div>
                `;
                return html;
            }
            // 카테고리 목록 생성
            function makeBtnList(array, cate_type = 1) {
            	console.log("makeBtnList");
            	
                let html = "";
                for (let i = 0; i < array.length; i++) {
                    const element = array[i];
                    html += makeBtn(element, cate_type);
                }
                return html;
            }
            // 카테고리 데이터 가져오기
            function getCategoryList(cate_type, cate_parent_num = -1) {
            	console.log("getCategoryList");
            	
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
            
            // 카테고리 버튼 클릭 시 (하위 카테고리를 추가하기 위한 상위 카테고리 선택 시)
            function categoryBtnClickHandler(e) {
            	console.log("categoryBtnClickHandler");
            	
                const data = $(e.target).attr("id").split("-"); // $(e.target)은 <a>태그, a태그의 id에서 "-"를 기준으로 값을 나눠 data에 담는다 ex)c1,2
                const cate_type = parseInt(data[0].substr(1)); //그중 맨앞의 값인 data[0]값의 맨 앞의 하나를 뺀다 .substr(1) c1-> 1
                const cate_num = data[1]; //그 다음값인 data[1]값
                
            	if(cate_type <= 1){
                    getCategoryList(cate_type + 1, cate_num);
                    $("#c" + (cate_type + 1) + "-parent").val(cate_num);
            	}
                
                console.log(cate_type + " / " + cate_num);
            	
            }
            
            $(document).ready(function () {
                // 기본 대분류 카테고리 목록 가져옴
                console.log("ready");
                
                
                getCategoryList(1);
                
                // 카테고리 선택 버튼
                $(document).on("change", "input[type='radio']", function (e) {
                	console.log("카테고리 선택 버튼");
                    categoryBtnClickHandler(e);
                });
                
            });
        </script>

</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/category.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/productForm.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />

<body>
<%--   	<c:import url="../head.jsp"></c:import>
	<c:import url="../header.jsp"></c:import>  --%>
	
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
							<input type="file" name="file" id="uploadFile" style="display:none" multiple>
						</div>
						
						<div id="preview"></div>
						    
						<div class="product_box">
							<div class="product_title">
								<label for="product_cate">
									카테고리
								</label>
							</div>
						</div>                     
							<div class="product_cateinput">
								<div class = "list-group" id="c1-list"></div>
							</div>
							
							<div class="product_cateinput">
								<div class = "list-group" id="c2-list"></div>	
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
								<textarea name="product_content" class="product_content"></textarea>
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