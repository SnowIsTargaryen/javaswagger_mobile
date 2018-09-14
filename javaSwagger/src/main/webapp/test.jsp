<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!--부트 스트랩 CDN  -->
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btns").click(function(){
			var keyword = $("#keyword").val();
			if(keyword.indexOf("#") != -1){
				alert("hash")
			} else {
				alert("id")
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 
		<form id="F">
		 -->
			<div>
				<input type="text" placeholder="Search" id="keyword">
				<div>
					<button id="btns">hoho</button>
				</div>
			</div>
		<!-- 
		</form>
		 -->
	</div>
</body>
</html>


<!-- 


 -->