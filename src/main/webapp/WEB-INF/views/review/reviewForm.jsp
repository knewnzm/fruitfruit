<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ page trimDirectiveWhitespaces="true" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
               <meta charset="UTF-8">
               <title>reviewForm</title>
            </head>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reviewForm.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css" />
            <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
            <script>
               $(document).ready(function () {
                  $('input[name="file"]').change(function () {
                     setImageAndFileNameFromFile(this);
                  });
               });

               function setImageAndFileNameFromFile(input) {
                  if (input.files && input.files[0]) {
                     var reader = new FileReader();
                     reader.onload = function (e) {
                        $('#preview').attr('src', e.target.result);
                        $('.file_name_label').text(input.files[0].name);
                     }
                     reader.readAsDataURL(input.files[0]);
                  }
               }
               window.onload = function () {
                  document.getElementById("file").addEventListener("change", function (event) {
                     var preview = document.getElementById("preview");
                     var file = event.target.files[0];
                     var reader = new FileReader();

                     reader.onload = function () {
                        preview.src = reader.result;
                        preview.style.display = "block";
                     };
                     if (file) {
                        reader.readAsDataURL(file);
                     } else {
                        preview.style.display = "none";
                     }
                  });
               }

            </script>

            <body>

               <c:import url="../head.jsp"></c:import>
               <c:import url="../header.jsp"></c:import>

               <div class="wrap">
                  <main class="container">
                     <div class="content">
                        <div class="title_wrap">
                           <div class="main_title">
                              <h1 class="main_text">리뷰 작성하기</h1>
                           </div>
                        </div>
                        <form action="${pageContext.request.contextPath}/review/reviewForm" method="post"
                           enctype="multipart/form-data">
                           <div class="product_form_wrap">
                              <div class="product_box">
                                 <div class="product_title">
                                    <label for="product_title">
                                       제목
                                    </label>
                                 </div>

                                 <div class="product_input">
                                    <input type="text" name="review_title" id="title">
                                 </div>
                              </div>
                              <div class="product_box">
                                 <div class="product_title">
                                    <label>
                                       이미지
                                    </label>
                                 </div>
                                 <div class="file_name_wrap">
                                    <label for="product_path" class="file_name_label"></label>
                                 </div>
                                 <div class="product_path_wrap">
                                    <input class="form-control" type="file" name="file" id="file"
                                       accept="image/*" multiple required />
                                    <label for="file" class="file_label">업로드</label>
                                 </div>
                              </div>
                              <div class="path_wrap">
                                 <img src="" id="preview" style="display:none" />
                              </div>
                              <div class="content_wrap">
                                 <textarea name="review_content" class="product_w_content"></textarea>
                              </div>

                           </div>
                           <div class="product_box" style="display: none;">
                              <div class="product_title">
                                 <label for="product_writer_id">
                                    아이디
                                 </label>
                              </div>
                              <div class="product_input">
                                 <input type="text" name="review_writer" id="title" value="${user_id}"
                                    readonly>
                              </div>
                           </div>
                           <div class="product_box" style="display: none;">
                              <div class="product_title">
                                 <label for="product_writer_id">
                                    product_num
                                 </label>
                              </div>
                              <div class="product_input">
                                 <input type="text" name="review_product_num" id="title"
                                    value="${product_num}" readonly>
                              </div>
                           </div>


                           <!-- product_form_wrap end -->

                           <div class="submit_wrap">
                              <button type="submit" name="submit" id="submit">작성하기</button>
                              <button class="back_btn" type="button" onClick="history.back();">작성 취소</button>
                           </div>
                        </form>
                        <!-- content end -->
                     </div>
                  </main>
               </div>

               <c:import url="../footer.jsp"></c:import>

            </body>

            </html>