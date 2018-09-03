<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">

	$(function() {
		
		var user_SessionID="${user_ID}"
		
		$("#goBack").click(function() {
			window.history.back();
		})
		
		$.ajax({ //댓글 리스트
			url:"../listComment.do?post_no=${post_no}",
			success:function(data){
				var arr = eval("("+data+")")
				//alert(arr)
				$.each(arr, function(i,p){
					var h6 = $("<h6></h6>").html(p.user_ID+" ");
					var small = $("<small></small>").html(p.comment_content);
					var btn_DeleteComment=$("<button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button>")

					$(small).append(btn_DeleteComment)
					if(user_SessionID!=p.user_ID){$(btn_DeleteComment).hide()}
					$(h6).append(small);
					$(h6).attr({
						id:"h6_"+i
					})
					$(btn_DeleteComment).attr("idx", i)
					
					$(btn_DeleteComment).click(function() { //댓글 삭제
						var cno=p.comment_no;
						var pno=p.post_no;
						var h=$(this).attr("idx")
						
						//alert(h)
						$.ajax({url:"../deleteComment",
							type:"post",
							data:{"comment_no":cno,"post_no":pno},
							success:function(data){
								if(data>=1)
								{
									 alert("삭제되었습니다.")
									 $("#h6_"+h).remove()
								}
								else
								{
									alert("삭제에 실패했습니다")
								}
							}})
					})
					//if(user_SessionID!=guestID){$(btn_DeleteComment).hide()}
					$("#col_comment_content").append(h6);
					
					
				}) 
			}})
		
	})

	

</script>
</head>
<body>

	<div class="cantainer">
		<div class="row justify-content-md-center">
			<div class="col col-sm-2 col-md-6 col-xl-8">
			
				<div class="card text-center">
				  <div class="card-header">
				    	<button class="btn float-left" id="goBack">
				    		<img  src="../resources/icon/left-arrow.png"/>
				    	</button>
				    	<p>댓글목록</p>
				  </div>
				  <div class="card-body">
				    <div class="col-sm-12" id="col_comment_content"></div>
				   <!--  <h5 class="card-title">Special title treatment</h5> -->
				   <%--  <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
				    <a href="#" class="btn btn-primary">${post_no }</a> --%>
				  </div>
				  <div class="card-footer text-muted">
				    <div class="row">
						<div class="col-sm-12">
<!-- 					<form class="form-inline" action="../insertComment" method="post" id="insertCommentForm" onsubmit="return false;"> -->
							<form action="../insertComment" method="post">
							  <div class="form-row align-items-left">
							  	<div class="col-auto">
							  		<input type="hidden" name="user_ID" id="user_ID" value=${user_ID }>
							  	</div>
							  	<div class="col-auto">
							  		<input type="hidden" name="post_no" id="post_no" value=${post_no }>
							  	</div>
							  	<div class="col-sm-10">
							  		<div class="input-group mb-3">
							  			<input type="text" class="form-control" id="comment_content" name="comment_content" placeholder="댓글 달기">
										<div class="input-group-append">
											<button type="submit" class="btn btn-primary">등록</button>
										</div>
							  		</div>
							  	</div>
							  </div>				
							</form>
						</div>
					</div>
				  </div>
				</div>
			
			</div>
		</div>
	
	
	</div>

</body>
</html>