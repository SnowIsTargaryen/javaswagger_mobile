<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	uID = $("#user_ID").val()
	$.ajax({
		url:"follower.do?user_ID="+uID,
		success:function(data){
			arr = eval("("+data+")")
			$.each(arr, function(i,f){
				var tr = $("<tr></tr>")
				var a = $("<a></a>").attr("href","listPost.do?user_ID="+f.follower_ID).html(f.follower_ID)
				$(tr).append($("<td></td>").append(a))
				$("#tbFollower").append(tr)
			})
		}
	})
})
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="user_ID" value="${user_ID }">
	<table id="tbFollower" width="30%">
		<tr><td>${user_ID }님의 팔로워 목록</td></tr>
	</table>
</body>
</html>