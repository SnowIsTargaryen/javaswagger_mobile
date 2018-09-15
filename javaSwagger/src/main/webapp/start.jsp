<%@page import="org.springframework.web.filter.CharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono" rel="stylesheet">
<link rel="stylesheet" href="resources/css/createPage.css" />
</head>
    <body>
        <div class="form-box">
            <section class="left-box">
                <p>EveryDay</p>
                <p>EveryMoment</p>
                <h5>Welcome</h5>
            </section>
            <section class="right-box">
                <span>Sign up</span>
                <form>
                    <!--name input-->
                    <input type="text" placeholder="Name"/>
                    <!--email input-->
                    <input type="email" placeholder="Email"/>
                    <!--password input-->
                    <input type="password" placeholder="Password"/>
                  <button><a href="#">Sign up</a></button>
                </form>
            </section>
        </div>
    </body>
	
	
	
	
	
	
	<!-- listPost.do?user_id=1 -->
	<!-- <a href="listPost.do?user_id=tiger">유저의 프로필 화면에서 나타나는 포스트모음</a><br> -->
	<!-- <a href="detailPost.do?post_no=1">타임라인에서 하나를 선택했을 때 나오는 포스트</a><br>
	<a href="timeLine">타임라인</a><br>
	<a href="board/insertPost.do">insert post</a><br>
	<a href="updatePost.do?post_no=1">update post</a><br>
	<a href="chkFollower.do">팔로우?</a> -->
	<!-- 포스트 업데이트 /삭제쪽은 아직 파일형식이 아닌 텍스트 형식입니다. -->

</html>