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
<h3>���</h3>
</header>

<body>
<div class="c_wrapper">
 <div class="c_container">
  <div class="c_h"><h1>ī�װ� ����</h1> 
  </div>
  <div class="c_box">
  <div class="c1_box"><div class="c_title"><h1>��з�</h1></div>
   <form  action="${pageContext.request.contextPath}/category/add" method="POST" itemref="c1-list" class="c_form">
                                <input
                                    type="text"
                                    class="c_text"
                                    placeholder="��з� �߰�"
                                    aria-label="��з� �߰�"
                                    aria-describedby="c1-btn"
                                    name="cate_name"
                                />
                                <input type="hidden" name="cate_type" value="1" />
                                <input type="submit" class="c_btn" id="c1-btn" value="���">
                            </form>
   </div> 
   <div class="c1_box"><div class="c_title"><h1>�Һз�</h1></div>
   <form action="${pageContext.request.contextPath}/category/add" method="POST" itemref="c2-list" class="c_form">
                                <input
                                    type="text"
                                    class="c_text"
                                    placeholder="�Һз� �߰�"
                                    aria-label="�Һз� �߰�"
                                    aria-describedby="c2-btn"
                                    name="cate_name"
                                />
                                <input type="hidden" name="cate_type" value="2" />
                                <input type="hidden" name="parent_cate_num" value="" id="c2-parent" />
                                <input type="submit" class="c_btn" id="c1-btn" value="���">
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