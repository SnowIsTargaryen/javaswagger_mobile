<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 프로필단 아래 개인 포스트 정렬. 줄당 다섯개씩 나오게했어요 갯수 바꾸려면 c:if문에서 5만 원하는 갯수로 바꾸면 될듯..?-->
	<table>
		<c:forEach var="p" items="${list }" varStatus="i">
			<c:if test="${i.first and i.count%5 == 0 }">
				<tr>
			</c:if>
				<td><a href="detailPost.do?post_no=${p.post_no }">${p.post_Fname }</a></td>
			<c:if test="${not i.first and i.count%5 == 0 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>