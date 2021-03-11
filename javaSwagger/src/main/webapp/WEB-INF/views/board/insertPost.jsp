<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<form action="insertPost.do" method="post" enctype="multipart/form-data">
    <!-- <input type="text" name="post_no">시퀀스 혹은 메서드 처리 -->
    <input type="text" name="user_ID" value="${user_ID }"> <!-- 글쓰기 버튼 누르면 로그인 한 유저의 아이디 가져오기 -->
    <table>
        <tr>
            <td>글 내용</td>
            <td><input type="text" name="post_content"></td>
        </tr>
        <tr>
            <td>첨부</td>
            <td><input type="file" name="uploadFile"></td>
        </tr>
    </table>
    <input type="submit" value="등록">
</form>
</body>
</html>