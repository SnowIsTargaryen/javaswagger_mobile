<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
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
    <link type="text/css" rel="stylesheet" href="waitMe.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script src="waitMe.js"></script>
    <script>
        $(function () {

// none, bounce, rotateplane, stretch, orbit, 
// roundBounce, win8, win8_linear or ios
            var current_effect = 'bounce'; //

            $('#demo').click(function () {
                run_waitMe(current_effect);
            });

            function run_waitMe(effect) {
                $('#SELECTOR').waitMe({

//none, rotateplane, stretch, orbit, roundBounce, win8, 
//win8_linear, ios, facebook, rotation, timer, pulse, 
//progressBar, bouncePulse or img
                    effect: 'bounce',

//place text under the effect (string).
                    text: '',

//background for container (string).
                    bg: 'rgba(255,255,255,0.7)',

//color for background animation and text (string).
                    color: '#000',

//max size
                    maxSize: '',

//wait time im ms to close
                    waitTime: -1,

//url to image
                    source: '',

//or 'horizontal'
                    textPos: 'vertical',

//font size
                    fontSize: '',

// callback
                    onClose: function () {
                    }

                });
            }

        });
    </script>
    <title>Insert title here</title>
</head>
<body>
<button type="button" id="demo">Submit</button>

</body>
</html>


<!--


-->