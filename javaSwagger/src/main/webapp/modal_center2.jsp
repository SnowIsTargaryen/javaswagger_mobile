<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <style type="text/css">
	.modal-dialog{
		max-width: 50% !important; 
		
	}
	#content{
		height: 650px;
	}
	
	.modal.modal-center { 
	
		text-align: center;
		text-align: left;
		top:15%;
		right:10%
		left: 15%;
	}

	/* .container{
	
		width: 100%;
	}
	.row{
		height: 100%
		
	} */
	
	.container-fluid{
	
		padding-left: 0 !important;
	}




	
</style> 

<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
	<style type="text/css">
		.cl
	
	</style>
</head>
<body>


<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detail_Dialog">Large modal</button>
<!-- modal 구동 버튼 (trigger) -->
<a data-toggle="modal" data-target="#detail_Dialog">d</a>
<!-- detail modal -->
<div class="modal modal-center fade " id="detail_Dialog" role="dialog"  tabindex="-1">
	<div class="modal-dialog modal-dialog-center"  role="document">
		<div class="modal-content h-100 d-flex" id="content">
			<div class="container-fluid">
				<div class="row d-flex no-gutters">
					<div class="col-md-8 box-shadow h-100" >
					<img src="resources\image\new york.jpg" class="img-fluid d-inline-block">
					</div>
					<div class="col-md-4">	
						<div class="modal-header">
							<h3>작성자</h3>
						</div>
						<div class="modal-body">
							<p>글내용</p>
						</div>
						<div class="modal-footer">
							<p>댓글 좋아요 등?</p>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




</body>
</html>