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
    <link href="resources/css/login.css" rel="stylesheet">
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
            $("#btnAccount").click(function () {
                location.href = "account/create";
            })
            $("#findId").click(function () {
                location.href = "account/findUserId";
            })
        })


        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('38955ba5e6e80c1506a5e481d7b1c00b');

        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
                success: function (authObj) {
                    alert(JSON.stringify(authObj));
                },
                fail: function (err) {
                    alert(JSON.stringify(err));
                }
            });
        };
        //]]>

    </script>

    <title>Insert title here</title>
</head>
<body>


<div class="container">

    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">로그인</h5>
                    <form class="form-signin" action="login" method="post">
                        <div class="form-label-group">
                            <input type="text" id="inputEmail" name="user_ID" class="form-control"
                                   placeholder="Email address" required autofocus>
                            <label for="inputEmail">ID</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" name="user_Password" class="form-control"
                                   placeholder="Password" required>
                            <label for="inputPassword">Password</label>
                        </div>

                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <!-- <label class="custom-control-label" for="customCheck1">Remember password</label> -->
                        </div>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Login</button>
                        <a id="findId" href="#">Forgot your ID/Password?</a>
                        <hr class="my-4">
                        <button class="btn btn-lg btn-account btn-block text-uppercase" id="btnAccount">회원가입</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>        
        
       
		        
        
   