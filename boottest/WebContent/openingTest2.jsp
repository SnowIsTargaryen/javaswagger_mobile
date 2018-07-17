<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--부트 스트랩 CDN  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->

<style type="text/css">

	.header {
		 position: relative;
		 background-color: black;
		 height: 75vh;
		 min-height: 25rem;
		 width: 100%;
		 overflow: hidden;
	}
	
	.header video{
		 position: absolute;
		 top: 50%;
		 left: 50%;
		 min-width: 100%;
		 min-height: 100%;
		 width: auto;
		 height: auto;
		 z-index: 0;
		 -ms-transform: translateX(-50%) translateY(-50%);
		 -moz-transform: translateX(-50%) translateY(-50%);
		 -webkit-transform: translateX(-50%) translateY(-50%);
		 transform: translateX(-50%) translateY(-50%);
		
	}
	
	.header .container {
	  position: relative;
	  z-index: 2;
	}
	
	.header .overlay {
	  position: absolute;
	  top: 0;
	  left: 0;
	  height: 100%;
	  width: 100%;
	  background-color: black;
	  opacity: 0.5;
	  z-index: 1;
	}
	
@media (pointer: coarse) and (hover: none) {
  .header {
    background: url('https://source.unsplash.com/XT5OInaElMw/1600x900') black no-repeat center center scroll;
  }
  .header video {
    display: none;
  }
	
	


</style>

<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="header">
		
			<div class="overlay"></div>
			<video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
		   	 <source src="video/Atoms - 13232.mp4" type="video/mp4">
		 	</video>
		 	
		 	<div class="container h-100">
			    <div class="d-flex text-center h-100">
			      <div class="my-auto w-100 text-white">
			        <h1 class="display-3">Eden</h1>
			        <h2>JavaSwagger</h2>
			      </div>
			    </div>
			  </div><!--cpntainer  -->
		  
		</div><!-- header  -->
	</div>
</body>
</html>