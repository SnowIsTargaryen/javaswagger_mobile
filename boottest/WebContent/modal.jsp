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
<style type="text/css">
	.btn{
		height: 50px;
		margin-top: 10px;
	}
	
/* 	.modal {
        text-align: center;
	}
	 
	@media screen and (min-width: 768px) { 
	        .modal:before {
	                display: inline-block;
	                vertical-align: middle;
	                content: " ";
	                height: 100%;
	        }
	}
	 
	.modal-dialog {
	        display: inline-block;
	        text-align: left;
	        vertical-align: middle;
	}
	
	.modal-dialog.modal-fullsize { width: 100%; height: 100%; margin: 0; padding: 0; }


	
	.modal-content.modal-fullsize {
	  height: auto;
	  min-height: 100%;
	  border-radius: 0; 
	} */



	
	
</style>

<script type="text/javascript">
	
	
</script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
		    <div class="col align-self-start">
		    </div>
		    <div class="col align-self-center">
		    <button class="btn btn-primary col-md-9" data-toggle="modal" data-target="#testModal">모달 버튼</button> 
		    </div>
		    <div class="col align-self-end">
		    </div>
	  	</div>
	  	
	</div>
	
	
	
	
	<!-- Modal 폼 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="testModal">
	  <div class="modal-dialog modal-fullsize" role="document">
	    <div class="modal-content ">
	      <div class="modal-header text-center">
	        <h5 class="modal-title w-100 font-weight-bold">회원가입</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div><!-- modal header  -->
	      
	      <div class="modal-body">
	        <form>
	        	<div class="form-group row">
				    <label for="staticID" class="col-sm-2 col-form-label">ID</label>
				    <div class="col-sm-6">
				      <input type="text"  class="form-control" id="staticID" placeholder="8자리 이상의 아이디">	
				    </div>
				 </div>
	        	<div class="form-group row">
				    <label for="staticPassword" class="col-sm-2 col-form-label">Password</label>
				    <div class="col-sm-6">
				      <input type="password"  class="form-control" id="staticPassword" placeholder="10자리 이상의 비밀번호">	
				    </div>
				 </div>
	        	<div class="form-group row">
				    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
				    <div class="col-sm-6">
				      <input type="email"  class="form-control" id="staticEmail" placeholder="email@example.com">	
				    </div>
				 </div>
	        	<div class="form-group row">
				    <label for="staticPhone" class="col-sm-2 col-form-label">Phone</label>
				    <div class="col-sm-6">
				      <input type="number"  class="form-control" id="staticPhone" placeholder="01012345678">	
				    </div>
				 </div>
	        </form>
	      </div>
	      
	      <div class="modal-footer d-flex justify-content-center">
	        <button type="button" class="btn btn-primary">가입하기</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--Modal 폼 END-->
	
	
</body>
</html>