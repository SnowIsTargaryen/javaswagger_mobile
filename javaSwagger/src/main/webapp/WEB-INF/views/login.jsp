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
<!--부트 스트랩 CDN  -->
<link rel="stylesheet" type="text/css" href="resources/css/login.css" >

<script type="text/javascript">
	$(function() {
		$("#btnAccount").click(function() {
			location.href="account/create";
		})
	})
</script>

<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">로그인</h5>
            <form class="form-signin" action="login" method="post">
              <div class="form-label-group">
                <input type="text" id="user_ID" name="user_ID" class="form-control" placeholder="ID" required autofocus>
                <label for="user_ID">ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="user_Password" name="user_Password" class="form-control" placeholder="Password" required>
                <label for="user_Password">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Login</button>
              <hr class="my-4">
              
             <!--  <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button> -->
            </form>
            
            <button class="btn btn-lg btn-account btn-block text-uppercase" id="btnAccount">회원가입</button>	
<!--             <button class="btn btn-lg btn-account btn-block text-uppercase" data-toggle="modal" data-target=".account-modal-lg">회원가입</button>	 -->
            <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> 구글 계정으로 로그인</button>
          </div>
        </div>
   		</div>
    </div>
  </div>
</body>
</html>        
        
        <!-- <div class="modal fade account-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      	<form>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				      <label for="inputEmail4">Email</label>
				      <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
				    </div>
				    <div class="form-group col-md-6">
				      <label for="inputPassword4">Password</label>
				      <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
				    </div>
				  </div>
				  <div class="form-group col-md-6">
				    <label for="inputAddress">Email</label>
				    <input type="email" class="form-control" id="email" placeholder="1234@gmail.com">
				  </div>
				  <div class="form-group col-md-6">
				    <label for="inputPhone">Phone</label>
				    <input type="text" class="form-control" id="phone" placeholder="0101234567">
				  </div>
				  
				  <div class="form-group col-md-6">
				    <div class="form-check">
				      <input class="form-check-input" type="checkbox" id="gridCheck">
				      <label class="form-check-label" for="gridCheck">
				        Check me out
				      </label>
				    </div>
				  </div>
				  <button type="submit" class="btn btn-primary">Sign in</button>
				</form>
		    </div>
		  </div>
		</div> 모달  -->
		        
        
   