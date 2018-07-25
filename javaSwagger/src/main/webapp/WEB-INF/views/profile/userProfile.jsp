<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">
	$(function() {
		var arr;
		
		$.ajax({url:"/listPost.do",success:function(data){
			alert("ok")
		}});
		
	});
	

</script>


</head>
<body>
<!--  네비게이션  -->
	<nav class="navbar">
	<div class="container-fluid">
			<div class="col-4">
				<div class="navbar-header navbar-left">
					<h1><a class="navbar-brand" href="../profile/userProfile">Eden</a></h1>
				</div>
			</div>
			<div class="col-4">
				<form class="navbar-form navbar-center" action="../search">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="user_ID">
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
	            
			    <button type="button" class="btn btn-default">${profile.user_ID }</button>
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
	<a href="../listPost.do?user_id=${profile.user_ID }">리스트 </a>
<!--사용자 프로필  -->
	<div class="container">
		<div class="jumbotron">
			<div class="row" id="header">
				<div class="col-sm-9">
					<h2>${profile.user_ID }</h2>
					<p>${profile.user_Email }</p>
					<p>${profile.user_Phone }</p>
					<a href="../board/insertPost.do?user_ID=${profile.user_ID }"><img src="../resources/icon/contract.png"></a>
				</div>
			</div>
		</div> 
	</div>
	
	<!-- 썸네일 게시판  -->
	<div class="container">
		<div class="row">
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/new zealand.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">뉴질랜드</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	            
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/new york.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">뉴욕</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/Neuschwanstein.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">노이슈반슈타인 성</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/phi phi islands.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">피피 섬</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	     </div>
     </div>
	
	
</body>
</html>