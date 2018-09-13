<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeLine</title>
<style type="text/css">
	 #pImg{
		  	height: 300px;
		  	width: 300px;
	}
	 
	.item img{
		margin: 3px;
	}
	
	.item {
		margin: 0 auto;
	   display: grid;
	   grid-gap: 10px;
	   grid-template-columns: repeat(auto-fill, minmax(250px,1fr));
	}
	
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
		padding-right: 0 !important;
	}
		
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
<!--masonry  -->
<script type="text/javascript">
	$(function() {
		var user_SessionID="${user_ID}"
		$("#btnUserProfile").click(function() {
			 location.href="profile/userProfile?user_ID="+user_SessionID;
		})
		
		<%String keyword = request.getParameter("keyword");%>
		
		$(".btn-outline-success").click(function(){
			var keyword = $("#keyword").val();
			if(keyword.indexOf("#") >= 0){
				var key = keyword.substr(1, keyword.length);
				$("#keyword").val(key);
				$("#F").attr("action","hashtag");
			} else {
				$("#F").attr("action","search");
			}
		})
		
		var l_post_no=[];
		var like_cmt_no=[];
		var like_post_no=[];
		
		$.ajax({
			url:"isLike.do",
			data:{"user_ID":"${user_ID}"},
			success:function(data){
				
				list=eval("("+data+")")
				$.each(list, function(i, l) {
					
					if(l.post_no!=null)
					{
						like_post_no[i]=l.post_no;
						console.log("postNo "+like_post_no)
					}
					if(l.comment_no!=null)
					{
						like_cmt_no[i]=l.comment_no;
						console.log("cmtNo "+like_cmt_no)
					}
				})// eachEnd
				
				//게시글 리스트
				$.ajax({url:'hashtagPost?keyword=<%=keyword%>',
						success:function(data){

						var list = eval("("+data+")") //게시물 리스트
						
						$.each(list, function(idx, p) { //게시글 생성
							var div_col_md_4 = $("<div id='cols'></div>").addClass("col-md-4");
							var div_card_mb4_box = $("<div></div>").addClass("card mb-4 box-shadow");
							var div_card_header = $("<div></div>").addClass("card-header").html(p.user_ID);
							var div_card_body = $("<div></div>").addClass("card-body");
							var div_card_footer = $("<div></div>").addClass("card-footer claerfix");
							
							var post_content=p.post_content;
							if(post_content == "undefined" || post_content==null ) // 글내용이 없을댸
							{
								post_content="";
							}
							if(post_content.length>=20) // 글 내용이 20자 이상일때
							{
								post_content=p.post_content.substring(0, 20)+"...";
							}			
							
							var p_card_text =$("<p></p>").addClass("card-text").html(post_content);
							var btn_group = $("<div></div>").addClass("btn-group")
							
							var div_f_left = $("<div></div>").addClass("float-left")
							var s_comment = $("<small></small>").html("댓글보기 ")
							var a_comment = $("<a data-role='button' data-transition='slide'></a>").addClass("d-block").attr({
								href : 'board/listComment?post_no='+p.post_no,	
							})
							var p_like_cnt = $("<p></p>").addClass("d-inline").html("likecnt")
							
							var btn_group = $("<div></div>").addClass("btn-group float-right")
							var btn_like = $("<button></button>").addClass("btn btn-sm btn-outline-secondary border-0")
						//	var btn_delete = $("<button type='button'></button>").addClass("btn btn-sm btn-outline-secondary border-0")
						//	var btn_edit = $("<button type='button' data-toggle='modal' data-target='#updatePost'></button>").addClass("btn btn-sm btn-outline-secondary border-0")
							
							var icon_like = $("<img/>").attr({src:"resources/icon/like_0.png"})
						//	var icon_delete = $("<img/>").attr({src:"resources/icon/delete-button.png"})
						//	var icon_update = $("<img/>").attr({src:"resources/icon/create-comment-button.png"})
							
							
							
							var pno_hidden = $("<p></p>").html(p.post_no)
							var small = $("<small></small>").addClass("text-muted").html(p.post_time)
							
						//	$(btn_edit).attr({no:p.post_no})
						//	$(btn_delete).attr({no:p.post_no})
							$(btn_like).attr({no:p.post_no})
							
							var detail_a=$("<a></a>").attr({
								href: "#",
								no: p.post_no
							})
							
							var img = $("<img/>").addClass("card-img-top").attr({
								src :"resources/image/"+p.post_fname,
								alt : "Card image cap"
							})
							var state=0;
							$.each(like_post_no, function(i, no) {
								if(no==p.post_no)
								{
									$(icon_like).attr({src:"resources/icon/like_1.png"})	
									state=1;
								}
							})
							
							var like = cntLike(p.post_no,null);  //게시글 좋아요 값 저장
							
							(p_like_cnt).html("likes  "+like); //좋아요 설정
							
							$(div_card_header).click(function() {
								var followId=$(this).html();
								location.href="profile/userProfile?user_ID="+followId;
							})
							
							$(btn_like).on("click",function() {
								var no=$(this).attr("no");
								if(state==0)
								{
									$.ajax({
										url:"doLike.do",
										data:{"user_ID":"${user_ID}","post_no":p.post_no},
										success:function(data){
											$(icon_like).attr({src:"resources/icon/like_1.png"})	
											like = cntLike(p.post_no,null);
											(p_like_cnt).html("likes  "+like);
									}})
									state=1
									return;
								}
								else if(state==1)
								{
									$.ajax({
										url:"cancelLike.do",
										data:{"user_ID":"${user_ID}","post_no":p.post_no},
										success:function(data){
											$(icon_like).attr({src:"resources/icon/like_0.png"})	
											like = cntLike(p.post_no,null);
											(p_like_cnt).html("likes  "+like);		
									}})
									state=0
									return;
								}	
							})
							
							
							$(a_comment).append(s_comment)
							
							$(div_f_left).append(p_like_cnt,a_comment)
							$(btn_like).append(icon_like)
					//		$(btn_delete).append(icon_delete)
					//		$(btn_edit).append(icon_update)
							
							$(btn_group).append(btn_like)
							
		
							$(detail_a).append(img)
							$(div_card_body).append(p_card_text)
							$(div_card_footer).append(div_f_left,btn_group)
							$(div_card_mb4_box).append(div_card_header,detail_a,div_card_body,div_card_footer)
							
							$(div_col_md_4).append(div_card_mb4_box)
							
							/* if(user_SessionID!=guestID){ // 버튼별 권한 로그인한 사람이 아닐때
								$(btn_delete).hide() 
								$(btn_edit).hide() 
							} */
							//else{$(btn_like).hide() } // 로그인한 사람일때
							
							
							
							
							/* $(btn_delete).click(function() { //게시글 삭제
								var no=$(this).attr("no");
								$.ajax({url:"deletePost",
									type:"post",
									data:{"post_no":no,"user_ID":user_SessionID},
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
								
								$.ajax({url:"detailPost?post_no="+no,success:function(data){
									detail=eval("("+data+")")
									//alert(detail.post_no)
									$('#post_content').html(detail.post_content);
									$('#updatate_Post_no').val(detail.post_no)
			
								}})
							}) */
							
			
							
						/* 	$("#commentSumbit").click(function() { //댓글 달기 ajax
										insertComment();
									})	 */
							
							//게시글 상세
							$(detail_a).click(function() { 
								var no=$(this).attr("no");
								$("#col_comment_content").empty();
								
								
								$.ajax({url:"detailPost?post_no="+no,success:function(data){ 
									
									detail=eval("("+data+")")
									//alert(data)
									$('#post_no').val(detail.post_no);
									$('#detail_Img').attr("src", "resources/img/"+detail.post_fname);
									$('#h3_detail_userID').html(detail.user_ID);
									$('#small_detail_content').html(detail.post_hash);
									$.ajax({ //댓글 리스트
										url:"listComment.do?post_no="+detail.post_no,
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
													$.ajax({url:"deleteComment",
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
									
								}})
								$('#detail_Dialog').modal('show')
							})
						$("#row1").append(div_col_md_4)
					});
				}}); //게시물 생성 ajax
				
		}})//ajax islikeEnd
		
		/* $imgs=$("#row1").imagesLoaded(function(){
			$imgs.masonry({
				itemSelector : '#cols', // img 태그를 대상으로 masonry 적용
				fitWidth : true // 내용물을 가운데 정렬하기, CSS margin:0 auto; 설정이 필요함
			});
		});   */
		
			
		/* $.ajax({
			url:'timeLinePost',
			success:function(data){
				list = eval("("+data+")");
				$.each(list, function(idx, p) {
					var fname=p.post_fname
					
					if(fname!=null) //파일이 없으면 이미지 생성 x
					{
						var img = $("<img id='pImg'/>").attr({
					 		src:"resources/image/"+fname
					 	})	
					}
				 	
				 	var detail_a=$("<a></a>").attr({
						href: "#",
						no: p.post_no
					})
					
					$(detail_a).append(img)
				 	$(".item").append(detail_a);
				 	
				 	$(detail_a).click(function() {
						no=$(this).attr("no");
						$("#col_comment_content").empty();
						$.ajax({url:"detailPost?post_no="+no,success:function(data){ //게시글 상세
							detail=eval("("+data+")")
							//alert(data)
							$('#post_no').val(detail.post_no);
							$('#detail_Img').attr("src", "resources/image/"+detail.post_fname);
							$('#h3_detail_userID').html(detail.user_ID);
							$('#small_detail_content').html(detail.post_content);
							$.ajax({ //댓글 리스트
								url:"listComment.do?post_no="+detail.post_no,
								success:function(data){
									var arr = eval("("+data+")")
									//alert(arr)
									$.each(arr, function(i,p){
										var h6 = $("<h6></h6>").html(p.user_ID+" ");
										var small = $("<small></small>").html(p.comment_content);
										$(h6).append(small);
										$("#col_comment_content").append(h6);
					
									}) 
								}})
							
						}})
						$('#detail_Dialog').modal('show')
					})
					
					$imgs=$(".item").imagesLoaded(function(){
						$imgs.masonry({
							itemSelector : 'img', // img 태그를 대상으로 masonry 적용
							fitWidth : true // 내용물을 가운데 정렬하기, CSS margin:0 auto; 설정이 필요함
						});
					});  
				})
				
				
			}})//ajax end */
			
			function cntLike(postNo,commentNo)
			{ //좋아요 카운트 함수
				var result;
				$.ajax({
					url:"cntLike.do",
					async: false,
					data:{"post_no":postNo,"comment_no":commentNo},
					success:function(data){
						result=data;
				}})
				return result;
			}
			
	})


</script>

</head>
<body>
<!--  네비게이션  -->
	<nav class="nav navbar navbar-expand-sm navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
 	 </button>
 	 
				<div class="navbar-header navbar-center mx-auto">
					<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="timeLine">Eden</a>
				</div>
				
<%-- 	<ul class="navbar-nav mx-4 my-2 d-block d-sm-none">
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
      </ul>
	  --%>
	  
	   <div class="navbar-nav mx-4 my-2 d-block d-sm-none">
	
	     <div class="btn-group">  
			<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
			<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			</button>
			<div class="dropdown-menu">
			  <a class="dropdown-item" href="profile/editProfile">프로필 설정</a>
			  <a class="dropdown-item" href="logout">로그아웃</a>
			</div>
		</div>
	 </div>
			<!-- 검색부분 old 	
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-lg-0 mx-auto" action="search">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="user_ID">
			        <div class="input-group-append">
			          <button class="btn btn-outline-success" type="submit" >
							<img src="resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			 </div>   
			  -->
			  
			<!-- 검색부분 new -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-lg-0 mx-auto" id="F">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
			        <div class="input-group-append">
			          <button class="btn btn-outline-success" type="submit" >
							<img src="resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			 </div>   
			
	<div class="navbar-nav mx-4 my-2 d-none d-sm-block">
	
	     <div class="btn-group">  
			<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
			<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			</button>
			<div class="dropdown-menu">
			  <a class="dropdown-item" href="profile/editProfile">프로필 설정</a>
			  <a class="dropdown-item" href="logout">로그아웃</a>
			</div>
		</div>
	 </div>
	</nav>
	
	<!-- <!-- 게시글  -->
	<div class="container">
		 <div class="row">
			<div class="col-md-12" id="masonry_col"> 
					<div class="item small"></div>
			</div>
		</div> 
	</div>
	
	<!-- 썸네일 게시판  -->
	<div class="container">
		<div class="row" id="row1">
			
	     </div>
     </div>
	
	
	<!-- detail modal -->
	<div class="modal modal-center fade" id="detail_Dialog" role="dialog"  tabindex="-1">
		<div class="modal-dialog modal-dialog-center"  role="document">
			<div class="modal-content h-100 d-flex no-gutters" id="content">
				<div class="container-fluid no-gutters" id="detailModalContainer">
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
								<div class="row">
									<div class="col-sm-12">
										<form action="insertComment.do" method="post">
										  <div class="form-row align-items-left">
										  	<div class="col-auto">
										  		<input type="hidden" name="user_ID" id="user_ID" value=${user_ID }>
										  	</div>
										  	<div class="col-auto">
										  		<input type="hidden" name="post_no" id="post_no">
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
		</div>
	</div>
			
	
	

	
</body>
</html>