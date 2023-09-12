<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>common 오류</title>
	<style>
		b{color:orange}
		body{text-align:center}
	</style>
</head>
<body>
	<h1>common.jsp</h1>
	죄송합니다. <br>
		요청하신 <b>${url}</b> 처리에 오류가 발생했습니다.
	<hr>
	${exception}
</body>
</html>