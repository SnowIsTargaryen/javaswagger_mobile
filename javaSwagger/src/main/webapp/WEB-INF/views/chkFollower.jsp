<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var fId = $("#follower_ID").val();
		var uId = $("#user_ID").val();
		$.ajax({
			url:"isFollower.do?follower_ID="+fId+"&&user_ID="+uId,
			success:function(data){
				var arr = eval("("+data+")");
				if(arr == 0){
					$("#F").attr("action","follow.do")
					$("#sm").attr("value","follow")
				}else{
					$("#sm").attr("value","un follow")
					$("#F").attr("action","unFollow.do")
				}
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<form method="post" id="F">
		<input type="text" id="user_ID" name="user_ID" value="1"> <!-- 요부분은 고객이 보고있는 listPost.do?user_id=?? 부분의 ?? -->
		<input type="text" id="follower_ID" name="follower_ID" value="2"><!-- 현재 로그인하고 있는 유저의 ID -->
		<input type="submit" id="sm">
	</form>
</body>
</html>