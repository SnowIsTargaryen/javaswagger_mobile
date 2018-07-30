<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		fID = $("#follower_ID").val()
		$.ajax({
			url:"following.do?follower_ID="+fID,
			success:function(data){
				arr = eval("("+data+")")
				$.each(arr, function(i,f){
					var tr = $("<tr></tr>")
					var a = $("<a></a>").attr("href","listPost.do?user_ID="+f.user_ID).html(f.user_ID)
					$(tr).append($("<td></td>").append(a))
					$("#tbFollowing").append(tr)
				})
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="follower_ID" value="${follower_ID }">
	<table id="tbFollowing" width="30%">
		<tr><td>${follower_ID }님의 팔로잉 목록</td></tr>
	</table>
</body>
</html>