<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="insertPost.do" method="post" enctype="multipart/form-data">
		<input type="text" name="post_no"><!-- 시퀀스 혹은 메서드 처리 -->
		<input type="text" name="user_id" value="${user_id }"> <!-- 글쓰기 버튼 누르면 로그인 한 유저의 아이디 가져오기 -->
		<table>
			<tr><td>글 내용</td><td><input type="text" name="post_content"></td></tr>
			<tr><td>첨부 </td><td><input type="file" name="uploadFile"></td></tr>
		</table>
		<input type="submit" value="등록">
	</form>
</body>
</html>