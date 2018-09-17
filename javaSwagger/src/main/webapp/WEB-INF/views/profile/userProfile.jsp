<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/footerBar.css" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<style type="text/css">
	
  header {
	  position: fixed; 
	  top: 0; 
	  left: 0; 
	  width: 100%; 
	  height: 1px; 
	 /*  background: #f5b335;  */
	  transition: top 0.2s ease-in-out; 
	  }  
	  .nav-up { 
	  top: -40px; 
	   }
	
	#modal-detail{
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

	.container-fluid{
	
		padding-left: 0 !important;
		padding-right: 0 !important;
	}
	
	.bg-image-full {
	  background: no-repeat center center scroll;
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  background-size: cover;
	  -o-background-size: cover;
  	}
  	
	#proPhoto{
		width: 120px;
	    height:120px;
	    border-radius: 60px; /* 이미지 반크기만큼 반경을 잡기*/
	}
	
 	#profileImg{	
	  	width: 100px;
	  	height: 100px; 
  	}
  	
  	#profileHeader{
  		margin-bottom: 50px;
  	}
  	
	.card-img-top{
		height: 350px;
	}  	
	
</style> 

<title>Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->

<!-- Bootstrap Core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<link href="../resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/css/stylish-portfolio.min.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {

		// Hide Header on on scroll down 
		var didScroll; 
		var lastScrollTop = 0; 
		var delta = 5; 
		var navbarHeight = $('header').outerHeight(); 
		
		$(window).scroll(function(event){ 
			didScroll = true; 
		}); 
		
		setInterval(function() { 
			if (didScroll) { 
				hasScrolled(); 
				didScroll = false; 
		} 
		}, 250); 
		
		function hasScrolled() { 
			var st = $(this).scrollTop(); 
			
			// Make sure they scroll more than delta 
			if(Math.abs(lastScrollTop - st) <= delta) return; 
			
			// If they scrolled down and are past the navbar, add class .nav-up. 
			// This is necessary so you never see what is "behind" the navbar. 
			if (st > lastScrollTop && st > navbarHeight){ 
				
				// Scroll Down 
				 $( '.icon-bar' ).fadeOut();
			}
			else { 
			
			// Scroll Up 
			if(st + $(window).height() < $(document).height()) { 
				 $( '.icon-bar' ).fadeIn(); 
				} 
			} 
			
			lastScrollTop = st;
			
		}
		
		var arr;
		<% String get_id=(String)request.getParameter("user_ID"); %> //사용자
		
		$(".btn-outline-success").click(function(){
			var keyword = $("#keyword").val();
			if(keyword.indexOf("#") >= 0){
				var key = keyword.substr(1, keyword.length);
				$("#keyword").val(key);
				$("#F").attr("action","../hashtag");
			} else {
				$("#F").attr("action","../search");
			}
		})
		
		var user_SessionID="${user_ID}"
		var guestID=$("#guestID").html()
		
		var list_Following=[]; // 팔로잉 리시트 확인용 
		var list_Follower=[]; //팔로워 리스트
		
		
		if(user_SessionID==guestID){$("#b_follow").hide();} // 글쓰기 권한 로그인한 사용자 전용
		var profileImg='${profile.user_fname}';
		
		if(profileImg==null || profileImg=='') // 사진없으면 박보영 나옴
		{
			$("#profileImg").attr({
				src:"../resources/icon/user2.png"
			})
		}

		/* $("#btnUserProfile").click(function() {
			location.href="../profile/userProfile?user_ID="+user_SessionID;
		}) */

		$("#btnUserProfile").click(function() {
			//alert("ok")
			/* location.href="../profile/userProfile?user_ID="+user_SessionID; */
		})

		if(user_SessionID==guestID){$("#btn_Follow").hide()}
				
		 var insertComment = function() {
			var params = $("#insertCommentForm").serialize();
				$.ajax({
					url:"../insertComment",
					data:params,
					type:'post',
					success:function(data)
					{
						//alert(data)
					}
				})
		}//댓글 ajax */
		
		var l_post_no=[];
		var like_cmt_no=[];
		var like_post_no=[];
		
		$.ajax({
			url:"../isLike.do",
			data:{"user_ID":"${user_ID}"},
			success:function(data){
				
				list=eval("("+data+")")
				$.each(list, function(i, l) {
					
					if(l.post_no!=null)
					{
						like_post_no[i]=l.post_no;
						//console.log("postNo "+like_post_no)
					}
					if(l.comment_no!=null)
					{
						like_cmt_no[i]=l.comment_no;
						//console.log("cmtNo "+like_cmt_no)
					}
				})// eachEnd
				
				//게시글 리스트
				$.ajax({url:"../board/listPost?user_ID=<%=get_id%>",
						success:function(data){
						var list = eval("("+data+")") //게시물 리스트
						
						$.each(list, function(idx, p) { //게시글 생성
							var div_col_md_4 = $("<div></div>").addClass("col-md-4");
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
							var s_comment = $("<small></small>")
							var a_comment = $("<a data-role='button' data-transition='slide'></a>").addClass("d-block").attr({
								href : '../board/listComment?post_no='+p.post_no,	
							})
							var p_like_cnt = $("<p></p>").addClass("d-block").html("Likecnt")
							
							var btn_group = $("<div></div>").addClass("btn-group float-right")
							var btn_like = $("<button></button>").addClass("btn btn-sm btn-outline-secondary border-0")
							var btn_delete = $("<button type='button'></button>").addClass("btn btn-sm btn-outline-secondary border-0")
							var btn_edit = $("<button type='button' data-toggle='modal' data-target='#updatePost'></button>").addClass("btn btn-sm btn-outline-secondary border-0")
							
							var icon_like = $("<img/>").attr({src:"../resources/icon/like_0.png"})
							var icon_delete = $("<img/>").attr({src:"../resources/icon/delete-button.png"})
							var icon_update = $("<img/>").attr({src:"../resources/icon/create-comment-button.png"})
							
							
							
							var pno_hidden = $("<p></p>").html(p.post_no)
							var small = $("<small></small>").addClass("text-muted").html(p.post_time)
							
							$(btn_edit).attr({no:p.post_no})
							$(btn_delete).attr({no:p.post_no})
							$(btn_like).attr({no:p.post_no})
							
							var detail_a=$("<a></a>").attr({
								href: "#",
								no: p.post_no
							})
							
							var img = $("<img/>").addClass("card-img-top").attr({
								src :"../resources/image/"+p.post_fname,
								alt : "Card image cap"
							})
							
							$.get("../resources/image/"+p.post_fname).done(function() {
								
							}).fail(function() {
								$(img).attr({
									src :"../resources/image/error404.jpg"
								})
							})
							var state=0;
							$.each(like_post_no, function(i, no) {
								if(no==p.post_no)
								{
									$(icon_like).attr({src:"../resources/icon/like_1.png"})	
									state=1;
								}
							})
							
							var like = cntLike(p.post_no,null);  //게시글 좋아요 값 저장
							(p_like_cnt).html("Like  "+like); //좋아요 설정
							
							var cntComment = cntCommnet(p.post_no);
							//alert(cntComment)
							$(s_comment).html("댓글보기  ")
							if(cntComment!=0)
							{
								$(s_comment).html("댓글보기  " +cntComment)
							}
							
							
							$(btn_like).on("click",function() {
								var no=$(this).attr("no");
								if(state==0)
								{
									$.ajax({
										url:"../doLike.do",
										data:{"user_ID":"${user_ID}","post_no":p.post_no},
										success:function(data){
											$(icon_like).attr({src:"../resources/icon/like_1.png"})	
											like = cntLike(p.post_no,null);
											(p_like_cnt).html("likes  "+like);
									}})
									state=1
									return;
								}
								else if(state==1)
								{
									$.ajax({
										url:"../cancelLike.do",
										data:{"user_ID":"${user_ID}","post_no":p.post_no},
										success:function(data){
											$(icon_like).attr({src:"../resources/icon/like_0.png"})	
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
							$(btn_delete).append(icon_delete)
							$(btn_edit).append(icon_update)
							
							$(btn_group).append(btn_like,btn_delete,btn_edit)

							$(detail_a).append(img)
							$(div_card_body).append(p_card_text)
							$(div_card_footer).append(div_f_left,btn_group)
							$(div_card_mb4_box).append(div_card_header,detail_a,div_card_body,div_card_footer)
							
							$(div_col_md_4).append(div_card_mb4_box)
							
							if(user_SessionID!=guestID){ // 버튼별 권한 로그인한 사람이 아닐때
								$(btn_delete).hide() 
								$(btn_edit).hide() 
							}
							//else{$(btn_like).hide() } // 로그인한 사람일때
							
							
							
							
							$(btn_delete).click(function() { //게시글 삭제
								var no=$(this).attr("no");
								$.ajax({url:"../deletePost",
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
							
							
						$(btn_edit).click(function() { //게시글 수정 new
						 	var no=$(this).attr("no");
							
							$.ajax({url:"../detailPost?post_no="+no,success:function(data){
								detail=eval("("+data+")")
								$('#post_content').html(detail.post_content);
								$('#oldFname').val(detail.post_fname);
								$('#updatate_Post_no').val(detail.post_no)
							}})
						})
							
			
							
						/* 	$("#commentSumbit").click(function() { //댓글 달기 ajax
										insertComment();
									})	 */
							
							$(detail_a).click(function() { //게시글 상세
								var no=$(this).attr("no");
								$("#col_comment_content").empty();
								
								
								$.ajax({url:"../detailPost?post_no="+no,success:function(data){ 
									
									detail=eval("("+data+")")
									//alert(data)
									$('#post_no').val(detail.post_no);
									$('#detail_Img').attr("src", "../resources/image/"+detail.post_fname);
									$('#h3_detail_userID').html(detail.user_ID);
									$('#small_detail_content').html(detail.post_hash);
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
									
								}})
								$('#detail_Dialog').modal('show')
							})
						$("#row1").append(div_col_md_4)
					});
				}}); //게시물 생성 ajax
				
		}})//ajax islikeEnd
				
		
		
		
			
		$.ajax({ // 팔로잉 목록 받아옴
			url:"../following.do",
			type:"post",
			data:{"follower_ID":guestID},
			success:function(data)
			{
				
				var f_List = eval("("+data+")")
				$.each(f_List, function(i, f) {
					list_Following[i]=f.user_ID;
					var tr = $("<tr></tr>")
					var td_ID = $("<td class='col-sm-8'></td>").html(f.user_ID)
					var td_btn=$("<td class='col-sm-4'></td>")
					var btn_f=$("<button class='btn btn-outline-primary'></button>").html("팔로잉")
					var state=0;
					
					$.each(list_Following, function(i, v) {
						//alert(v)
						console.log(v)
						if(v==f.user_ID)
						{
							$("#a_Follow").attr({src:"../resources/icon/followers.png"})
							state=1;
						}
					})
					console.log(state)
					
					$(btn_f).click(function() {
						if(state==0)
						{
							$.ajax({url:"../unFollow.do",
								type:"post",
								data:{"user_ID":f.user_ID,"follower_ID":"${user_ID}"},
								success:function(data){
									$(btn_f).removeClass("btn-outline-primary").addClass("btn-primary").html("팔로우");
									$("#a_Follow").attr({src:"../resources/icon/follow24b.png"})
								}})
							state=1
							return;
						}
						else if(state==1)
						{
							$.ajax({url:"../follow.do",
								type:"post",
								data:{"user_ID":f.user_ID,"follower_ID":"${user_ID}"},
								success:function(data){
									//alert(data)
									$(btn_f).removeClass("btn-primary").addClass("btn-outline-primary").html("팔로잉");
									$("#a_Follow").attr({src:"../resources/icon/followers.png"})
								}})
							state=0
							return;
							
						}
						
					})
					$("#b_follow").click(function() {
						if(state==0)
						{
							$.ajax({url:"../unFollow.do",
								type:"post",
								data:{"user_ID":f.user_ID,"follower_ID":"${user_ID}"},
								success:function(data){
									$(btn_f).removeClass("btn-outline-primary").addClass("btn-primary").html("팔로우");
									$("#a_Follow").attr({src:"../resources/icon/follow24b.png"})
								}})
							state=1
							return;
						}
						else if(state==1)
						{
							$.ajax({url:"../follow.do",
								type:"post",
								data:{"user_ID":f.user_ID,"follower_ID":"${user_ID}"},
								success:function(data){
									//alert(data)
									$(btn_f).removeClass("btn-primary").addClass("btn-outline-primary").html("팔로잉");
									$("#a_Follow").attr({src:"../resources/icon/followers.png"})
								}})
							state=0
							return;
							
						}
						
					})
					
					$(td_btn).append(btn_f)
					$(tr).append(td_ID,td_btn)
					$("#followingTbody").append(tr)
				})
			}
		})
		
		

		
		
		
		$.ajax({ // 팔로워 목록 받아옴
			url:"../follower.do",
			type:"post",
			data:{"user_ID":guestID},
			success:function(data)
			{
				var f_List = eval("("+data+")")
				$.each(f_List, function(i, f) {
					//alert(f)
					list_Follower[i]=f.follower_ID;
					
					var state=1;
					var tr = $("<tr></tr>")
					var td_ID = $("<td class='col-sm-8'></td>").html(f.follower_ID)
					var td_btn=$("<td class='col-sm-4'></td>")
					var btn_f=$("<button class='btn btn-primary'></button>").html("팔로우")
					
					$.each(list_Follower, function(i, v) {
						
						
						if(v==f.follower_ID)
						{
							
							$(btn_f).removeClass("btn-primary").addClass("btn-outline-primary").html("팔로잉");
							state=0;
						}
						
					})
					//console.log(state)
					$(btn_f).click(function() {
						if(state==0)
						{
							$.ajax({url:"../unFollow.do",
								type:"post",
								data:{"user_ID":f.user_ID,"follower_ID":"${user_ID}"},
								success:function(data){
									$(btn_f).removeClass("btn-outline-primary").addClass("btn-primary").html("팔로우");
									
								}})
							state=1
							return;
						}
						else if(state==1)
						{
							$.ajax({url:"../follow.do",
								type:"post",
								data:{"user_ID":f.user_ID,"follower_ID":"${user_ID}"},
								success:function(data){
									//alert(data)
									$(btn_f).removeClass("btn-primary").addClass("btn-outline-primary").html("팔로잉");
								}})
							state=0
							return;
							
						}
						
					})
					$(td_btn).append(btn_f)
					$(tr).append(td_ID,td_btn)
					$("#followerTbody").append(tr)
				})
			}
		})
	
		
		
		function cntLike(postNo,commentNo)
		{ //좋아요 카운트 함수
			var result;
			$.ajax({
				url:"../cntLike.do",
				async: false,
				data:{"post_no":postNo,"comment_no":commentNo},
				success:function(data){
					result=data;
			}})
			
			return result;
		}
		
		function cntCommnet(postNo)
		{ //좋아요 카운트 함수
			var result;
			$.ajax({
				url:"../cntComment.do",
				async: false,
				data:{"post_no":postNo},
				success:function(data){
					result=data;
			}})
			return result;
		}
		
	});

</script>

</head>
<body>


    <!-- Navigation -->
    <a class="menu-toggle rounded" href="#">
      <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <li class="sidebar-brand">
          <a class="js-scroll-trigger" href="#page-top">Menu</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="../data/bigData">빅데이터</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="../logout">Logout</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#contact">Contact</a>
        </li>
      </ul>
    </nav>
<!--  네비게이션  -->
	<nav class="nav navbar navbar-expand-sm navbar-light bg-light">

 	 
		<div class="navbar-header navbar-center mx-auto">
			<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="../timeLine">Edem</a>
		</div>
 		<!-- <a href="settings"><i class="fa fa-cogs"></i></a>  -->

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-lg-0 mx-auto" id="F">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
			        <div class="input-group-append">
			          <button  class="btn btn-outline-success border-left-0" style="border-color: #ced4da;" type="submit" >
							<img class="img" src="../resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			 </div>   
	</nav>

	
	
<!--   Header 사용자 프로필 -->
    <div class="py-5 bg-image-full text-white text-center" style="background-image: url('../resources/image/rain.gif');" id="profileHeader">
      <img class="img-fluid d-block mx-auto rounded-circle" src="../resources/image/${profile.user_fname }" id="profileImg">
      <div class="btn-group" role="group">
      	<button type="button" class="btn btn-sm btn-outline-secondary border-0 text-white" data-toggle="modal" data-target="#followerList_Modal" id="a_Follower_List">팔로워</button>
      	<button type="button" class="btn btn-sm btn-outline-secondary border-0 text-white" data-toggle="modal" data-target="#followingList_Modal" id="a_Following_List">팔로잉</button>
      	<button type="button" class="btn btn-sm btn-outline-secondary border-0 text-white" id="b_follow" ><img  id="a_Follow" src="../resources/icon/follow24w.png"></button>
      	<!-- <button type="button" class="btn btn-sm btn-outline-secondary border-0" data-toggle="modal" data-target="#insertPost" id="write" ><img  src="../resources/icon/quill-drawing-a-line24w.png"></button> -->
      </div>
      <p>${profile.user_Email }</p>
      <h2 id="guestID">${profile.user_ID }</h2>
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
	<div class="modal fade" id="updatePost" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
	        	<input type="hidden" class="form-contorl-file" id="oldFname" name="oldFname">
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
	
	<div class="modal fade" id="detail_Dialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="h3_detail_userID"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
       		<img  id="detail_Img" class="img-fluid d-inline-block h-100 w-100">
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--following  -->
	<div class="modal fade" id="followingList_Modal" tabindex="-1" role="dialog"  aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">팔로잉</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <table class="table table-hover">
				  
				  <tbody id="followingTbody">
				  </tbody>
			</table>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--follower  -->
	<div class="modal fade" id="followerList_Modal" tabindex="-1" role="dialog"  aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">팔로워</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
		      <table class="table table-hover">
				  
				  <tbody id="followerTbody">
				  </tbody>
			</table>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 썸네일 게시판  -->
	<div class="container">
		<div class="row" id="row1">
	     </div>
     </div>
     
	<div class="icon-bar ">
	  <a href="../timeLine"><i class="fa fa-home"></i></a> 
	  <a href="../timeLineSearch"><i class="fa fa-search"></i></a> 
	  <a href="#" data-toggle="modal" data-target="#insertPost" id="write"><i class="fas fa-pencil-alt"></i></a>
	  <a href="userProfile?user_ID=${user_ID }"><i class="fas fa-user-astronaut"></i></a> 
	  <a href="editProfile"><i class="fa fa-cog"></i></a>
	</div>
	
	<!-- Bootstrap core JavaScript -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for this template -->
    <script src="../resources/js/stylish-portfolio.min.js"></script>
     
   
	
</body>
</html>