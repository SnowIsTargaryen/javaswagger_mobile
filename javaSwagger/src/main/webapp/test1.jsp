<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
</head>
<body>

<!-- 썸네일 게시판  -->
	<div class="container">
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
     
     <div class="container">
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
     				 		<a class="d-inline" href="#">댓글..</a>
     				 		<p class="d-inline">
     				 			<a href="#1">1</a>
     				 			<a href="#2">2</a>
     				 			<a href="#3">3</a>
     				 		</p>
     				 	</div>
                        <div class="btn-group float-right ">
                       	 	<button type="button" class="btn btn-sm btn-outline-secondary border-0"><img src="resources/icon/like_0.png"></button>
                       	 	<button type="button" class="btn btn-sm btn-outline-secondary border-0"><img src="resources/icon/delete-button.png"></button>
		                    <button type="button" class="btn btn-sm btn-outline-secondary border-0"><img src="resources/icon/create-comment-button.png"></button>
                        </div>
     				 </div>
     			</div>
     		</div>
     	</div>
     </div>
     
     

</body>
</html>