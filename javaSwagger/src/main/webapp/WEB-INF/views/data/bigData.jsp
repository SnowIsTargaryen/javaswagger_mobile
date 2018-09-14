<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<!--부트 스트랩 CDN  -->
<script type="text/javascript">

 $(function() {
	
	 var keyword=[];
	 var keywordCnt=[];
	
	 
	$.each(${rank}, function(i, data)
 	{
	
		if(i%2==0) //검색어만 
		{
			keyword[i]=data;
			console.log(keyword[i])
		}
		else //일간 검색기록수
		{
			keywordCnt[i]=data;
			console.log(keywordCnt[i])
			//alert(data)	
		}
		
	})
	 
	 var options = {
				title: {
					text: "오늘의 실시간 검색어"
				},
				subtitles: [{
					text: "가장 많이 검색된 단어"
				}],
				animationEnabled: true,
				data: [{
					type: "pie",
					startAngle: 40,
					toolTipContent: "<b>{label}</b>: {y}",
					showInLegend: "true",
					legendText: "{label}",
					indexLabelFontSize: 16,
					indexLabel: "{label}",
					dataPoints: [
						{ y: keywordCnt[1], label: keyword[0] },
						{ y: keywordCnt[3], label: keyword[2] },
						{ y: keywordCnt[5], label: keyword[4] },
						{ y: keywordCnt[7], label: keyword[6] },
						{ y: keywordCnt[9], label: keyword[8] },
						{ y: keywordCnt[11], label: keyword[10] },
						{ y: keywordCnt[13], label: keyword[12] },
						{ y: keywordCnt[15], label: keyword[14] },
						{ y: keywordCnt[17], label: keyword[16] },
						{ y: keywordCnt[19], label: keyword[18] },
						
					]
				}]
			};
			$("#chartContainer").CanvasJSChart(options);
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
				<a class="navbar-brand mb-0 h1 mx-3 my-2 " href="../timeLine">Eden</a>
			</div>
	
		  
			<div class="navbar-nav mx-4 my-2 d-block d-sm-none">
			    <div class="btn-group">  
					<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="../profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false"></button>
					<div class="dropdown-menu">
					  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
					  <a class="dropdown-item" href="../logout">로그아웃</a>
					</div>
				</div>
			</div>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<form class="form-inline my-lg-0 mx-auto" id="F">
			      <div class="input-group">
			        <input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
			        <div class="input-group-append">
			          <button class="btn btn-outline-success" type="submit" >
							<img src="../resources/icon/search2.png" width="18" height="18">
					  </button>
			        </div>
			      </div>
			    </form>
			 </div>   
				 
				
			 <div class="navbar-nav mx-4 my-2 d-none d-sm-block">
			     <div class="btn-group">  
					<button type="button" class="btn btn-outline-primary" id="btnUserProfile"><a href="../profile/userProfile?user_ID=${user_ID }">${user_ID }</a></button>
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					</button>
					<div class="dropdown-menu">
					  <a class="dropdown-item" href="../profile/editProfile">프로필 설정</a>
					  <a class="dropdown-item" href="../data/bigData">빅데이터</a>
					  <a class="dropdown-item" href="../logout">로그아웃</a>
					</div>
				</div>
			 </div> 
	</nav>

	<div class="container">
		<div class="row justify-content-md-center"">
			<div class="col-md-auto">
				<img src="../resources/chat/${fname }">
			</div>
			<div class="col-md-auto">
				<div id="chartContainer" style="height: 400px; width: 500px; margin-top: 50px;"></div>
			</div>
			<div class="col-md-auto">
				<div class="row placeholders mb-3">
	                <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/dddddd/fff?text=1" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Responsive</h4> 
	                </div>
	                <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/e4e4e4/fff?text=2" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Frontend</h4>
	                </div>
	                <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/d6d6d6/fff?text=3" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>HTML5</h4>
	                </div>
	                <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/e0e0e0/fff?text=4" class="center-block img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Framework</h4>
	                </div>
	                <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/e0e0e0/fff?text=5" class="center-block img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Framework</h4>
	                </div>
	                <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/e0e0e0/fff?text=6" class="center-block img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Framework</h4>
	                </div>
            	</div>
			</div>
			<div class="col-md-auto">
				<div class="row placeholders mb-3">
	                <div class="col-6 col-sm-3 placeholder text-center">
	                    <img src="//placehold.it/200/dddddd/fff?text=7" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Responsive</h4> 
	                </div>
	                <div class="col-6 col-sm-3 placeholder text-center">
	                    <img src="//placehold.it/200/e4e4e4/fff?text=8" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Frontend</h4>
	                </div>
	                <div class="col-6 col-sm-3 placeholder text-center">
	                    <img src="//placehold.it/200/d6d6d6/fff?text=9" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>HTML5</h4>
	                </div>
	                <div class="col-6 col-sm-3 placeholder text-center">
	                    <img src="//placehold.it/200/e0e0e0/fff?text=10" class="center-block img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Framework</h4>
	                </div>
	                <!-- <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/e0e0e0/fff?text=5" class="center-block img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Framework</h4>
	                </div>
	              	<div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/e0e0e0/fff?text=6" class="center-block img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Framework</h4>
	                </div> -->
            	</div>
			</div>
		</div>
	</div>
	
	

	
</body>
</html>