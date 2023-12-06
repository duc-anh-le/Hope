<%-- 
    Document   : 404
    Created on : Jun 27, 2023, 2:05:36 PM
    Author     : dinhg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOPE'S SHOP</title>
        <link rel="icon" type="image/x-icon" href="images/favicon.png">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script src="https://cdn.tailwindcss.com"></script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <!--//slider-script-->
        <script>$(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close2').on('click', function (c) {
                    $('.message2').fadeOut('slow', function (c) {
                        $('.message2').remove();
                    });
                });
            });
        </script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>	
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>				

    </head>
    <body> 
        <!--header-->
        <jsp:include page="header/header-top1.jsp"></jsp:include>
            <!--Header - top -->
            <!--Header - Bottom -->
            <div class="hidden"><jsp:include page="header/header-bottom1.jsp"></jsp:include></div>
            <div class="">

                <!--Header - top-->

                <!--Header - top -->
                <div class="flex justify-center"><img src="https://cdn-cofho.nitrocdn.com/hkdRLHSVltFiefpgfarlYKjlTlpsmQbA/assets/images/optimized/rev-fdae17a/wp-content/uploads/2017/12/404-errors-2048x1188.png" class="w-[60%]"/>
                </div>
                <br>

                <div class="E-404">
                    <p style="font-weight: bold; font-size: larger; text-align: center;">The page you're looking for could not be found.</p>
                    <p style="text-align: center;">
                        <a href="index.jsp" class="more" style="display: inline-block; text-align: center; background-color: green; color: white; padding: 10px 20px; border-radius: 50px;">Go back</a>
                    </p>
                </div>

                <br>


            </div>
        <%--<jsp:include page="footer/footerlevel1.jsp"></jsp:include>--%>
        <!---->

        <!---->
    </body>
</html>
