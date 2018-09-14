<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><!-- icon을 위한link -->
<link rel="stylesheet" href="../resources/css/footerBar.css" />
<title>EditProfile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">
	$(function() {

	}); 

</script>

<style type="text/css">
	nav{
		background-color: #555;
	}
</style>
</head>
<body>

<!--  네비게이션  -->
<nav class="nav navbar navbar-expand-sm navbar-light bg-light">
 <div class="navbar-header navbar-center mx-2">
 	<a href="userProfile?user_ID=${user_ID}"><i class="fa fa-arrow-left"></i></a>
	<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="../timeLine">Settings</a>
 </div>    
</nav> 
<div class="list-group">
  <a href="settingPassword" class="list-group-item list-group-item-action">비밀번호 변경</a>
  <a href="settingWithdrawUser" class="list-group-item list-group-item-action">회원탈퇴</a>
  <a href="../logout" class="list-group-item list-group-item-action">로그아웃</a>
</div>


<!-- <div class="container">
	<a href="settingPassword"></a>비밀번호 변경
</div> -->

<%-- <!--사용자 프로필  -->
	<div class="container justify-content-center mx-auto">
		<div class="row justify-content-center mx-auto">
			<div class="col justify-content-center mx-auto">
				<div class="tab-content">
					<!-- 비밀번호 변경  -->
					<div class="tab-pane container fade" id="pwdChange">
						<form action="../profile/editProfile" method="post" enctype="multipart/form-data">
						  <div class="form-group col-md-7">
						    <label for="user_ID">${profile.user_ID }</label>
						    <input type="hidden" class="form-control" id="user_ID" name="user_ID" value="${profile.user_ID }">
						  </div>
						  <div class="form-group col-md-7">
						    <label for="user_Password ">암호</label>
						    <input type="password" class="form-control" id="user_Password" name="user_Password" placeholder="변경 할 비밀번호를 입력하세요">
						  </div>
						  <button type="submit" class="btn btn-success col-md-7">회원정보 변경</button>
						</form>
					</div>
					
					<!-- 회원탈퇴  -->
					<div class="tab-pane container fade" id="dropUser">
						<form action="../profile/withdrawUser" method="post">
						  <div class="form-group col-md-7">
						    <label for="user_ID">아이디</label>
						    <input type="text" class="form-control" id="user_ID" name="user_ID" placeholder="탈퇴 할 아이디를 입력하세요">
						  </div>
						  <div class="form-group col-md-7">
						    <label for="user_Password ">암호</label>
						    <input type="password" class="form-control" id="user_Password" name="user_Password" placeholder="비밀 번호를 입력하세요">
						  </div>
						  <button type="submit" class="btn btn-success col-md-7">회원정보 탈퇴</button>
						</form>
					</div>
				</div>

			</div>
			
		</div>
	</div> --%>
	

<%-- <div class="icon-bar d-sm-none"><!-- d-sm-none : display-sm-none -->
  <a href="../timeLine"><i class="fa fa-home"></i></a> 
  <a href="../timeLineSearch"><i class="fa fa-search"></i></a> 
  <a href="userProfile?user_ID=${user_ID}"><i class="fa fa-send"></i></a>
  <a href="userProfile?user_ID=${user_ID}"><i class="fa fa-user-circle-o"></i></a> 
  <a href="editProfile"><i class="fa fa-cog"></i></a> 
</div> --%>
	
</body>
</html>