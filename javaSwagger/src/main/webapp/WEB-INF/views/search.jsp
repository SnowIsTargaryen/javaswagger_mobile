<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
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
	 
</style>
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
		
		<%String user_ID = request.getParameter("user_ID");%>//url 아이디
		<%String keyword = request.getParameter("keyword");%>//url keyword
	//	var user_SessionID="${user_ID}"//세션 아이디
		
		$(".btn-outline-secondary").click(function(){
			var keyword = $("#keyword").val();
			if(keyword.indexOf("#") >= 0){
				var key = keyword.substr(1, keyword.length);
				$("#keyword").val(key);
				$("#F").attr("action","hashtag");
			} else {
				$("#F").attr("action","search");
			}
		})	
	
	
		$("#btnUserProfile").click(function() {
				location.href="profile/userProfile?user_ID=${user_ID}"
		})
		
		var user_List=[];
		
			$.ajax({//팔로우 버튼 확인용
				url:"following.do",
				data:{"follower_ID":"${user_ID}"},
				success:function(data)
				{
					list=eval("("+data+")")
					$.each(list, function(idx, f) {
						user_List[idx]=f.user_ID
						//console.log(user_List[idx])
					})
					
					$.ajax({ //검색 
					url:"searchList?user_ID=<%=keyword%>",
					success:function(data){
						list=eval("("+data+")")
						$.each(list, function(idx, s) {
							var state=0;
											
							var div_follow=$("<div class='media text-muted pt-3'></div>")
							var img_follow=$("<img data-src='"+s.user_fname+"' alt='32x32' class='mr-2 rounded' src='resources/image/"+s.user_fname+"' data-holder-rendered='true' style='width: 32px; height: 32px;'/>")
							var div_body=$("<div class='media-body pb-3 mb-0 small lh-125 border-bottom border-gray'></div>")
							var div_dfle=$("<div class='d-flex justify-content-between align-items-center w-100'></div>")
							var a_follow=$('<a href="#">Follow</a>')
							var strong_follow=$("<strong class='d-block text-gray-dark'></strong>").html(s.user_ID)
							var a_userPage=$("<a></a>").attr({
								href:"profile/userProfile?user_ID="+s.user_ID
							})
							var span_follow=$("<span class='d-block'></span>").html(s.user_Email);
							
							
							if(s.user_fname==null){$(img_follow).attr({src:"resources/icon/user2.png"})}
							
				
							
							$.each(user_List, function(i, b) {
								if(b==s.user_ID)
								{
									//console.log(b+"/"+s.user_ID)
									$(a_follow).html("following")
									state=1;
								
								}
								/* else
								{
									$(btn_follow).html("follow").addClass("btn-outline-primary")
									state=0;
								} */
							})
							
							$(a_follow).on("click",function() {
								if(state==0)
								{	
									$.ajax({url:"follow.do",
										type:"post",
										data:{"user_ID":s.user_ID,"follower_ID":"${user_ID}"},
										success:function(data){
											//alert(data)
											$(a_follow).html("following");
										}})
									state=1
									return;
								}//if end
								else if(state==1)
								{
									$.ajax({url:"unFollow.do",
										type:"post",
										data:{"user_ID":s.user_ID,"follower_ID":"${user_ID}"},
										success:function(data){
											$(a_follow).html("follow");
												
										}})
									state=0
									return;
								}
							})//팔로우 버튼
							$(a_userPage).append(strong_follow)		
							$(div_dfle).prepend(a_userPage,a_follow); //첫번째 순서로 붙힘 prepend
							$(div_body).append(div_dfle,span_follow)
							$(div_follow).append(img_follow,div_body);
							$('#userList').append(div_follow);
							
							
						})
					}})
					
				
				}
			})

		})
			
</script>
</head>
<body>
<header></header>
	<!--  네비게이션  -->
	<nav class="nav navbar navbar-expand-sm navbar-light bg-light mb-3 d-flex justify-content-center">
			<div class="nav justify-content-center w-100 mw-100">
				<form class="form-inline mx-auto w-100 mw-100" id="F">
					<div class="input-group mx-auto mw-100">
						<input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit">
								<img src="resources/icon/search2.png" width="18" height="18">
							</button>
						</div>
					</div>
				</form>
			</div>
	</nav>


	<!-- 유저 리스트 -->
	<div id="userList" class="my-3 p-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">사용자 목록</h6>
    </div>
    <!-- 하단바-->
    <div class="icon-bar ">
	  <a href="timeLine"><i class="fa fa-home"></i></a> 
	  <a href="timeLineSearch"><i class="fa fa-search"></i></a> 
	  <a href="#" data-toggle="modal" data-target="#insertPost" id="write"><i class="fas fa-pencil-alt"></i></a>
	  <a href="profile/userProfile?user_ID=${user_ID }"><i class="fas fa-user-astronaut"></i></a> 
	   <a href="profile/editProfile"><i class="fa fa-cog"></i></a> 
	</div>
	


</body>
</html>