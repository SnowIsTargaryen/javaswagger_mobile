<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 검색어 분석</title>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/footerBar.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>

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
	
	 var keyword=[];
	 var keywordCnt=[];
	 var j=1;	
	 
	$.each(${rank}, function(i, data)
 	{
		
		
		if(i%2==0) //검색어만 
		{	
			
			keyword[i]=data;

		}
		else //일간 검색기록수
		{
			keywordCnt[i]=data;

		}
		
		
		//
		

	})
	
	$.each(keyword, function(i, elt) {
		if(i%2==0 && i<9)
		{

 			var div = $("<div></div>").addClass("col-6 col-sm-2 placeholder text-center")
			var img = $("<img alt='Generic placeholder thumbnail'>").attr({src:"//placehold.it/200/dddddd/fff?text="+j}).addClass("mx-auto img-fluid rounded-circle")
			var hashs = $("<a></a>").html(elt).attr("href","../hashtag?keyword=" + elt)
			var h4 = $("<h4></h4>").html(hashs)
			$(div).append(img,h4)
			j++; 
		}
		$("#keywordList").append(div);
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

	<div class="container">
		<div class="row justify-content-md-center"">
			<div class="col-md-auto">
				<img src="../resources/chat/${fname }">
			</div>
			<div class="col-md-auto">
				<div id="chartContainer" style="height: 400px; width: 500px; margin-top: 50px;"></div>
			</div>
			<div class="col-md-auto" id="hashtagKeyWord" >
				<div class="row placeholders mb-3 d-flex justify-content-center" id="keywordList">
	                <!-- <div class="col-6 col-sm-2 placeholder text-center">
	                    <img src="//placehold.it/200/dddddd/fff?text=1" class="mx-auto img-fluid rounded-circle" alt="Generic placeholder thumbnail">
	                    <h4>Responsive</h4> 
	                </div>-->
            	</div>
			</div>
		
		</div>
	</div>
	
		<!-- Bootstrap core JavaScript -->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for this template -->
    <script src="../resources/js/stylish-portfolio.min.js"></script>
	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
	
</body>
</html>