<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">

	body {
	  padding-top: 54px;
	}
	
	@media (min-width: 992px) {
	  body {
	    padding-top: 56px;
	  }
	}
	
	.bg-image-full {
	  background: no-repeat center center scroll;
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  background-size: cover;
	  -o-background-size: cover;
	  }
  
	  img{	
	  
	  	width: 100px;
	  	height: 100px;
	  
	  }
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
</head>
<body>

<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
 	<header class="masthead text-black text-center">
      <div class="container">
        <img class="img-fluid mb-5 d-block mx-auto rounded-circle" src="resources/image/hayeonsoo3.jpg" alt="">
        <h1 class="text-uppercase mb-0">Start Bootstrap</h1>
        <hr class="star-light">
        <h2 class="font-weight-light mb-0">Web Developer - Graphic Artist - User Experience Designer</h2>
      </div>
    </header>

<!--   Header - set the background image for the header in the line below -->
    <header class="py-5 bg-image-full text-center" style="background-image: url('https://unsplash.it/1900/1080?image=1076');">
      <img class="img-fluid d-block mx-auto rounded-circle" src="http://placehold.it/200x200&text=Logo" alt="">
      <p class="d-inline">test1</p>
      <p class="d-inline">test2</p>
      <p class="d-inline">test3</p>
      <h1>주소</h1>
    </header>
    
    <div class="container">
    
    	<div class="text-center" id="imggg">
    		<img class="img-fluid d-block mx-auto rounded-circle rounded-circle"  src="resources/image/hayeonsoo3.jpg"/>
    	</div>
    </div> -


<%-- <!--사용자 프로필  -->
	<div class="container">
		<div class="jumbotron" style="background-color: #FCD260" >
			<div class="row d-flex" id="header">
				<div class="col-sm-9 d-flex" >
					<div class="mx-auto"> 
						<img id="proPhoto" src="../resources/image/${profile.user_fname }">
					</div>
					<div class="row mx-auto">
						<div class="col-sm-2 offset-md-2 ">
							<h4 id="jumboUserID">${profile.user_ID }</h4>
						</div>
						<div class="col col-sm-auto">
							<span><button id="btn_Follow" class="btn ">Follow</button></span>
						</div>
						<div class="col col-sm-auto mx-4">
							<a data-toggle="modal" data-target="#insertPost" id="write" ><img src="../resources/icon/contract.png"></a>
						</div>
						<div class="col-sm-6 offset-md-2">
							<span><a data-toggle="modal" data-target="#followerList_Modal" id="a_Follower_List">팔로워</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span><a data-toggle="modal" data-target="#followingList_Modal" id="a_Following_List">팔로잉</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-sm-12 offset-md-2">
							<p>${profile.user_Email }</p>
						</div>
					</div><!--inner row1  -->
				</div>
			</div><!--header row  -->
		</div> 
	</div>
 --%>

 <!-- 썸네일 게시판  -->
	<!--<div class="container">
		<div class="row" id="row1">
		 	<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top" src="resources/image/new zealand.jpg" alt="Card image cap">
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
	     </div>
     </div>
      -->
     <!-- <div class="container">
     	<div class="row" id="row1">	
     		<div class="col col-md-4">
     			<div class="card md-4 box-shadow">
     				 <div class="card-header">user_id</div>
     				 <img class="card-img-top" src="resources/image/new zealand.jpg" alt="Card image cap">
     				 <div class="card-body">
     				 	<p>내용들어간다 #이태호#또안나옴</p>
     				 </div>
     				 <div class="card-footer claerfix">
     				 	<div class="float-left">
  							<a href="#"><small>test</small></a> 
     				 		<button type="button" class="btn btn-sm btn-outline-secondary border-0 inline-block"><img src="resources/icon/like_0.png"></button>
     				 		<p class="d-inline">
     				 			<a href="#1">1</a>
     				 			<a href="#2">2</a>
     				 			<a href="#3">3</a>
     				 		</p>
     				 	</div>
                        <div class="btn-group float-right ">
                       	 	
                       	 	<button type="button" class="btn btn-sm btn-outline-secondary border-0"><img src="resources/icon/delete-button.png"></button>
		                    <button type="button" class="btn btn-sm btn-outline-secondary border-0"><img src="resources/icon/create-comment-button.png"></button>
                        </div>
     				 </div>
     			</div>
     		</div>
     	</div>
     </div> -->
     

<!-- <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus" title="Dismissible popover" data-content="And here's some amazing content. It's very engaging. Right?">Dismissible popover</a> -->

</body>
</html>