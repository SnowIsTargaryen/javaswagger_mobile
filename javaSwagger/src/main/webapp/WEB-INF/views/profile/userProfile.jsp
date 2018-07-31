<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.modal-dialog{
		max-width: 60% !important; 
		
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

	.container-fluid{
	
		padding-left: 0 !important;
	}




	
</style> 

<title>Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->

<script type="text/javascript">
	$(function() {
		var arr;
		<% String sesseing_id=(String)session.getAttribute("user_ID"); %> //로그인한 사용자
		<% String get_id=(String)request.getParameter("user_ID"); %> //사용자
		
		var myID=$("#btnUserProfile").html()
		var guestID=$("#jumboUserID").html()
		
		if(myID!=guestID){$("#write").hide();}
		
		$("#btnUserProfile").click(function() {
			location.href="../profile/userProfile?user_ID=<%=sesseing_id%>"
		})
		
		$.ajax({url:"../board/listPost?user_ID=<%=get_id%>",
				/* async:false, */
				success:function(data){
			var list = eval("("+data+")") //게시물 리스트
			
			$.each(list, function(idx, p) { //게시글 생성
				
				var div_col_md_4 = $("<div></div>").addClass("col-md-4");
				var div_card_mb4_box = $("<div></div>").addClass("card mb-4 box-shadow");
				var div_card_body = $("<div></div>").addClass("card-body");
				var p_card_text =$("<p></p>").addClass("card-text").html(p.post_content);
				var d_flex = $("<div></div>").addClass("d-flex justify-content-between align-items-center")
				var btn_group = $("<div></div>").addClass("btn-group")
				var btn_delete  = $("<button type='button'></button>").addClass("btn btn-sm btn-outline-secondary").html("Delete")
				var btn_edit =  $("<button type='button' data-toggle='modal' data-target='#updatePost'></button>").addClass("btn btn-sm btn-outline-secondary").html("Edit")
				var pno_hidden = $("<p></p>").html(p.post_no)
				var small = $("<small></small>").addClass("text-muted").html(p.post_time)
				
				$(btn_edit).attr({no:p.post_no})
				$(btn_delete).attr({no:p.post_no})
				
				var detail_a=$("<a></a>").attr({
					href: "#",
					no: p.post_no
				})
				
				var img = $("<img/>").addClass("card-img-top").attr({
					src :"../resources/image/"+p.post_fname,
					alt : "Card image cap"
				})
				
				$(detail_a).append(img)
				$(btn_group).append(btn_delete,btn_edit)
				$(d_flex).append(btn_group,small)
				$(div_card_body).append(p_card_text,d_flex)
				$(div_card_mb4_box).append(detail_a,div_card_body)
				
				$(div_col_md_4).append(div_card_mb4_box)
				
				if(myID!=guestID){$(btn_group).hide()}
				
				$(btn_delete).click(function() { //게시글 삭제
					var no=$(this).attr("no");
					$.ajax({url:"../deletePost",
						type:"post",
						data:{"post_no":no,"user_ID":myID},
						success:function(data){
							if(data>=1)
							{
								 alert("삭제되었습니다.")
								 $(div_col_md_4).empty()
							}
							else
							{
								alert("삭제에 실패했습니다")
							}
						}})
				})
				
				$(btn_edit).click(function() { //게시글 수정
				 	var no=$(this).attr("no");
					
					$.ajax({url:"../detailPost?post_no="+no,success:function(data){
						detail=eval("("+data+")")
						//alert(detail.post_no)
						$('#post_content').html(detail.post_content);
						$('#updatate_Post_no').val(detail.post_no)

					}})
				})
				
				$(detail_a).click(function() { //게시글 상세
					var no=$(this).attr("no");
					$("#col_comment_content").empty();
					$.ajax({url:"../detailPost?post_no="+no,success:function(data){ 
						detail=eval("("+data+")")
						//alert(data)
						$('#post_no').val(detail.post_no);
						$('#detail_Img').attr("src", "../resources/image/"+detail.post_fname);
						$('#h3_detail_userID').html(detail.user_ID);
						$('#small_detail_content').html(detail.post_content);
						$.ajax({ //댓글 리스트
							url:"../listComment.do?post_no="+detail.post_no,
							success:function(data){
								var arr = eval("("+data+")")
								//alert(arr)
								$.each(arr, function(i,p){
									var h6 = $("<h6></h6>").html(p.user_ID+" ");
									var small = $("<small></small>").html(p.comment_content);
									var btn_DeleteComment=$("<button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button>")
			
									$(small).append(btn_DeleteComment)
									if(myID!=p.user_ID){$(btn_DeleteComment).hide()}
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
									if(myID!=guestID){$(btn_DeleteComment).hide()}
									$("#col_comment_content").append(h6);
									
				
								}) 
							}})
						
					}})
					$('#detail_Dialog').modal('show')
				})
				$("#row1").append(div_col_md_4)
			});
		}}); //게시물 생성 ajax

		
		
	});
	

</script>


</head>
<body>
<!--  네비게이션  -->
	<nav class="navbar">
		<div class="container">
			<div class="col-4">
				<div class="navbar-header navbar-left">
					<h1><a class="navbar-brand" href="../timeLine">Eden</a></h1>
				</div>
			</div>
			<div class="col-4">
				<form class="navbar-form navbar-center" action="../search">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="user_ID">
			        <div class="input-group-append">
			          <button class="btn btn-outline-secondary" type="submit" >
							<img src="../resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
	            <div class="btn-group">
	            
			    <button type="button" class="btn btn-default" id="btnUserProfile">${user_ID }</button>
			    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
			      <a class="dropdown-item" href="../logout">로그아웃</a>
			    </div>
			  </div>
	        </div>
		</div> <!-- 컨테이너  -->
	</nav>
	
<!--사용자 프로필  -->
	<div class="container">
		<div class="jumbotron">
			<div class="row" id="header">
				<div class="col-sm-2">
					<img src="../resources/icon/user2.png">
				</div>
				<div class="row">
					<div class="col-sm-2">
						<h2 id="jumboUserID">${profile.user_ID }</h2>
					</div>
					<div class="col-sm-10">
						<a data-toggle="modal" data-target="#insertPost" id="write" ><img src="../resources/icon/contract.png"></a>
					</div>
					<div class="col-sm-12">
						<span>팔로워</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>팔로잉</span>
					</div>
					<div class="col-sm-12">
						<p>${profile.user_Email }</p>
					</div>
				</div><!--inner row1  -->
			</div><!--header row  -->
		</div> 
	</div>
	
	<!-- 글쓰기 Modal -->
	<div class="modal fade " id="insertPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document" >
	    <div class="modal-content"> 
	    <form class="form"  action="../insertPost.do" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
	        <h5 class="modal-title">새 글 쓰기</h5>
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
	        	<input type="hidden" class="form-contorl" id="user_ID" name="user_ID" value="${profile.user_ID }">
	        </div>
	        <div class="form-group">
	        	<textarea class="form-control" rows="5" name="post_content" placeholder="내용을 입력하세요"></textarea>
	        </div>
	        <div class="form-group">
	        	<input type="file" class="form-contorl-file" name="uploadFile">
	        </div>
	      </div>
	       <div class="modal-footer">
	        <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">글쓰기</button>
	      </div>
	      </form> 
	    </div>
	  </div>
	</div>
	
	<!-- 글 수정 Modal -->
	<div class="modal fade " id="updatePost" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document" >
	    <div class="modal-content"> 
	    <form class="form"  action="../updatePost.do" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
	        <h5 class="modal-title">글 수정</h5>
	      	<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>  post_no-->
	      </div>
	      <div class="modal-body">
	        <div class="form-group">
	        	<input type="hidden" class="form-contorl" id="updatate_Post_no" name="post_no">
	        </div>
	        <div class="form-group">
	        	<input type="hidden" class="form-contorl" id="user_ID" name="user_ID" value="${profile.user_ID }">
	        </div>
	        <div class="form-group">
	        	<textarea class="form-control" rows="5" id="post_content" name="post_content" placeholder="내용을 입력하세요"></textarea>
	        </div>
	        <div class="form-group">
	        	<input type="file" class="form-contorl-file" name="uploadFile">
	        </div>
	      </div>
	       <div class="modal-footer">
	        <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">수정하기</button>
	      </div>
	      </form> 
	    </div>
	  </div>
	</div> 
	
	<!-- detail modal -->
	<div class="modal modal-center fade" id="detail_Dialog" role="dialog"  tabindex="-1">
		<div class="modal-dialog modal-dialog-center"  role="document">
			<div class="modal-content h-100 d-flex" id="content">
				<div class="container-fluid">
					<div class="row d-flex no-gutters">
						<div class="col-md-8 box-shadow h-100" >
						<img  id="detail_Img" class="img-fluid d-inline-block">
						</div>
						<div class="col-md-4">	
							<div class="modal-header">
								<h3 id="h3_detail_userID"></h3>
							</div>
							<div class="modal-body" style="overflow:auto">
								<div class="row" id="detail_content">
									<div class="col-sm-12">
										<h6 id="h6_detail_userID"><small id="small_detail_content">내용</small></h6>
									</div>
								</div>
								<div class="row" id="row_comment_content">
									<div class="col-sm-12" id="col_comment_content">
										<h6><small></small></h6>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<form class="form-inline" action="../insertComment.do" method="post">
								  <input type="hidden" name="user_ID" id="user_ID" value=${user_ID }>
								  <input type="hidden" name="post_no" id="post_no">
								  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="comment_content" name="comment_content" placeholder="댓글 달기">
								  <button type="submit" class="btn btn-primary">등록</button>
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 썸네일 게시판  -->
	<div class="container">
		<div class="row" id="row1">
			<!-- <div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top" src="../resources/image/new zealand.jpg" alt="Card image cap">
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
			</div> -->
	     </div>
     </div>
	
	
</body>
</html>