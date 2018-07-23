<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	img{
		width:150px;
		height:150px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="l" items="${list }" varStatus="i">
			<c:if test="${i.first and i.count%5 == 0 }"> <!-- 한줄 당 다섯개씩 보기. 숫자 조정하면 그만큼 볼 수 있음 -->
				<tr>
			</c:if>
				<td><a href="detailPost.do?post_no=${l.post_no }"><img src="resources/img/${l.post_Fname }"></a></td>
			<c:if test="${not i.first and i.count%5 == 0 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>