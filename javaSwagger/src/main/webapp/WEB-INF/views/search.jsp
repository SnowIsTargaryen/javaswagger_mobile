<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">
	$(function() {
		
		<%String user_ID=request.getParameter("user_ID");%>
		var user_ID="${user_ID}"
		//alert(getp)
		$.ajax({ //검색 
				url:"searchList?user_ID=<%=user_ID%>",
				success:function(data){
					list=eval("("+data+")")
					$.each(list, function(idx, s) {
						
						var tr = $("<tr></tr>")
						var th = $("<th></th>").html(idx)
						var a_userID = $("<a></a>").attr({
							href:"profile/userProfile?user_ID="+s.user_ID
						}).html(s.user_ID)
						var td_userID = $("<td></td>")
						var td_email = $("<td></td>").html(s.user_Email)
						var td_btn=$("<td></td>")
						var btn_follow = $("<button></button>").addClass("btn")
						//var fId = $("#follower_ID").val();
						//var uId = $("#user_ID").val();
						
						
						$.ajax({ // 팔로우 중복 검사
							url:"isFollower.do",
							type:"post",
							data:{"user_ID":s.user_ID,"follower_ID":user_ID},
							success:function(data){
								
								var arr = eval("("+data+")");
								if(arr == 0){//팔로우 기록이 없을떄
									$(btn_follow).html("follow").addClass("btn-outline-primary")
									$(btn_follow).click(function() {
										$.ajax({url:"follow.do",
											type:"post",
											data:{"user_ID":s.user_ID,"follower_ID":user_ID},
											success:function(data){
												//alert(data)
												$(btn_follow).removeClass("btn-outline-primary").addClass("btn-primary").html("following");
												if(data>=1)
												{
													//event.stopImmediatePropagation();//이벤트가 상위로 전파되지 않도록 중단?
												}
											}})
									})
								}//if end
								else{//팔로우 기록이 있을때
									$(btn_follow).addClass("btn-primary").html("following")
									$(btn_follow).click(function() {
										$.ajax({url:"unFollow.do",
											type:"post",
											data:{"user_ID":s.user_ID,"follower_ID":user_ID},
											success:function(data){
												$(btn_follow).removeClass("btn-primary").addClass("btn-outline-primary").html("follow");
													
											}})
									})
								}//else end
							}//isFollwer success end
						})//isFollower end
						
						$(td_userID).append(a_userID)
						$(td_btn).append(btn_follow)
						if(s.user_ID!=user_ID)
						{
							$(tr).append(th,td_userID,td_email,td_btn)
						}
						/* $(btn_follow).click(function() {
							$.ajax({url:"follow.do",
								type:"post",
								data:{"user_ID":s.user_ID,"follower_ID":user_ID},
								success:function(data){
									$(btn_follow).removeClass("btn-outline-primary").addClass("btn-primary").html("following");
										
								}})
						}) */
						
						$("#listTbody").append(tr)
						
					})
				}})
	
		})
			
</script>
</head>
<body>
<!--  네비게이션  -->
	<nav class="navbar">
	<div class="container">
			<div class="col-4">
				<div class="navbar-header navbar-left">
					<h1><a class="navbar-brand" href="timeLine">Eden</a></h1>
				</div>
			</div>
			<div class="col-4">
				<form class="navbar-form navbar-center" action="search">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="user_ID">
			        <div class="input-group-append">
			          <button class="btn btn-outline-secondary" type="submit" >
							<img src="resources/icon/search2.png" width="18" height="18">
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
			      <a class="dropdown-item" href="profile/editProfile">프로필 설정</a>
			      <a class="dropdown-item" href="logout">로그아웃</a>
			    </div>
			  </div>
	        </div>
		</div> <!-- 컨테이너  -->
	</nav>
	<!--테이블 검색 유저 목록  -->
	<div class="container">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">ID</th>
		      <th scope="col">이메일</th>
		      <th scope="col">#</th>
		    </tr>
		  </thead>
		  <tbody id="listTbody">
		  </tbody>
		</table>
	</div>
	

	
	

</body>
</html>