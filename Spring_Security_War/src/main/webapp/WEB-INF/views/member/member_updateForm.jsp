<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원관리 시스템 회원수정 페이지</title>
	<style>
		h3{
			text-align:center; color:#1a92b9;
		}
		
		input[type=file]{
			display:none;
		}
	
	</style>
<link href="${pageContext.request.contextPath}/resources/css/join.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../board/header.jsp" />
<form name="joinform" action="updateProcess" method="post">
	<h3>회원 정보 수정 페이지</h3>
	<hr>
	<b>아이디</b>
	<input type="text" name="id" value="${memberinfo.id}" required readOnly>
	
	<b>비밀번호</b>
	<input type="password" name="password" value="${memberinfo.getPassword().substring(0,4)}" required readOnly>
	
	<b>이름</b>
	<input type="text" name="name" value="${memberinfo.name}" placeholder="Enter name" required>
	
	<b>나이</b>
	<input type="text" name="age" value="${memberinfo.age}" maxlength="2" 
			placeholder="Enter age" required>
	
	<b>성별</b>
		<div>
			<input type="radio" name="gender" value="남"><span>남자</span>
			<input type="radio" name="gender" value="여"><span>여자</span>
		</div>
	<b>이메일 주소</b>
		<input type="text" name="email" value="${memberinfo.email}" placeholder="Enter email"
				required><span id="email_message"></span>
	<div class="clearfix">
		<button type="submit" class="submitbtn">수정</button>
		<button type="button" class="cancelbtn">취소</button>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
	<script>
		//성별 체크해주는 부분
		$("input[value='${memberinfo.gender}']").prop('checked', true);
		
		$(".cancelbtn").click(function(){
			history.back();
		});
		
		//처음 화면 로드시 보여줄 이메일은 이미 체크 완료된 것이므로 기본 checkemail=true입니다.
		let checkemail=true;
		$("input[name=email]").on('keyup',
				function(){
					$("#email_message").empty();
					//[A-Za-z0-9_]와 동일한 것이 \w 입니다.
					//+는 1회 이상 반복을 의미하고 {1,}와 동일합니다.
					//\w+는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
					const pattern=/^\w+@\w+[.]\w{3}$/;
					const email=$(this).val();
					console.log(email);
					if(!pattern.test(email)){
						$("#email_message").css('color', 'red').html("이메일형식이 맞지 않습니다.");
						checkemail=false;
					}else{
						$("#email_message").css('color', 'green').html("이메일형식에 맞습니다.");
						checkemail=true;
					}
		}); //email keyup end
		
		$('form[name=joinform]').submit(function(){
			if(!$.isNumeric($("input[name='age']").val())){
				alert("나이는 숫자를 입력하세요");
				$("input[name='age']").val('').focus();
				return false;
			}
			
			if(!checkemail){
				alert("email 형식을 확인하세요");
				$("input[name=email]").focus();
				return false;
			}
		}); //submit() end
		
		$('input[type=file]').change(function(event){
			const inputfile=$(this).val().split('\\');
			const filename=inputfile[inputfile.length -1]; //inputfile.length - 1=2
			
			const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
			if(pattern.test(filename)){
				$('#filename').text(filename);
				
				const reader = new FileReader(); //파일을 읽기 위한 객체 생성
				
				/*
					1. readAsDataURL()
						① readAsDataURL(): FileReader 객체의 메소드로, 선택한 파일을 데이터 URL로 일도록 요청합니다.
						② DataURL 형식으로 읽어온 결과는 reader객체의 result 속성에 저장됩니다.
						③ DataURL 형식은 접두사 data:가 붙은 URL이며 바이너리 파일을 Base64로 인코딩하여 ASCII 문자열 형식
						④ Base64 인코딩은 바이너리 데이터를 Text로 변경하는 Encoding으로
							이를 사용하면 웹 브라우저에서 이미지 등의 파일을 미리보기 기능을 제공할 수 있습니다.
							
					2. event.target.files[0] : 파일 리스트에서 첫번째 객체를 가져옵니다.		
				*/
				reader.readAsDataURL(event.target.files[0]);
				
				reader.onload=function(){ //읽기에 성공했을 때 실행되는 이벤트 핸들러
					$('#showImage > img').attr('src', this.result);
				};	
			}else{
				alert('이미지 파일(gif,jpg,jpeg,png)이 아닌 경우는 무시됩니다.');
				$(this).val('')
			}
		}); //change() end
		
	</script>
</body>
</html>