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
	�̸��� : <input name="email" value="abc123@naver.com"><br>
	����id : <input name="play_id" value="PF121682"><br>
	<button type="submit" >������ ����</button>
</form>
<hr color="red">

<h3>���� ȭ���Դϴ�.</h3>
<form action="delete_book" method="get">
	����id : <input name="play_id" ><br>
	<button type="submit">������ ����</button>
</form>
<hr color="red">

<h3>�ϸ�ũ �˻�</h3>
<form action="all_book" method="get">
	�̸��� : <input name="email" value=6><br>
	<button onclick="alert('all_book�� ��û��!');" type="submit">�˻�</button>
</form>
<hr color="red">

</body>
</html>