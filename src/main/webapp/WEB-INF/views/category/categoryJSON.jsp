<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script type="text/javascript">

                function makeBtn2(data, cate_type = 2) { 
                    let html = ` 
            	<li>
                <a href="/product/csearch?frfr_category2=${"${data.cate_num}"}" class="on title">
                    <span>${"${data.cate_name}"}</span>
                </a>
            </li>
            `;
                    return html;
                }

                function makeBtn(data, cate_type = 1) {
 
                    let html = ` 
            	<li class="menuArea"> 
                <a href="/product/csearch?frfr_category1=${"${data.cate_num}"}" class="title on"> 
                    <span id="c${'${cate_type}'}-${'${data.cate_num}'}" class="text">${"${data.cate_name}"}</span>
                </a>
                <ul id="c${'${cate_type}'}_${'${data.cate_num}'}" class="category-wrap">
                </ul>
                </li>
            `;
                    return html; 
                }

                function makeBtnList(array, cate_type = 1) {
                    let html = "";
                    for (let i = 0; i < array.length; i++) {
                        const element = array[i]; 

                        if (cate_type == 1) {
                            html += makeBtn(element, cate_type); 
                           
                        } else if (cate_type == 2) {
                            html += makeBtn2(element, cate_type);
                        }
                    }
                    return html;
                }
          
                function gethCategoryList(cate_type, cate_parent_num = -1) {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/category/getCategory",
                        data: { cate_type, cate_parent_num },
                        success: function (response) {
                            const arr = $.parseJSON(response); 
                            let html = makeBtnList(arr, cate_type); 
                          

                            if (cate_type == 1) {
                                $("#c" + cate_type + "-list").html(html);
                            } else if (cate_type == 2) {

                                $("#c1_" + cate_parent_num).html(html);
                            }

                        }
                    });
                }
           
                function categoryBtnHandler(e) {
                    const indata = $(e.target).attr("id").split("-");
                    const h_cate_type = parseInt(indata[0].substr(1)); 
                    const h_cate_num = data[1];
                    gethCategoryList(h_cate_type + 1, h_cate_num);
                }

                $(document).ready(function(){
    getCategoryList(1);

    $(document).on("mouseover", "span.text", function (e) { 
        categoryBtnHandler(e); 
    });
});

            </script>