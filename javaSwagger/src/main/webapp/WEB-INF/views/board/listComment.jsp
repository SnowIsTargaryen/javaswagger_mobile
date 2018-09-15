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
		var postNo=${post_no}
		$("#back").click(function() {
			window.history.back();
		})
		
		$.ajax({ //게시글 상세
			url:"../detailPost",
			data:{"post_no":postNo},
			success:function(data){
				var p=eval("("+data+")")
				alert(p.user_fname)
				$("#postImage").attr({src:"../resources/image/"+p.user_fname+""});
				$("#postWriter").html(p.user_ID);
				$("#postContent").html(p.post_content)
			
		}})
		
		$.ajax({ //댓글 리스트
			url:"../listComment2.do?post_no=${post_no}",
			success:function(data){
				
				var arr = eval("("+data+")")
				//alert(arr)
				$.each(arr, function(i,p){
					//alert(p)
					var div_comment=$("<div class='media text-muted pt-3'></div>")
					var img_comment=$("<img data-src='"+p.user_fname+"' alt='32x32' class='mr-2 rounded' src='../resources/image/"+p.user_fname+"' data-holder-rendered='true' style='width: 32px; height: 32px;'/>")
					var p_comment=$("<p class='media-body pb-3 mb-0 small lh-125 border-bottom border-gray'></p>").html(p.comment_content);
					var strong_comment=$("<strong class='d-block text-gray-dark'></strong>").html(p.user_ID)
					
					var h6 = $("<h6 class='d-inline float-left'></h6>").html(p.user_ID+" ");
					var small = $("<small></small>").html(p.comment_content);
					
					var btn_DeleteComment=$("<button type='button' class='close float-right' aria-label='Close'><span aria-hidden='true'>&times;</span></button>")
					
					//<div class="col-sm-12"><h6 class="d-inline float-left">tiger<small>tt</small></h6><button type='button' class='close float-right' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>

					
					if(user_SessionID!=p.user_ID){$(btn_DeleteComment).hide()}
					$(h6).append(small);
					$(div_comment).attr({
						id:"c_"+i
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
									 alert("삭제되었습니다.");
									 $("#c_"+h).remove()
								}
								else
								{
									alert("삭제에 실패했습니다")
								}
							}})
					})
					//if(user_SessionID!=guestID){$(btn_DeleteComment).hide()}
					$(p_comment).prepend(strong_comment); //첫번째 순서로 붙힘 prepend
					$(div_comment).append(img_comment,p_comment,btn_DeleteComment);
					$("#col_comment_content").append(div_comment);
					
					
				}) 
			}})
		
	})

	

</script>
</head>
<body>

	<div class="cantainer">
		<div class="row justify-content-md-center">
			<div class="col col-md-6">
			
				<div class="card">
				  <div class="card-header ">
				    	<button type="button" class="btn flot-right btn-sm btn-outline-secondary border-0" id="back"><img src="../resources/icon/left-arrow.png" ></button>
				    	<p class="mx-auto text-center">댓글목록</p>
				  </div>
				 
				  <div class="card-body" id="col_comment_content">
				  	<div class="d-flex align-items-center p-3 my-3 text-black-50 bg-purple rounded shadow-sm">
				        <img class="mr-3" id="postImage" width="48" height="48">
				        <div class="lh-100">
				          <h6 class="mb-0 text-black lh-100" id="postWriter"></h6>
				          <small id="postContent"></small>
				        </div>
			      	</div>
			      	
					<h6 class="border-bottom border-gray pb-2 mb-0">Recent updates</h6>
				  </div>
				  
				  <div class="card-footer text-center">
				  
				  		<form action="../insertComment" class="form-signin" method="post">
							  <div class="form-row align-items-left">
							  	<div class="col-auto">
							  		<input type="hidden" name="user_ID" id="user_ID" value=${user_ID }>
							  	</div>
							  	<div class="col-auto">
							  		<input type="hidden" name="post_no" id="post_no" value=${post_no }>
							  		<input type="hidden" name="vn" id="vn" value="lc">
							  	</div>
							  	<!-- <div class="form-group col-md-10 align-self-center"> -->
							  	<div class="form-group col align-self-center">
							  		<div class="input-group mb-3">
							  			<input type="text" class="form-control" id="comment_content" name="comment_content" placeholder="댓글 달기">
										<div class="input-group-append">
											<button type="submit" class="btn btn-primary">등록</button>
										</div>
							  		</div>
							  	</div>
							  </div>				
							</form>
				    <%-- <div class="row">
				   
				    	
				    	<div class="col col-lg-10 align-self-center">
							<form action="../insertComment" class="form-signin" method="post">
							  <div class="form-row align-items-left">
							  	<div class="col-auto">
							  		<input type="hidden" name="user_ID" id="user_ID" value=${user_ID }>
							  	</div>
							  	<div class="col-auto">
							  		<input type="hidden" name="post_no" id="post_no" value=${post_no }>
							  	</div>
							  	<div class="col align-self-center">
							  		<div class="input-group mb-3">
							  			<input type="text" class="form-control" id="comment_content" name="comment_content" placeholder="댓글 달기">
										<div class="input-group-append">
											<button type="submit" class="btn btn-primary">등록</button>
										</div>
							  		</div>
							  	</div>
							  </div>				
							</form>
						</div> --%>
					
						
					</div>
				  </div>
				</div>
			
			</div>
		</div>
	


</body>
</html>