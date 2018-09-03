<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><!-- icon을 위한link -->

<title>EditProfile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">
	$(function() {
		<% String sesseing_id=(String)session.getAttribute("user_ID"); %>
		/* $("#btnUserProfile").click(function() {
			alert("ok")
			location.href="../profile/userProfile?user_ID="+user_SessionID;
		}) */
	})
	
	$(document).ready(function(){ var fileTarget = $('.filebox .upload-hidden'); fileTarget.on('change', function(){
		// 값이 변경되면
		if(window.FileReader){
			// modern browser 
		var filename = $(this)[0].files[0].name; } 
		else { 	// old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
		
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename); 
		}); 
	}); 
	
	$("#mailck").click(function(){//메일 인증-----------------------------------------------------
		
		 
		var user_email = $("#user_Email").val()
			
				$.ajax({
					url:"mailTest.do?user_email="+user_email,
					success:function(data){
						var cd = eval("("+data+")")
						$("#code").val(data)
						conCode = cd;
					}
				});
					
				 $(function() {
						var time = 179;
						var interv = setInterval(function() {
							var m = time/60;
							if(m >= 2) { m = 2 }
							else if(m >= 1) { m = 1 }
							else { m = 0 }
							
							var s = time%60;
							$("#second").html("남은 인증시간:"+m+"분"+s+"초");
							time -= 1;
							if(time == -1)
							{
								clearInterval(interv);
								alert("인증 시간 3분이 모두 지났습니다. 다시 메일을 인증하세요")
								$("#checkEmil").modal("hide")
							}
							$("#clearInter").click(function(){
								clearInterval(interv);
								console.log(clearInterval(interv));
							})

						}, 1000);
						
			setTimeout(function(){
					
					$("<span></span>").html("메일인증 시간 3분이 모두 지났습니다.").appendTo("mailCheck");
					$("#second").remove;
				}, 180000);
			});	 
		
		$("#btnPrimary").click(function () {
			inpCode = $("#inputNum").val();
			
			if(conCode == inpCode){
				$(this).attr("data-dismiss","modal");
				$("#isMail").val(1)
				$("#msg").html("인증에 성공");
				$("#user_Mail_span").empty();
			} else {
				$(this).attr("data-dismiss","modal");
				$("#isMail").val(2)
				$("#msg").html("인증에 실패")
				$("#user_Mail_span").empty();
				
			}
			
			if($("#isMail").val()==1)
			{
				$("#join").attr("disabled", false);
				$("#announce").hide()
			}
		});
	}); //메일 인증----------------------------------------------------- 
	 
	
	function checkMail() {//mail 중복처리--------------------------------------------------------
	    
	    var useremail = $("#user_Email").val();
	   sessionStorage.setItem("user_email", useremail);
	alert(useremail)
	    $.ajax({
	    async: true,
	    type : 'post',
	    data : useremail,
	    url : "emailCheck.do",
	    dataType : "json",
	    contentType: "application/json; charset=UTF-8",
	    success : function(data){
	    	var arr = eval(data)
	    	var inpMail = sessionStorage.getItem("user_email");
	   		console.log(arr)
	   		$("#user_Mail_span").empty();
	   		
	   		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
	     
	     if(regex.test(useremail) === false ) {  
	    	 //email형식확인
	    	 $("#user_Email").css("background-color", "#FFCECE");
	  	 	  $("#user_Mail_span").empty();
	  	 	$("#mailck").hide()
	  	 	var w = $("<span>올바른 Email 형식을 입력하세요.</span>");
	  	 	$("#user_Mail_span").append(w);
	   		 } 
	   		
	   		if(arr == 1 ){
				//이메일이 중복됨
				 $("#user_Email").css("background-color", "#FFCECE");
			    	
			    	var warning = $("<span>이미등록된 Email입니다.</span>");
			    	
			    	$("#mailck").hide()
			    	
			    	$("#user_Mail_span").empty();
			    	$("#user_Mail_span").append(warning);
			} else if(arr != 1 && regex.test(useremail) === true){
				//이메일 사용 가능	
				
				$("#user_Mail_span").empty();
	        	$("#user_Email").css("background-color", "#B0F6AC");
	        	
	        	 var a = $("<span>사용가능한 Email입니다.</span>");
	        	 $("#mailck").show()
	        	$("#user_Mail_span").append(a);
			} 
	    }
	  });
		     
	}//mail 중복처리--------------------------------------------------------
	    

</script>

<style type="text/css">
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

</style>
</head>
<body>

<!--  네비게이션  -->
<nav class="nav navbar navbar-expand-sm navbar-light bg-light">
 
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
 </button>
 <div class="navbar-header navbar-center mx-auto">
	<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="../timeLine">Eden</a>
 </div>
 
<%--  <ul class="navbar-nav mx-4 my-2 d-block d-sm-none">
		<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${user_ID }
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
           <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="../logout">로그아웃</a>
        </div>
      </li>
 </ul> --%>
 
 <div class="navbar-nav mx-4 my-2 d-block d-sm-none">
	
	     <div class="btn-group">  
			<button type="button" class="btn btn-outline-primary" id="btnUserProfile">${user_ID }</button>
			<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			</button>
			<div class="dropdown-menu">
			  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
			  <a class="dropdown-item" href="../logout">로그아웃</a>
			</div>
		</div>
 </div>
      
    
<div class="collapse navbar-collapse " id="navbarSupportedContent">	
	
	<form class="form-inline my-lg-0 mx-auto" action="#">
		<div class="input-group">
			<input type="text" class="form-control " placeholder="Search" type="search" aria-label="Search">
			 <div class="input-group-append">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit" >
				<img src="../resources/icon/search2.png" width="18" height="18">
			</button>
			</div>
		</div>
	</form>
	 </div> <!-- 컨테이너  -->
	
<%-- 	  <ul class="navbar-nav mx-4 my-2 d-none d-sm-block">
		<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${user_ID }
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
           <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="../logout">로그아웃</a>
        </div>
      </li>
      </ul> --%>
	
	<div class="navbar-nav mx-2 my-2 d-none d-sm-block">
	
	     <div class="btn-group">  
			<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="../profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
			<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			</button>
			<div class="dropdown-menu">
			  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
			  <a class="dropdown-item" href="../logout">로그아웃</a>
			</div>
		</div>
	 </div>
	
</nav>
	
	
<!--사용자 프로필  -->
	<div class="container mx-0">
		<div class="row justify-content-between">
			<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar ">
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
			<div class="col-sm-9">
				<div class="tab-content">
					<!--프로필 수정  -->
					<div class="tab-pane container active" id="editProfile">
						<form action="../profile/editProfile" method="post">
						  <div class="form-group col-md-7 ">
						   	<img id="proPhoto" data-toggle="modal" data-target="#updatePost" src="../resources/image/${profile.user_fname }">
						   
							<span class="ml-5" for="user_ID" >${profile.user_ID}</span>
						    <input type="hidden" class="form-control" id="user_ID" name="user_ID" value="${profile.user_ID }">
						  </div>
					 
					<div class="filebox"> 
						<label for="ex_filename" class="fa fa-photo"></label> 
						<input class="upload-name" value="파일선택" disabled="disabled">
						<input type="file" id="ex_filename" class="upload-hidden"> 
					</div>

				<!-- <div class="form-group">
				  	    <label for="user_Password ">Email</label>
					    <input type="email" class="form-control" id="user_Email" name="user_Email" placeholder="email을 입력하세요" oninput="checkMail()" required="required">
					     <span id="user_Mail_span"></span>
					     
					    <input type="button" value="메일인증" id="mailck" data-toggle="modal" data-target="#checkEmil">
					    <input type="hidden" id="isMail" value="0"> 메일 통과 했는지 마는지
					  	<span id="msg"></span>
				  </div> -->

						  <div class="form-group .col-5 col-sm-12 col-md-10  col-lg-7">
						    <label for="user_Password ">Email</label><!-- email 변경할때도 인증된 email인지 테스트해서 존재하는 email만 넣을 수 있도록 해야함-->
						    <input type="email" class="form-control" id="user_Email" name="user_Email" placeholder="변경 할 email을 입력하세요" oninput="checkMail()" required="required">
						  	<span id="user_Mail_span"></span>
						  
						  	<input type="button" value="메일인증" id="mailck" data-toggle="modal" data-target="#checkEmil">
					    	<input type="hidden" id="isMail" value="0"><!--  메일 통과 했는지 마는지 -->
					  		<span id="msg"></span>
						  </div>
						  <div class="form-group .col-5 col-sm-12 col-md-10  col-lg-7">
						    <label for="user_Password ">Phone</label>
						    <input type="tel" class="form-control" id="user_Phone" name="user_Phone" placeholder="변경 할 Phone 번호를 입력하세요">
						  </div>
						  <button type="submit" class="btn btn-success .col-5 col-sm-12 col-md-10 col-lg-7">회원정보 변경</button>
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
	
	<!-- 메일인증 Modal -->
	<div class="modal fade " id="checkEmil" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document" >
	    <div class="modal-content"> 
	   <!-- <form class="form"  action="confirm.do" method="post">  --> 
	      <div class="modal-header">
	        <h5 class="modal-title">메일 인증</h5>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
	        	<input type="hidden" class="form-contorl" id="code" name="code">
	        </div>
	        <div class="form-group">
	        <input class="form-control" type="number" id="inputNum" placeholder="코드번호를 입력하세요">
	        <span id="second"></span>
		   	<span id="mailCheck"></span>
	        </div>
	        
	      </div>
	       <div class="modal-footer">
	        <button type="reset" class="btn btn-secondary" data-dismiss="modal" id="clearInter">취소</button>
	        <button class="btn btn-primary" id="btnPrimary">인증하기</button>
	      </div>
	     <!-- </form>  --> 
	    </div>
	  </div>
	</div>
	
	
</body>
</html>