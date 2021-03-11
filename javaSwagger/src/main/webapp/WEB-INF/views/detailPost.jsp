<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var post_no = $("#pn").val()
            var ui = $("#ui").val()
            var cntP;
            var cntC;
            // 댓글 목록 불러오기
            $.ajax("listComment.do?post_no=" + eval(post_no), {
                success: function (data) {
                    var arr = eval("(" + data + ")")
                    $.each(arr, function (i, c) {
                        var anC = $("<a></a>")
                        var td1 = $("<td></td>").append(c.user_id)
                        var td2 = $("<td></td>").append(c.comment_content)
                        var td3 = $("<td></td>").append(c.comment_time);
                        // 댓글 좋아요 확인 및 표시(1이면 좋아요, 0이면 좋아요 취소)
                        $.ajax("isLike.do?comment_NO=" + c.comment_no + "&&user_ID=" + ui, {
                            success: function (ldata) {
                                var isLike = eval("(" + ldata + ")")
                                if (isLike >= 1) {
                                    $(anC).attr("href", "cancelLike.do?comment_NO=" + c.comment_no + "&&user_ID=" + ui)
                                } else {
                                    $(anC).attr("href", "doLike.do?comment_NO=" + c.comment_no + "&&user_ID=" + ui)
                                }
                            }
                        })
                        var td4 = $("<td></td>");
                        // 댓글 좋아요 표시
                        $.getJSON("cntLike.do",
                            {"comment_NO": c.comment_no},
                            function (cdata) {
                                var cnt = eval("(" + cdata + ")");
                                cntC = cnt;
                                $(anC).append(cnt);
                                $(td4).append(anC);
                            }
                        )
                        var tr = $("<tr></tr>").append(td1, td2, td3, td4);
                        $("#tbComment").append(tr)
                    })
                }
            })

            //게시글 좋아요 표시 / 버튼 활성화
            $.ajax("cntLike.do?post_NO=" + post_no, {
                success: function (pdata) {
                    var cnt = eval("(" + pdata + ")");
                    cntP = cnt;
                    var anP = $("<a></a>");
                    $.ajax("isLike.do?post_NO=" + post_no + "&&user_ID=" + ui, {
                        success: function (ldata) {
                            var isLike = eval("(" + ldata + ")")
                            if (isLike >= 1) {
                                $(anP).attr("href", "cancelLike.do?post_NO=" + post_no + "&&user_ID=" + ui).append(cnt)
                                cntP -= 1;
                            } else {
                                $(anP).attr("href", "doLike.do?post_NO=" + post_no + "&&user_ID=" + ui).append(cnt)
                            }
                        }
                    })
                    $("#likePost").html(anP);
                }
            })

            //좋아요한 사람 목록 불러오기
            $.ajax("whoLike.do?post_NO=" + post_no, {
                success: function (wdata) {
                    var who = eval("(" + wdata + ")");
                    var str = '';
                    var capName = who[0].user_ID;
                    $.each(who, function (i, w) {
                        str += w.user_ID + "<br>";
                    })
                    var cap = capName + "외 " + (cntP - 1) + "명이 이 게시글을 좋아합니다.";
                    $("#whoLike").html(cap);
                    //$("#whoLike").click(function(){
                    //	alert(str)
                    //})
                }
            })
        })
    </script>
    <title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${pv.post_no }" id="pn">
<input type="hidden" value="${user_id }" id="ui"> <!-- 현재 로그인한 유저의 ID -->
<table>
    <tr colspan="2">
        <td><a href="listPost.do?user_id=${pv.user_id }">${pv.user_id }</a></td>
    </tr>
    <tr>
        <td>작성일 : ${pv.post_time }</td>
        <td>삭제예정 : ${pv.post_delTime }</td>
    </tr>
    <tr colspan="2">
        <td><img src="resources/img/${pv.post_fname }" width="300" height="300"></td>
    </tr>
</table>
<textarea rows="5" cols="20" readonly="readonly">${pv.post_content }</textarea>
<table>
    <tr>
        <td>
            <div id="likePost"></div>
        </td>
        <td>
            <div id="whoLike"></div>
        </td>
    </tr>
</table>
<!-- 해당 게시글의 주인이라면 수정/삭제 버튼 -->
<c:if test="${user_id == pv.user_id }">
    <a href="updatePost.do?post_no=${post_no }">수정</a>
    <a href="deletePost.do?post_no=${post_no }">삭제</a>
</c:if>
<!-- 댓글창 -->
<table id="tbComment" border="1">
    <tr>
        <th>작성자</th>
        <th>내용</th>
        <th>작성일</th>
        <th>좋아요</th>
    </tr>
</table>
<form action="insertComment.do" method="post">
    <input type="hidden" name="comment_no"><br>
    <input type="hidden" name="user_ID" value="${user_id }"><br> <!-- 현재 로그인한 유저의 user_id -->
    <input type="text" name="post_no" value="${pv.post_no }"><br> <!-- 현재 보고 있는 게시글의 post_no -->
    <table>
        <tr>
            <td><input type="text" name="comment_Content" value="comment_Cotent"></td> <!-- 텍스트 에이리어로 하는게 나을까요? -->
            <td><input type="submit"></td>
        </tr>
    </table>
</form>
</body>
</html>