<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>�����͸� �Է��ϼ��� </h3>
<form action="insert_book" method="get">
	�̸� : <input name="name" value="���̹�" ><br>
	�ּ� : <input name="url" value="http://www.naver.com"><br>
	�̹��� : <input name="img" value="resources/img/�ڹ�.jpg"><br>
	<button type="submit" >������ ����</button>
</form>
<hr color="red">

<h3>���� ȭ���Դϴ�.</h3>
<form action="delete_book" method="get">
	id : <input name="id" ><br>
	<button type="submit">������ ����</button>
</form>
<hr color="red">

<h3>�ϸ�ũ �˻�</h3>
<form action="one_book" method="get">
	id : <input name="id" value=6><br>
	<button onclick="alert('one3�� ��û��!');" type="submit">�˻�</button>
</form>
<hr color="red">

<a href="all3"><h3>�ϸ�ũ ��ü ��� ������ ����</h3></a><br>
</body>
</html>
</body>
</html>