<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!-- 부트 스트랩 CDN  -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script type="text/javascript">

function checkMail() {//mail 중복처리--------------------------------------------------------
    
    var useremail = $("#user_Email").val();
   sessionStorage.setItem("user_email", useremail);

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
  
  
function checkPhone() {//phone 중복처리--------------------------------------------------------
    
    var userphone = $("#user_Phone").val();
   sessionStorage.setItem("user_phone", userphone);
  
   
    $.ajax({
    async: true,
    type : 'post',
    data : userphone,
    url : "phoneCheck.do",
    dataType : "json",
    contentType: "application/json; charset=UTF-8",
    success : function(data){
    	sessionStorage.setItem("data", data);
    	 var re = sessionStorage.getItem("user_phone");
    	
    	/* var phonenum = $('#user_phone').val(); */
    	
    	// var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    	
    	
    	if (data) {//data의 값을 스트링으로 형변환해서 session에 유지된 값과 비교하여 중복처리
    	 
    	   $("#user_Phone").css("background-color", "#FFCECE");
    	
    	var warning = $("<span>이미등록된 번호입니다.</span>");
    	$("#user_Phone_span").empty();
    	$("#user_Phone_span").append(warning);
  
        }       
       else if(data == null && re.length < 14){   	   
    	  
    	   $("#user_Phone_span").empty();
        	$("#user_Phone").css("background-color", "#B0F6AC");
        	
        	 var a = $("<span>사용가능한 번호입니다.</span>");
        	$("#user_Phone_span").append(a);
         	idck = 1;
        }  
     

   /*   else if(!regPhone.test(re)) ///수정해야함
    	{
    	   
    	$("#user_Phone").css("background-color", "#FFCECE");
       	
       	var warning = $("<span>정확한 번호를입력하세요.</span>");
       	$("#user_Phone_span").empty();
       	$("#user_Phone_span").append(warning);
    	}  */
       else
	   	{
	   	   
	   	$("#user_Phone").css("background-color", "#FFCECE");
	      	
	      	var warning = $("<span>정확한 번호를입력하세요.</span>");
	      	$("#user_Phone_span").empty();
	      	$("#user_Phone_span").append(warning);
	   	}
    },
    error : function(error) {
        
        alert("error : " + error);
    }    
  });
	     
}//phone 중복처리--------------------------------------------------------

//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )--------------------------------------
var idck = 0;
$(function() {
	var conCode = 0;
	var inpCode = 0;
  
	//idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
    	
    	  //userid 를 param.
            var userid =  $("#user_ID").val();
     	    $.ajax({
            async: true,
            type : 'post',
            data : userid,
            url : "idCheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data){
 			JSON.stringify(data)
 		
            if (data > 0) {
            	
            	$("#user_ID").css("background-color", "#FFCECE");
            	
            	var warning = $("<span>다른아이디를 입력하세요.</span>");
            	$("#user_ID_span").empty();
            	$("#user_ID_span").append(warning);
          
                } else {
                	$("#user_ID_span").empty();
                	$("#user_ID").css("background-color", "#B0F6AC");
                	var a = $("<span>사용가능한 아이디입니다.</span>");
                	$("#user_ID_span").append(a);
                 	idck = 1;
                 
                } 
            },
           error : function(error) {
                
                alert("error : " + error);
            } 
     	    
        }); 
});//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )--------------------------------------
		
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
				 
	});
	 

	//$("#btnPrimary").click(function () {
	//	inpCode = $("#btnPrimary").val();
	//	$("#inpCode").val(inpCode);
	//	$("#conCode").val(conCode);
	//	if(inpCode == conCode){
	//		$(this).attr("data-dismiss","modal");
	//	}
	//})
	
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
 
function checkPwd(){//비밀번호 확인---------------------------------------------------------
	var inputed = $("#user_Password").val();
	var reinputed =$("#repwd").val(); 
		
	var an = $("<span>비밀번호를 확인하세요.</span>");
	var co = $("<span>비밀번호 일치!</span>");
	
	if(reinputed=="" && inputed != reinputed)
	{
		$("#pwdcheck").empty();
		$("#repwd").css("background-color", "#FFCECE");
		
	}
	else if (inputed == reinputed) {
		
		$("#pwdcheck").empty();
		
		$("#repwd").css("background-color", "#B0F6AC");
		$("#pwdcheck").append(co);
        pwdCheck = 1;
	}
	else if (inputed != reinputed) {
        pwdCheck = 0;
        $("#pwdcheck").empty();
        $("#repwd").css("background-color", "#FFCECE");
        $("#pwdcheck").append(an);  
    }

}//비밀번호 확인----------------------------------------------------------------------------
  
</script>
<title>회원가입</title>
</head>
<body>

	<!--   <form action="../account/create" method="post">
		아이디:<input type="text" name="user_ID"><br>
		비밀번호:<input type="text" name="user_Password"><br>
		이메일:<input type="text" name="user_Email"><br>
		폰:<input type="text" name="user_Phone"><br>
		<input type="submit" value="등록">
	</form>   -->	


<div class="container" >
	<div class="row" >
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<form action="../account/create" id="userInfo" method="post">
			  <div class="form-group ">
			    <label for="user_ID">아이디</label>
			    <input type="text" class="form-control" id="user_ID" name="user_ID" placeholder="아이디를 입력하세요" required="required">
			    <input type="button" value="중복확인"  id="idck">
			    <span id="user_ID_span"></span>
			  </div>
				
			   <div class="form-group">
				    <label for="user_Password">비밀번호</label>
				    <input type="password" class="form-control" id="user_Password" name="user_Password" placeholder="비밀번호를 입력하세요" required="required">
				  </div>
				   <div class="form-group">
				  <label for="repwd">비밀번호 확인</label> 
		            <input type="password"  placeholder="비밀번호를 다시 입력하세요" name="repwd" 
		               class="form-control" required class="pass" id="repwd" oninput="checkPwd()"> 
		          		<span id="pwdcheck"></span>
		          </div>
		        
				  <div class="form-group">
				  	    <label for="user_Password ">Email</label>
					    <input type="email" class="form-control" id="user_Email" name="user_Email" placeholder="email을 입력하세요" oninput="checkMail()" required="required">
					     <span id="user_Mail_span"></span>
					     
					    <input type="button" value="메일인증" id="mailck" data-toggle="modal" data-target="#checkEmil">
					    <input type="hidden" id="isMail" value="0"> <!-- 메일 통과 했는지 마는지 -->
					  	<span id="msg"></span>
				  </div>
				  <div class="form-group">
				    <label for="user_Password ">Phone</label>
				    <input type="text" class="form-control" id="user_Phone" name="user_Phone" oninput="checkPhone()" placeholder="핸드폰 번호 입력 ex)010-0000-0000" required="required">
				    <span id="user_Phone_span"></span>
				  </div>
				  <button type="submit" class="btn btn-success col-md-4" id="join" disabled="true">회원가입</button>
				  <span id="announce">*메일 인증시 버튼이 활성화 됩니다.</span>
				</form>
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
	        <input class="form-control" type="number" id="inputNum" placeholder="코드를 입력하세요">
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