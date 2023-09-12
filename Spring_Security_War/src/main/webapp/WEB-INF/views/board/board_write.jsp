<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<jsp:include page="header.jsp"/>
	<script src = "../resources/js/writeform.js" charset="utf-8"></script>
	<style>
	 h1{font-size:1.5rem; text-align:center; color:#1a92b9}
	 .container{width:60%}
	 label{font-weight:bold}
	 #upfile{display:none}
	 img{width:20px;}
	</style>
</head>
<body>

 <div class="container">
 	<form action="add" method="post" enctype="multipart/form-data" name="boardform">
 		<h1>MVC 게시판-write 페이지</h1>
 		<div class="form-group">
 			<label for="board_name">글쓴이</label>
 			<input name="BOARD_NAME" id="board_name" value="${id}" readOnly
 					type="text"	 	class="form-control"
 					placeholder="Enter board_name">
 		</div>
 		<div class="form-group">
 			<label for="board_pass">비밀번호</label>
 			<input name="BOARD_PASS" id="board_pass" type="password" maxlength="30"
 					class="form-control" placeholder="Enter board_pass">
 		</div>
 		<div class="form-group">
 			<label for="board_subject">제목</label>
 			<input name="BOARD_SUBJECT" id="board_subject" type="text" maxlength="100"
 					class="form-control" placeholder="Enter board_subject">
 		</div>
 		<div class="form-group">
 			<label for="board_content">내용</label>
 			<textarea name="BOARD_CONTENT" id="board_content"
 				   rows="10"	class="form-control"></textarea>
 		</div>
 		<div class="form-group">
 			<label>
 				파일 첨부
 				<img src="../resources/image/attach.png" alt="파일첨부">
 				<input type="file" id="upfile" name="uploadfile">
 			</label>
 			<span id="filevalue"></span>
 		</div>
 		<div class="form-group">
 			<button type="submit" class="btn btn-primary">등록</button>
 			<button type="reset" class="btn btn-danger">취소</button>
 		</div>
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 	</form>
 </div>
</body>
</html>