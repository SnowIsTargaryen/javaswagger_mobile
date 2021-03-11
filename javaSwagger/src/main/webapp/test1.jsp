<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>

    <style type="text/css">

        body {
            padding-top: 54px;
        }

        @media (min-width: 992px) {
            body {
                padding-top: 56px;
            }
        }

        .bg-image-full {
            background: no-repeat center center scroll;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            background-size: cover;
            -o-background-size: cover;
        }

        #profileImg {

            width: 100px;
            height: 100px;

        }

        }

    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <!--ºÎÆ® ½ºÆ®·¦ CDN  -->
    <script type="text/javascript">

        $(function () {


            //pie
            var ctxP = document.getElementById("pieChart").getContext('2d');
            var myPieChart = new Chart(ctxP, {
                type: 'pie',
                data: {
                    labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
                    datasets: [
                        {
                            data: [300, 50, 100, 40, 120],
                            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
                        }
                    ]
                },
                options: {
                    responsive: true
                }
            });

        })

    </script>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form class="form-signin">
                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control" placeholder="Email address"
                                   required autofocus>
                            <label for="inputEmail">Email address</label>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control" placeholder="Password"
                                   required>
                            <label for="inputPassword">Password</label>
                        </div>

                        <div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">Remember password</label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                        <hr class="my-4">
                        <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i
                                class="fab fa-google mr-2"></i> Sign in with Google
                        </button>
                        <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i
                                class="fab fa-facebook-f mr-2"></i> Sign in with Facebook
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>