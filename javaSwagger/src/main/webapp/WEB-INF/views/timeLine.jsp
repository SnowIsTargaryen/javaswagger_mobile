<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/footerBar.css"/>
    <title>TimeLine</title>
    <style type="text/css">
        body {
            /* padding-top: 40px; */
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 1px;
            /*  background: #f5b335;  */
            transition: top 0.2s ease-in-out;
        }

        .nav-up {
            top: -40px;
        }


        #pImg {
            height: 300px;
            width: 300px;
        }

        .item img {
            margin: 3px;
        }

        .card-img-top {
            height: 350px;
        }

        .item {
            margin: 0 auto;
            display: grid;
            grid-gap: 10px;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        }

        #content {
            height: 650px;
        }

        #modal-detail {
            max-width: 50% !important;

        }

        .modal.modal-center {

            text-align: center;
            text-align: left;
            top: 15%;
            right: 10%
            left: 15%;
        }

        .container-fluid {

            padding-left: 0 !important;
            padding-right: 0 !important;
        }

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
          integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
            integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <!--부트 스트랩 CDN  -->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
    <!--masonry  -->
    <script type="text/javascript">

        $(function () {
            // Hide Header on on scroll down
            var didScroll;
            var lastScrollTop = 0;
            var delta = 5;
            var navbarHeight = $('header').outerHeight();

            $(window).scroll(function (event) {
                didScroll = true;
            });

            setInterval(function () {
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                }
            }, 250);

            function hasScrolled() {
                var st = $(this).scrollTop();

                // Make sure they scroll more than delta
                if (Math.abs(lastScrollTop - st) <= delta) return;

                // If they scrolled down and are past the navbar, add class .nav-up.
                // This is necessary so you never see what is "behind" the navbar.
                if (st > lastScrollTop && st > navbarHeight) {

                    // Scroll Down
                    $('.icon-bar').fadeOut();
                } else {

                    // Scroll Up
                    if (st + $(window).height() < $(document).height()) {
                        $('.icon-bar').fadeIn();
                    }
                }

                lastScrollTop = st;

            }

            var user_SessionID = "${user_ID}"
            $("#btnUserProfile").click(function () {

                location.href = "profile/userProfile?user_ID=" + user_SessionID;
            })


            $(".btn-outline-success").click(function () {
                var keyword = $("#keyword").val();
                if (keyword.indexOf("#") >= 0) {
                    var key = keyword.substr(1, keyword.length);
                    $("#keyword").val(key);
                    $("#F").attr("action", "hashtag");
                } else {
                    $("#F").attr("action", "search");
                }
            })

            var l_post_no = [];
            var like_cmt_no = [];
            var like_post_no = [];

            $.ajax({
                url: "isLike.do",
                data: {"user_ID": "${user_ID}"},
                success: function (data) {

                    list = eval("(" + data + ")")
                    $.each(list, function (i, l) {

                        if (l.post_no != null) {
                            like_post_no[i] = l.post_no;
                            //console.log("postNo "+like_post_no)
                        }
                        if (l.comment_no != null) {
                            like_cmt_no[i] = l.comment_no;
                            //console.log("cmtNo "+like_cmt_no)
                        }
                    })// eachEnd

                    //게시글 리스트
                    $.ajax({
                        url: "timeLinePost",
                        data: {"user_ID": "${user_ID}"},
                        success: function (data) {

                            var list = eval("(" + data + ")") //게시물 리스트

                            $.each(list, function (idx, p) { //게시글 생성
                                var div_col_md_4 = $("<div id='cols'></div>").addClass("col-md-4");
                                var div_card_mb4_box = $("<div></div>").addClass("card mb-4 box-shadow");
                                var div_card_header = $("<div></div>").addClass("card-header").html(p.user_ID);
                                var div_card_body = $("<div></div>").addClass("card-body");
                                var div_card_footer = $("<div></div>").addClass("card-footer claerfix");

                                var post_content = p.post_content;
                                if (post_content == "undefined" || post_content == null) // 글내용이 없을댸
                                {
                                    post_content = "";
                                }
                                if (post_content.length >= 20) // 글 내용이 20자 이상일때
                                {
                                    post_content = p.post_content.substring(0, 20) + "...";
                                }

                                var p_card_text = $("<p></p>").addClass("card-text").html(post_content);
                                var btn_group = $("<div></div>").addClass("btn-group")

                                var div_f_left = $("<div></div>").addClass("float-left")
                                var s_comment = $("<small></small>")
                                var a_comment = $("<a data-role='button' data-transition='slide'></a>").addClass("d-block").attr({
                                    href: 'board/listComment?post_no=' + p.post_no,
                                })
                                var p_like_cnt = $("<p></p>").addClass("d-inline").html("likecnt")

                                var btn_group = $("<div></div>").addClass("btn-group float-right")
                                var btn_like = $("<button></button>").addClass("btn btn-sm btn-outline-secondary border-0")
                                //	var btn_delete = $("<button type='button'></button>").addClass("btn btn-sm btn-outline-secondary border-0")
                                //	var btn_edit = $("<button type='button' data-toggle='modal' data-target='#updatePost'></button>").addClass("btn btn-sm btn-outline-secondary border-0")

                                var icon_like = $("<img/>").attr({src: "resources/icon/like_0.png"})
                                //	var icon_delete = $("<img/>").attr({src:"resources/icon/delete-button.png"})
                                //	var icon_update = $("<img/>").attr({src:"resources/icon/create-comment-button.png"})


                                var pno_hidden = $("<p></p>").html(p.post_no)
                                var small = $("<small></small>").addClass("text-muted").html(p.post_time)

                                //	$(btn_edit).attr({no:p.post_no})
                                //	$(btn_delete).attr({no:p.post_no})
                                $(btn_like).attr({no: p.post_no})

                                var detail_a = $("<a></a>").attr({
                                    href: "#",
                                    no: p.post_no
                                })

                                var img = $("<img/>").addClass("card-img-top").attr({
                                    src: "resources/image/" + p.post_fname,
                                    alt: "Card image cap"
                                })


                                $.get("resources/image/" + p.post_fname).done(function () {

                                }).fail(function () {
                                    $(img).attr({
                                        src: "resources/image/error404.jpg"
                                    })
                                })


                                var state = 0;
                                $.each(like_post_no, function (i, no) {
                                    if (no == p.post_no) {
                                        $(icon_like).attr({src: "resources/icon/like_1.png"})
                                        state = 1;
                                    }
                                })

                                var like = cntLike(p.post_no, null);  //게시글 좋아요 값 저장
                                $(p_like_cnt).html("likes  " + like); //좋아요 설정

                                var cntComment = cntCommnet(p.post_no);
                                //alert(cntComment)
                                $(s_comment).html("댓글보기  ")
                                if (cntComment != 0) {
                                    $(s_comment).html("댓글보기  " + cntComment)
                                }


                                $(div_card_header).click(function () {
                                    var followId = $(this).html();
                                    location.href = "profile/userProfile?user_ID=" + followId;
                                })

                                $(btn_like).on("click", function () {
                                    var no = $(this).attr("no");
                                    if (state == 0) {
                                        $.ajax({
                                            url: "doLike.do",
                                            data: {"user_ID": "${user_ID}", "post_no": p.post_no},
                                            success: function (data) {
                                                $(icon_like).attr({src: "resources/icon/like_1.png"})
                                                like = cntLike(p.post_no, null);
                                                (p_like_cnt).html("likes  " + like);
                                            }
                                        })
                                        state = 1
                                        return;
                                    } else if (state == 1) {
                                        $.ajax({
                                            url: "cancelLike.do",
                                            data: {"user_ID": "${user_ID}", "post_no": p.post_no},
                                            success: function (data) {
                                                $(icon_like).attr({src: "resources/icon/like_0.png"})
                                                like = cntLike(p.post_no, null);
                                                (p_like_cnt).html("likes  " + like);
                                            }
                                        })
                                        state = 0
                                        return;
                                    }
                                })


                                $(a_comment).append(s_comment)

                                $(div_f_left).append(p_like_cnt, a_comment)
                                $(btn_like).append(icon_like)

                                $(btn_group).append(btn_like)
                                $(detail_a).append(img)
                                $(div_card_body).append(p_card_text)
                                $(div_card_footer).append(div_f_left, btn_group)
                                $(div_card_mb4_box).append(div_card_header, detail_a, div_card_body, div_card_footer)

                                $(div_col_md_4).append(div_card_mb4_box)

                                $(detail_a).click(function () { //게시글 상세
                                    var no = $(this).attr("no");
                                    $("#col_comment_content").empty();

                                    $.ajax({
                                        url: "detailPost?post_no=" + no, success: function (data) {

                                            detail = eval("(" + data + ")")
                                            //alert(data)
                                            $('#post_no').val(detail.post_no);
                                            $('#detail_Img').attr("src", "resources/image/" + detail.post_fname);

                                            $.get("resources/image/" + detail.post_fname).done(function () {

                                            }).fail(function () {
                                                $('#detail_Img').attr({
                                                    src: "resources/image/error404.jpg"
                                                })
                                            })
                                            $('#h3_detail_userID').html(detail.user_ID);
                                            $('#small_detail_content').html(detail.post_hash);
                                            $.ajax({ //댓글 리스트
                                                url: "listComment.do?post_no=" + detail.post_no,
                                                success: function (data) {
                                                    var arr = eval("(" + data + ")")
                                                    //alert(arr)
                                                    $.each(arr, function (i, p) {
                                                        var h6 = $("<h6></h6>").html(p.user_ID + " ");
                                                        var small = $("<small></small>").html(p.comment_content);
                                                        var btn_DeleteComment = $("<button type='button' class='close' aria-label='Close'><span aria-hidden='true'>&times;</span></button>")

                                                        $(small).append(btn_DeleteComment)
                                                        if (user_SessionID != p.user_ID) {
                                                            $(btn_DeleteComment).hide()
                                                        }
                                                        $(h6).append(small);
                                                        $(h6).attr({
                                                            id: "h6_" + i
                                                        })
                                                        $(btn_DeleteComment).attr("idx", i)

                                                        $(btn_DeleteComment).click(function () { //댓글 삭제
                                                            var cno = p.comment_no;
                                                            var pno = p.post_no;
                                                            var h = $(this).attr("idx")

                                                            //alert(h)
                                                            $.ajax({
                                                                url: "deleteComment",
                                                                type: "post",
                                                                data: {"comment_no": cno, "post_no": pno},
                                                                success: function (data) {
                                                                    if (data >= 1) {
                                                                        alert("삭제되었습니다.")
                                                                        $("#h6_" + h).remove()
                                                                    } else {
                                                                        alert("삭제에 실패했습니다")
                                                                    }
                                                                }
                                                            })
                                                        })
                                                        //if(user_SessionID!=guestID){$(btn_DeleteComment).hide()}
                                                        $("#col_comment_content").append(h6);
                                                    })
                                                }
                                            })

                                        }
                                    })
                                    $('#detail_Dialog').modal('show')
                                })
                                $("#row1").append(div_col_md_4)
                            });
                        }
                    }); //게시물 생성 ajax

                }
            })

            function cntLike(postNo, commentNo) { //좋아요 카운트 함수
                var result;
                $.ajax({
                    url: "cntLike.do",
                    async: false,
                    data: {"post_no": postNo, "comment_no": commentNo},
                    success: function (data) {
                        result = data;
                    }
                })
                return result;
            }

            function cntCommnet(postNo) { //좋아요 카운트 함수
                var result;
                $.ajax({
                    url: "cntComment.do",
                    async: false,
                    data: {"post_no": postNo},
                    success: function (data) {
                        result = data;
                    }
                })
                return result;
            }

        })

    </script>

</head>

<body>
<header></header>
<!--  네비게이션  -->
<nav class="nav navbar navbar-expand-sm navbar-light bg-light navbar-fixed-top mb-3">
    <div class="navbar-header navbar-center mx-auto">
        <a class="navbar-brand mb-0 h1 mx-3 my-2 " href="timeLine">Edem</a>
    </div>
</nav>

<!-- 게시글  -->
<div class="container">
    <div class="row">
        <div class="col-md-12" id="masonry_col">
            <div class="item small"></div>
        </div>
    </div>
</div>

<!-- 썸네일 게시판  -->
<div class="container">
    <div class="row" id="row1">

    </div>
</div>

<!-- 글쓰기 Modal -->
<div class="modal fade " id="insertPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form class="form" action="insertPost.do" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title">새 글 쓰기</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="hidden" class="form-contorl" id="user_ID" name="user_ID" value="${user_ID }">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="5" name="post_content" placeholder="내용을 입력하세요"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-contorl-file" name="uploadFile">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary">글쓰기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 글 수정 Modal -->
<div class="modal fade" id="updatePost" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form class="form" action="../updatePost.do" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title">글 수정</h5>
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>  post_no-->
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="hidden" class="form-contorl" id="updatate_Post_no" name="post_no">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-contorl" id="user_ID" name="user_ID"
                               value="${profile.user_ID }">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="5" id="post_content" name="post_content"
                                  placeholder="내용을 입력하세요"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="file" class="form-contorl-file" name="uploadFile">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- detail modal -->

<div class="modal fade" id="detail_Dialog" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="h3_detail_userID"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img id="detail_Img" class="img-fluid d-inline-block h-100 w-100">
            </div>
        </div>
    </div>
</div>

<div class="icon-bar ">
    <a href="timeLine"><i class="fa fa-home"></i></a>
    <a href="timeLineSearch"><i class="fa fa-search"></i></a>
    <a href="#" data-toggle="modal" data-target="#insertPost" id="write"><i class="fas fa-pencil-alt"></i></a>
    <a href="profile/userProfile?user_ID=${user_ID }"><i class="fas fa-user-astronaut"></i></a>
    <a href="profile/editProfile"><i class="fa fa-cog"></i></a>
</div>


</body>
</html>