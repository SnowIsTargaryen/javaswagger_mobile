<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div data-role="page">
		<div data-role="header">
			<h1>Transition</h1>
		</div>
		<div data-role="content">
			<a href="#secondPage" data-role="button" data-transition="slide">Silde</a>
			<a href="#secondPage" data-role="button" data-transition="slideup">Silde Up</a>
			<a href="#secondPage" data-role="button" data-transition="slidedown">Silde Down</a>
			<a href="#secondPage" data-role="button" data-transition="pop">Pop</a>
			<a href="#secondPage" data-role="button" data-transition="fade">Fade</a>
			<a href="#secondPage" data-role="button" data-transition="filp">Filp</a>
			<a href="#secondPage" data-role="button" data-transition="slide" data-direction="reverse">slide reverse</a>
		
		</div>
	</div>
	
	<div id="secondPage" data-role="page" data-add-back-btn="true">
		<div data-role="header">
			<h1>Transition</h1>
		</div>
		<div data-role="content">
			<h1>Scond Page</h1>
		</div>
	</div>

</body>
</html>