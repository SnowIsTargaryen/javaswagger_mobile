<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	 header {
	  position: fixed; 
	  top: 0; 
	  left: 0; 
	  width: 100%; 
	  height: 1px; 
	 /*  background: #f5b335;  */
	  transition: top 0.2s ease-in-out; 
	  }  
	  .nav-up { 
	  top: -40px; 
	   }
	
	#proPhoto{
		width: 120px;
	    height:120px;
	    border-radius: 60px; /* 이미지 반크기만큼 반경을 잡기*/
	}
	#modalProPhoto{
		width: 120px;
	    height:120px;
	    border-radius: 60px; /* 이미지 반크기만큼 반경을 잡기*/
	}
	
	.filebox input[type="file"]{ 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	} 
	.filebox label {
		 display: inline-block; 
		 padding: .5em .75em; 
		 color: #999; 
		 font-size: inherit; 
		 line-height: 1.6; 
		 vertical-align: middle; 
		 background-color: #fdfdfd; 
		 cursor: pointer; 
		 border: 1px solid #ebebeb ; 
		 border-bottom-color: #e2e2e2; 
		 border-radius: .25em; 
	 } /* named upload */ 
	 .filebox .upload-name { 
		 display: inline-block; 
		 padding: .5em .75em; /* label의 패딩값과 일치 */ 
		 font-size: inherit; 
		 font-family: inherit; 
		 line-height: 1.8; 
		 vertical-align: middle; 
		 background-color: #f5f5f5; 
		 border: 1px solid #ebebeb; 
		 border-bottom-color: #e2e2e2; 
		 border-radius: .25em ; 
		 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		 -moz-appearance: none; 
		 appearance: none;
	}
  
  .bg-cover{
		background-image: url(../resources/image/background.jpg);
	}

</style>

<title>EditProfile</title>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/footerBar.css" />
<link rel="stylesheet" href="../resources/css/jumbotron.css" />
<title>EditProfile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<!-- Bootstrap Core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<link href="../resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/css/stylish-portfolio.min.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {

		// Hide Header on on scroll down 
		var didScroll; 
		var lastScrollTop = 0; 
		var delta = 5; 
		var navbarHeight = $('header').outerHeight(); 
		
		$(window).scroll(function(event){ 
			didScroll = true; 
		}); 
		
		setInterval(function() { 
			if (didScroll) { 
				hasScrolled(); 
				didScroll = false; 
		} 
		}, 250); 
		
		function hasScrolled() { 
			var st = $(this).scrollTop(); 
			
			// Make sure they scroll more than delta 
			if(Math.abs(lastScrollTop - st) <= delta) return; 
			
			// If they scrolled down and are past the navbar, add class .nav-up. 
			// This is necessary so you never see what is "behind" the navbar. 
			if (st > lastScrollTop && st > navbarHeight){ 
				
				// Scroll Down 
				 $( '.icon-bar' ).fadeOut();
			}
			else { 
			
			// Scroll Up 
			if(st + $(window).height() < $(document).height()) { 
				 $( '.icon-bar' ).fadeIn(); 
				} 
			} 
			
			lastScrollTop = st;
			
		}
		
		<% String sesseing_id=(String)session.getAttribute("user_ID"); %>

		/* $("#btnUserProfile").click(function() {
			alert("ok")
			location.href="../profile/userProfile?user_ID="+user_SessionID;
		}) */
		
		
		

		
	
		var pFname='${profile.user_fname }'
		if(pFname==null || pFname=='')
		{
			$("#proPhoto").attr({src:"../resources/icon/user2.png"})
		}
		 
	

		$("#btnUserProfile").click(function() {
			
			 location.href="../profile/userProfile?user_ID=";
		})

	})
	
	$(document).ready(function(){ 
		var fileTarget = $('.filebox .upload-hidden'); 
		fileTarget.on('change', function(){
		
		// 값이 변경되면
		if(window.FileReader){
			// modern browser 
		var filename = $(this)[0].files[0].name; } 
		else { 	// old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			
			} 
	 	alert(filename)
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename); 
		}); 
	}); 

</script>

</head>
<body>
<header></header>
<!-- Navigation -->
    <a class="menu-toggle rounded" href="#">
      <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <li class="sidebar-brand">
          <a class="js-scroll-trigger" href="#page-top">Menu</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="../data/bigData">빅데이터</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="../logout">Logout</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#contact">Contact</a>
        </li>
      </ul>
    </nav>
<!--  네비게이션  -->
	<nav class="nav navbar navbar-expand-sm navbar-light bg-light">

 	 
		<div class="navbar-header navbar-center mx-auto">
			<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="../timeLine">Edem</a>
		</div>
 		<!-- <a href="settings"><i class="fa fa-cogs"></i></a>  -->

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-lg-0 mx-auto" id="F">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
			        <div class="input-group-append">
			          <button  class="btn btn-outline-success border-left-0" style="border-color: #ced4da;" type="submit" >
							<img class="img" src="../resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			 </div>   
	</nav>
<!--사용자 프로필  -->

<!-- Jumbotrons -->
<div class="jumbotron jumbotron-fluid bg-cover">
  <div class="container" align="center">
    <p class="lead" >회원정보 수정</p>
    <hr>
    <div class="tab-pane container active" id="editProfile">
					
						  <div class=" ">
						  	<img id="proPhoto" data-target="#updatePost" src="../resources/image/${profile.user_fname }">
							<p for="user_ID" >${profile.user_ID}</p>
						    <input type="hidden" class="form-control" id="user_ID" name="user_ID" value="${profile.user_ID }">
						  </div>
					 
						
					</div>
  </div>
</div><!-- JumboTron end -->
	
	<div class="container justify-content-center mx-auto"  align="center">
		<div class="row justify-content-center mx-auto">
			<div class="col justify-content-center mx-auto">
				<div class="tab-content">
					<!--프로필 수정  -->
					<div class="tab-pane container active" id="editProfile">
						<form action="../profile/editProfile" method="post" enctype="multipart/form-data">
						  <div class="form-group col-md-7 ">
						   <img id="proPhoto" data-target="#updatePost" style="display: none;" src="../resources/image/${profile.user_fname }">
						   
						    <input type="hidden" class="form-control" id="user_ID" name="user_ID" value="${profile.user_ID }">
						    <input type="hidden" class="form-control" id="user_fname" name="user_fname" value="${profile.user_fname}">
						  </div> 
					 
							 <div class="filebox"> <!-- 새로운 파일 처리를 할 부분 -->
								<label for="ex_filename" class="fas fa-image"></label> 
								<input class="upload-name" value="파일선택" disabled="disabled">
								<input type="file" id="ex_filename" class="upload-hidden" name="uploadFile"> 
							</div>

						  <div class="form-group .col-3 col-sm-8 col-md-8 col-lg-5">
						    <label for="user_Email " class="fa fa-envelope-square"></label>
						    <input type="hidden" class="form-control" id="user_Email" name="user_Email" value="${profile.user_Email}">
						  	<span id="user_Mail_span">${profile.user_Email}</span>
						  </div>
						  
						  <div class="form-group .col-3 col-sm-8 col-md-8  col-lg-5">
						    <label for="user_Phone "><i class="fas fa-phone-square"></i> </label>
						    <span>${profile.user_Phone}</span>
						    <input type="tel" class="form-control" id="user_Phone" name="user_Phone" placeholder="변경 할 번호 입력" required>
						  </div>
						  <button type="submit" class="btn btn-success .col-3 col-sm-8 col-md-8  col-lg-5">회원정보 변경</button>
						</form>
					</div>
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
	</div>
	

 <div class="icon-bar "><!-- d-sm-none : display-sm-none -->
  <a href="../timeLine"><i class="fa fa-home"></i></a> 
  <a href="../timeLineSearch"><i class="fa fa-search"></i></a> 
  <a href="userProfile?user_ID=${user_ID}"><i class="fas fa-pencil-alt"></i></a>
  <a href="userProfile?user_ID=${user_ID}"><i class="fas fa-user-astronaut"></i></a> 
  <a href="editProfile"><i class="fa fa-cog"></i></a> 
</div>
	
<!-- Bootstrap core JavaScript -->
  <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Plugin JavaScript -->
  <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for this template -->
  <script src="../resources/js/stylish-portfolio.min.js"></script>
		
	
</body>
</html>