<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
	<link href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script>
  		const result="${result}";
  		if(result == 'joinSuccess'){
  			alert("회원가입을 축하합니다.")
  		}else if(result == '0'){
  			alert("비밀번호가 일치하지 않습니다.")
  		}else if(result == '-1'){
  			alert("아이디가 존재하지 않습니다.")
  		}
  		
  		$(function(){
  			$(".join").click(function(){
  				location.href="${pageContext.request.contextPath}/member/join"
  			});
  		});
  
  	</script>
</head>
<body>
	<form name="loginform" action="${pageContext.request.contextPath}/member/loginProcess"
		  method="post">
		<h1>로그인</h1>
		<hr>
		<b>아이디</b>
			<input type="text" name="id" placeholder="Enter id" id="id" required
					<c:if test="${!empty saveid}">
							value="${saveid}" 
					</c:if>
			>
			
		<b>Password</b>
			<input type="password" name="password" placeholder="Enter password" required>
			<label>
			<input type="checkbox" id="remember" style="margin-bottom:15px"
				<c:if test="${!empty saveid}">
							checked
				</c:if>
			> Remember me
			</label>	
		<div class="clearfix">
			<button type="submit" class="submitbtn">로그인</button>
			<button type="button" class="join">회원가입</button>
		</div>		
	</form>
</body>
</html>