<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<title>회원가입</title>
</head>
<body>

	<!--   <form action="../account/create" method="post">
		아이디:<input type="text" name="user_ID"><br>
		비밀번호:<input type="text" name="user_Password"><br>
		이메일:<input type="text" name="user_Email"><br>
		폰:<input type="text" name="user_Phone"><br>
		<input type="submit" value="등록">
	</form>   -->

	<form action="../account/create" method="post">
	  <div class="form-group col-md-4">
	    <label for="user_ID">아이디</label>
	    <input type="text" class="form-control" id="user_ID" name="user_ID" placeholder="아이디를 입력하세요">
	  </div>
	  <div class="form-group col-md-4">
	    <label for="user_Password ">암호</label>
	    <input type="password" class="form-control" id="user_Password" name="user_Password" placeholder="비밀번호를 입력하세요">
	  </div>
	  <div class="form-group col-md-4">
	    <label for="user_Password ">Email</label>
	    <input type="email" class="form-control" id="user_Email" name="user_Email" placeholder="email을 입력하세요">
	  </div>
	  <div class="form-group col-md-4">
	    <label for="user_Password ">Phone</label>
	    <input type="tel" class="form-control" id="user_Phone" name="user_Phone" placeholder="Phone 번호를 입력하세요">
	  </div>
	  <button type="submit" class="btn btn-success col-md-4">제출</button>
	</form>
		


</body>
</html>