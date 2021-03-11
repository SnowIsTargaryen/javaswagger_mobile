<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>


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
    <!-- <link rel="stylesheet" type="text/css" href="resources/css/login.css" > -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#findUserPwd").click(function () {
                location.href = "../account/findUserPwd";
            })
            $("#login").click(function () {
                location.href = "../login";
            })


            $("#msg").click(function () {
                alert("확인 버튼을 눌러 확인하세요");
            })
            var user_email = $("#user_email").val();

            var user_phone = $("#user_phone").val();

            $("#findUserID").click(function () {
                var userid = $("#userid").val();
                alert("ID찾기 결과: " + userid);

            })
        })

    </script>

    <title>Find your ID</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col col-xs-3 col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">ID찾기</h5>
                    <form class="form-signin" action="findUserId" method="post">
                        <div class="form-label-group">
                            <label for="user_email">Email</label>
                            <input type="text" id="user_email" name=user_email class="form-control"
                                   placeholder="가입시 등록한  e-mail입력" required autofocus>
                        </div>
                        <br class="my-3">
                        <div class="form-label-group">
                            <label for="user_phone">Phone</label>
                            <input type="text" id="user_phone" name="user_phone" class="form-control"
                                   placeholder="등록된 핸드폰번호 입력" required>
                        </div>
                        <br class="my-3">
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" id="msg" type="submit">ID 찾기
                        </button>
                        <button class="btn btn-defualt" id="findUserID">ID확인</button>
                        <br class="my-2">
                        <a id="login" href="#">Login</a>

                        <hr class="my-3">
                        <a id="findUserPwd" href="#">Forgot your Password?</a>
                    </form>
                    <div><input id="userid" type="hidden" value="${u.user_ID}"></div>

                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>        
        
       
		        
        
   