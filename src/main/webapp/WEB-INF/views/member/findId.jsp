<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>findId</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/find.css" />

</head>

<body>

<header>
<h3>���</h3>
</header>

<section class="f_container">
<div class="fi_pd">
<form name="f" action="" method="post">
 <div class="f_h"><h1>���̵� ã��</h1></div>
  <div class="fi_coment"> ���̵� �����̳���?<br>ȸ������ �� ����� ������ �Է��� �ּ���.
  </div>
   <div class="f_box">
    <div class="f_name_title">�̸�
    </div> <br> <input type="text" class="f_id_line" id="user_name" name="user_name" placeholder="�̸��� �Է��� �ּ���."><br>
    <div class="f_tel_title">��ȭ��ȣ
    </div> <br> <input type="text" class="f_id_line" id="user_tel" name="user_tel" placeholder="���ڸ� �Է��� �ּ���."><br>
<button type="submit" id="find" class="f_button">Ȯ��</button>
   </div>
</form>
</div>
</section>

<footer>
<h3>footer</h3>
</footer>

</body>

</html>