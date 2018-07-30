<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>EditProfile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">
	$(function() {
		<% String sesseing_id=(String)session.getAttribute("user_ID"); %>
		$("#btnUserProfile").click(function() {
			location.href="../profile/userProfile?user_ID=<%=sesseing_id%>";
		})
	})

</script>
</head>
<body>
<!--  네비게이션  -->
	<nav class="navbar">
	<div class="container">
			<div class="col-4">
				<div class="navbar-header navbar-left">
					<h1><a class="navbar-brand" href="../timeLine">Eden</a></h1>
				</div>
			</div>
			<div class="col-4">
				<form class="navbar-form navbar-center" action="#">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="search">
			        <div class="input-group-append">
			          <button class="btn btn-outline-secondary" type="submit" >
							<img src="../resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
	            <div class="btn-group">
	            
			    <button type="button" class="btn btn-default" id="btnUserProfile">${user_ID }</button>
			    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
			      <a class="dropdown-item" href="../logout">로그아웃</a>
			    </div>
			  </div>
	        </div>
		</div> <!-- 컨테이너  -->
	</nav>
	
	
	
<!--사용자 프로필  -->
	<div class="container">
		<div class="row">
			<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
	          <ul class="nav nav-pills flex-column" role="tablist">
	            <li class="nav-item">
	              <a class="nav-link active" href="#editProfile" role="tab" data-toggle="pill">프로필 수정</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#pwdChange" role="tab" data-toggle="pill">비밀번호 변경</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#dropUser" role="tab" data-toggle="pill">회원탈퇴</a>
	            </li>
	          </ul>
	
	          
	        </nav>
		
			<!-- <div class="col-sm-3 col-md-2 sidebar">
		         <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				  <a class="nav-link active"  data-toggle="pill" href="#v-pills-home" role="tab"  aria-selected="true">프로필 수정</a>
				  <a class="nav-link"  data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">비밀번호 수정</a>
				  <a class="nav-link"  data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">회원탈퇴</a>
				  <a class="nav-link"  data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</a>
				</div>
	        </div> -->
			<div class="col-sm-9">
				<div class="tab-content">
					<!--프로필 수정  -->
					<div class="tab-pane container active" id="editProfile">
						<form action="../profile/editProfile" method="post">
						  <div class="form-group col-md-7">
						    <label for="user_ID">${profile.user_ID }</label>
						    <input type="hidden" class="form-control" id="user_ID" name="user_ID" value="${profile.user_ID }">
						  </div>
						  <div class="form-group col-md-7">
						    <label for="user_Password ">Email</label>
						    <input type="email" class="form-control" id="user_Email" name="user_Email" placeholder="변경 할 email을 입력하세요">
						  </div>
						  <div class="form-group col-md-7">
						    <label for="user_Password ">Phone</label>
						    <input type="tel" class="form-control" id="user_Phone" name="user_Phone" placeholder="변경 할 Phone 번호를 입력하세요">
						  </div>
						  <button type="submit" class="btn btn-success col-md-7">회원정보 변경</button>
						</form>
					</div>
					<!-- 비밀번호 변경  -->
					<div class="tab-pane container fade" id="pwdChange">
						<form action="../profile/editProfile" method="post">
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
	</div>
	
	
</body>
</html>