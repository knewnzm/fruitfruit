<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/category.css" />

</head>
<header>
<h3>헤더</h3>
</header>

<body>
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
                                <input type="hidden" name="parent_cate_num" value="" id="c2-parent" />
                                <input type="submit" class="c_btn" id="c1-btn" value="등록">
                            </form>
  </div>
  </div>
 </div>
</div>
</body>

<footer>
<h3>footer</h3>
</footer>

</html>