<%--
  Created by IntelliJ IDEA.
  User: khaqu
  Date: 4/2/2023
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang='en' class=''>

<head>

    <meta charset='UTF-8'>
    <title>Mỹ Phẩm QST || Đăng nhập</title>
    <link rel="icon" href="user-template/img/icon/icon_user.jpg" type="image/x-icon">
    <meta name="robots" content="noindex">
    <link rel="mask-icon"
          href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg"
          color="#111">
    <link rel="canonical" href="https://codepen.io/yexx/pen/XPZpoK">

    <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <style id="INLINE_PEN_STYLESHEET_ID">
        html,
        body {
            height: 100%;
        }

        body {
            display: grid;
            width: 100%;
            font-family: Inconsolata, monospace;
        }

        body div#error {
            position: relative;
            margin: auto;
            padding: 20px;
            z-index: 2;
        }

        body div#error div#box {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 1px solid #000;
        }

        body div#error div#box:before,
        body div#error div#box:after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            box-shadow: inset 0px 0px 0px 1px #000;
            mix-blend-mode: multiply;
            animation: dance 2s infinite steps(1);
        }

        body div#error div#box:before {
            clip-path: polygon(0 0, 65% 0, 35% 100%, 0 100%);
            box-shadow: inset 0px 0px 0px 1px currentColor;
            color: #f0f;
        }

        body div#error div#box:after {
            clip-path: polygon(65% 0, 100% 0, 100% 100%, 35% 100%);
            animation-duration: 0.5s;
            animation-direction: alternate;
            box-shadow: inset 0px 0px 0px 1px currentColor;
            color: #0ff;
        }

        body div#error h3 {
            position: relative;
            font-size: 5vw;
            font-weight: 700;
            text-transform: uppercase;
            animation: blink 1.3s infinite steps(1);
        }

        body div#error h3:before,
        body div#error h3:after {
            content: 'ERROR 500';
            position: absolute;
            top: -1px;
            left: 0;
            mix-blend-mode: soft-light;
            animation: dance 2s infinite steps(2);
        }

        body div#error h3:before {
            clip-path: polygon(0 0, 100% 0, 100% 50%, 0 50%);
            color: #f0f;
            animation: shiftright 200ms steps(2) infinite;
        }

        body div#error h3:after {
            clip-path: polygon(0 100%, 100% 100%, 100% 50%, 0 50%);
            color: #0ff;
            animation: shiftleft 200ms steps(2) infinite;
        }

        body div#error p {
            position: relative;
            margin-bottom: 8px;
        }

        body div#error p span {
            position: relative;
            display: inline-block;
            font-weight: bold;
            color: #000;
            animation: blink 3s steps(1) infinite;
        }

        body div#error p span:before,
        body div#error p span:after {
            content: 'unstable';
            position: absolute;
            top: -1px;
            left: 0;
            mix-blend-mode: multiply;
        }

        body div#error p span:before {
            clip-path: polygon(0 0, 100% 0, 100% 50%, 0 50%);
            color: #f0f;
            animation: shiftright 1.5s steps(2) infinite;
        }

        body div#error p span:after {
            clip-path: polygon(0 100%, 100% 100%, 100% 50%, 0 50%);
            color: #0ff;
            animation: shiftleft 1.7s steps(2) infinite;
        }

        @-moz-keyframes dance {
            0%, 84%, 94% {
                transform: skew(0deg);
            }
            85% {
                transform: skew(5deg);
            }
            90% {
                transform: skew(-5deg);
            }
            98% {
                transform: skew(3deg);
            }
        }

        @-webkit-keyframes dance {
            0%, 84%, 94% {
                transform: skew(0deg);
            }
            85% {
                transform: skew(5deg);
            }
            90% {
                transform: skew(-5deg);
            }
            98% {
                transform: skew(3deg);
            }
        }

        @-o-keyframes dance {
            0%, 84%, 94% {
                transform: skew(0deg);
            }
            85% {
                transform: skew(5deg);
            }
            90% {
                transform: skew(-5deg);
            }
            98% {
                transform: skew(3deg);
            }
        }

        @keyframes dance {
            0%, 84%, 94% {
                transform: skew(0deg);
            }
            85% {
                transform: skew(5deg);
            }
            90% {
                transform: skew(-5deg);
            }
            98% {
                transform: skew(3deg);
            }
        }

        @-moz-keyframes shiftleft {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(-8px, 0) skew(20deg);
            }
        }

        @-webkit-keyframes shiftleft {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(-8px, 0) skew(20deg);
            }
        }

        @-o-keyframes shiftleft {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(-8px, 0) skew(20deg);
            }
        }

        @keyframes shiftleft {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(-8px, 0) skew(20deg);
            }
        }

        @-moz-keyframes shiftright {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(8px, 0) skew(20deg);
            }
        }

        @-webkit-keyframes shiftright {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(8px, 0) skew(20deg);
            }
        }

        @-o-keyframes shiftright {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(8px, 0) skew(20deg);
            }
        }

        @keyframes shiftright {
            0%, 87%, 100% {
                transform: translate(0, 0) skew(0deg);
            }
            84%, 90% {
                transform: translate(8px, 0) skew(20deg);
            }
        }

        @-moz-keyframes blink {
            0%, 50%, 85%, 100% {
                color: #000;
            }
            87%, 95% {
                color: transparent;
            }
        }

        @-webkit-keyframes blink {
            0%, 50%, 85%, 100% {
                color: #000;
            }
            87%, 95% {
                color: transparent;
            }
        }

        @-o-keyframes blink {
            0%, 50%, 85%, 100% {
                color: #000;
            }
            87%, 95% {
                color: transparent;
            }
        }

        @keyframes blink {
            0%, 50%, 85%, 100% {
                color: #000;
            }
            87%, 95% {
                color: transparent;
            }
        }

    </style>


    <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-6bce046e7128ddf9391ccf7acbecbf7ce0cbd7b6defbeb2e217a867f51485d25.js"></script>
    <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
    <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
</head>

<body>

<div id="error">
    <div id="box"></div>
    <h3>ERROR 500</h3>
    <p>Things are a little <span>unstable</span> here</p>
    <p>I suggest come back later</p>
</div>

<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

</body>

</html>
