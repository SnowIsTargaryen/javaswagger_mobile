<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">
	$(function() {
		var arr;
		<% String id=(String)session.getAttribute("user_ID"); %>
		
		$.ajax({url:"../board/listPost?user_ID=<%=id%>",success:function(data){
			var list = eval("("+data+")") //게시물 리스트
			
			$.each(list, function(idx, p) {
				
				var div_col_md_4 = $("<div></div>").addClass("col-md-4");
				var div_card_mb4_box = $("<div></div>").addClass("card mb-4 box-shadow");
				var div_card_body = $("<div></div>").addClass("card-body");
				var p_card_text =$("<p></p>").addClass("card-text").html(p.post_content);
				var d_flex = $("<div></div>").addClass("d-flex justify-content-between align-items-center")
				var btn_group = $("<div></div>").addClass("btn-group")
				var btn_view  = $("<button type='button'></button>").addClass("btn btn-sm btn-outline-secondary").html("View")
				var btn_edit =  $("<button type='button'></button>").addClass("btn btn-sm btn-outline-secondary").html("Edit")
				var small = $("<small></small>").addClass("text-muted").html(p.post_time)
				
				var img = $("<img/>").addClass("card-img-top").attr({
					src :"../resources/image/"+p.post_fname,
					alt : "Card image cap"
				})
				
				$(btn_group).append(btn_view,btn_edit)
				$(d_flex).append(btn_group,small)
				$(div_card_body).append(p_card_text,d_flex)
				$(div_card_mb4_box).append(img,div_card_body)
				
				$(div_col_md_4).append(div_card_mb4_box)
				
				$("#row1").append(div_col_md_4)
				
				
			
				
			});
			
		}});
		
	});
	

</script>


</head>
<body>
<!--  네비게이션  -->
	<nav class="navbar">
	<div class="container-fluid">
			<div class="col-4">
				<div class="navbar-header navbar-left">
					<h1><a class="navbar-brand" href="../profile/userProfile">Eden</a></h1>
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
	            
			    <button type="button" class="btn btn-default">${profile.user_ID }</button>
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
				<div class="col-sm-9">
					<h2>${profile.user_ID }</h2>
					<p>${profile.user_Email }</p>
					<p>${profile.user_Phone }</p>
					<a data-toggle="modal" data-target="#insertPost" ><img src="../resources/icon/contract.png"></a>
				</div>
			</div>
		</div> 
	</div>
	
	<!-- 글쓰기 Modal -->
	<div class="modal fade" id="insertPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document" >
	    <div class="modal-content">
	    <form class="form"  action="/insertPost.do" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
	        <h5 class="modal-title">새 글 쓰기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
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
	
	
	<!-- 썸네일 게시판  -->
	<div class="container">
		<div class="row" id="row1">
	            <div class="col-md-4">
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
	            </div>
	            
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/new york.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">뉴욕</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/Neuschwanstein.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">노이슈반슈타인 성</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" src="../resources/image/phi phi islands.jpg" alt="Card image cap">
	                <div class="card-body">
	                  <p class="card-text">피피 섬</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
	                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
	                    </div>
	                    <small class="text-muted">9 mins</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	     </div>
     </div>
	
	
</body>
</html>