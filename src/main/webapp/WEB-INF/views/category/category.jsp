<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/category.css" />
<style type="text/css">
body{
	margin: 0;
}
</style>
</head>
<header>
<h3>헤더</h3>
</header>

<body>
<section class="c_container">

 <div class="c_box">
 <div class="c_h"><h1>카데고리 관리</h1> 
 </div>
  <div class="c1_box"><h1>대분류</h1>
   <form action="" method="POST" class="">
                                <input
                                    type="text"
                                    class=""
                                    placeholder="대분류 추가"
                                    name="category_name"
                                />
                                <input type="hidden" name="category_type" value="1" />
                                <input type="submit" class="" id="c1-btn" value="등록">
                            </form>
  </div> 
  <div class="c1_box"><h1>소분류</h1>
  <form action="" method="POST" class="">
                                <input
                                    type="text"
                                    class=""
                                    placeholder="소분류 추가"
                                    name="category_name"
                                />
                                <input type="hidden" name="category_type" value="2" />
                                <input type="hidden" name="parent_category_num" value="" id="c2-parent" />
                                <input type="submit" class="" id="c1-btn" value="등록">
                            </form>
  </div>
 </div>
</section>
</body>

<footer>
<h3>footer</h3>
</footer>

</html>