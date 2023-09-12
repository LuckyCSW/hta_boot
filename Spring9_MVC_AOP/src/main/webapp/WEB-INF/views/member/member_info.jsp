<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
	<style>
		tr>td:nth-child(odd){font-weight:bold}
		td{text-align:center}
		.container{width:50%}
	</style>
<jsp:include page="../board/header.jsp" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<table class="table table-bordered">		
			<tr>
				<td>아이디</td>
				<td>${memberinfo.id}</td> <%-- Member클래스의 getId()메소드 --%>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${memberinfo.password}</td> 
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberinfo.name}</td> 
			</tr>
			<tr>
				<td>나이</td>
				<td>${memberinfo.age}</td> 
			</tr>
			<tr>
				<td>성별</td>
				<td>${memberinfo.gender}</td> 
			</tr>
			<tr>
				<td>이메일 주소</td>
				<td>${memberinfo.email}</td> 
			</tr>
			<tr>
				<td colspan=2>
				<a href="list">리스트 돌아가기</a></td>
			</tr>
		
		</table>
	</div>
</body>
</html>