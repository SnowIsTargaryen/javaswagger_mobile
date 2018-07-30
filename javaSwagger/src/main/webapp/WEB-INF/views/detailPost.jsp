<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var post_no = $("#ppn").val();
		$.ajax({
			url:"listComment.do?post_no="+post_no,
			success:function(data){
				alert(data)
				var arr = eval("("+data+")")
				alert(arr)
				$.each(arr, function(i,p){
					var tr = $("<tr></tr>");
					var td1 = $("<td></td>").append(p.user_ID);
					var td2 = $("<td></td>").append(p.comment_content);
					var td3 = $("<td></td>").append(p.comment_time);
					$(tr).append(td1, td2, td3);
					$("#tbComment").append(tr);

				})
			}})
	})
</script>
<title>Insert title here</title>
</head>
<body>

	<input type="hidden" value="${pv.post_no }" id="ppn">
	<table>
		<tr><td><a href="listPost.do?user_ID=${pv.user_ID }">${pv.user_ID }</a></td></tr>
		<tr><td>작성일 : ${pv.post_time }</td><td>삭제예정 : ${pv.post_delTime }</td></tr>
		
	</table>
	<textarea rows="5" cols="20" readonly="readonly">${pv.post_content }</textarea>
	<table>
		<tr><td>좋아요 : </td><td><button onclick="">좋아요</button></td></tr>
		<!-- 이 부분은 좋아요 부분이랑 연계해서 두개 sql을 실행해야 할 것 같아요.
			  액션도 좋아요 누르는 sql 실행되도록 하고 -->
	</table>
	<!-- 댓글창 -->
	<table id="tbComment" border="1">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
	</table>
		<form action="insertComment.do" method="post">
			댓글번호:<input type="text" name="comment_no"><br> <!-- 현재 로그인한 유저의 user_ID -->
			유저:<input type="text" name="user_ID" value=${pv.user_ID }><br> <!-- 현재 로그인한 유저의 user_ID --> 
			포스트번호:<input type="text" name="post_no" value="${pv.post_no }"><br> <!-- 현재 보고 있는 게시글의 post_no -->
			내용:<input type="text" name="comment_content"><br><!-- 텍스트 에이리어로 하는게 나을까요? -->
			<input type="submit" value="입력">
	
		</form>

	<!-- 해당 게시글의 주인이라면 수정/삭제 버튼 -->
</body>
</html>