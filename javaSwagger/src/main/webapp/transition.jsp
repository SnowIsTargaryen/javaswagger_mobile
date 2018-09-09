<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<title>Insert title here</title>
</head>
<body>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">Eden</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
      
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>
          <li class="nav-item">
          	 <div class="btn-group">  
				<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="../profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
				<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"></button>
				<div class="dropdown-menu">
				  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
				  <a class="dropdown-item" href="../logout">로그아웃</a>
				</div>
			</div>
          </li>
        </ul>
      	
		<form class="form-inline my-lg-0 mx-auto" id="F">
	      <div class="input-group">
	        <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
	        <div class="input-group-append">
	          <button class="btn btn-outline-success" type="submit" >
					<img src="../resources/icon/search2.png" width="18" height="18">
			  </button>
	        </div>
	      </div>
	    </form>
      
    
       
       
      </div>
    </nav>

	<%-- <nav class="nav navbar navbar-expand-sm navbar-light bg-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	 	 </button>
	 	 
			<div class="navbar-header navbar-center mx-auto">
				<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="../timeLine">Eden</a>
			</div>
	
		  
			<div class="navbar-nav mx-4 my-2 d-block d-sm-none">
			    <div class="btn-group">  
					<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="../profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"></button>
					<div class="dropdown-menu">
					  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
					  <a class="dropdown-item" href="../logout">로그아웃</a>
					</div>
				</div>
			</div>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-lg-0 mx-auto" id="F">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
			        <div class="input-group-append">
			          <button class="btn btn-outline-success" type="submit" >
							<img src="../resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			 </div>   
				 
				
			 <div class="navbar-nav mx-4 my-2 d-none d-sm-block">
			     <div class="btn-group">  
					<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="../profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					</button>
					<div class="dropdown-menu">
					  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
					  <a class="dropdown-item" href="../data/weatherData">날 씨</a>
					  <a class="dropdown-item" href="../logout">로그아웃</a>
					</div>
				</div>
			 </div> 
	</nav> --%>
	
	<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#">Navbar</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Link</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Dropdown
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link disabled" href="#">Disabled</a>
	      </li>
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>
	  </div>
	</nav>
	 -->
	
	

</body>
</html>