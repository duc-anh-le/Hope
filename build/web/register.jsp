<%-- 
    Document   : index
    Created on : Jul 8, 2023, 10:31:09 AM
    Author     : Admin
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
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
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
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 10);
                });
            });
        </script>	
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>				


        <script>
            var check = function () {
                if (document.getElementById('password').value ==
                        document.getElementById('confirmPassword').value) {
                    document.getElementById('submitButton').disabled = false;
                    document.getElementById('message').style.display = 'none';
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = 'Password is not matching';
                    document.getElementById('submitButton').disabled = true;
                }
            }
        </script>
        <script>
            var checkPhoneNumber = function () {
                var phoneNumber = document.getElementById("phone").value;
                var regex = /^\d+$/;
                console.log(phoneNumber);
                if (phoneNumber.length == 10 && regex.test(phoneNumber)) {
                    document.getElementById('message-phone').style.display = 'none';
                    document.getElementById('submitButton').disabled = false;
                } else {
                    document.getElementById('message-phone').style.display = 'block';
                    document.getElementById('message-phone').style.color = 'red';
                    document.getElementById('message-phone').innerHTML = 'Phone number must be 10 digits';
                    document.getElementById('submitButton').disabled = true;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="header/header-top1.jsp"></jsp:include>
            <!--Header - top -->
            <!--Header - Bottom -->
            <div class="hidden"><jsp:include page="header/header-bottom1.jsp"></jsp:include></div>
            <!--            <div class="w-full flex justify-center items-center">
                        <h1>Please login</h1>
        <div> <form action="./login" name="" method="POST">
                <input name="user" type="text">
                <input name="password" type="password">
                <input value="Login" type="submit">
            </form></div>
    </div>-->

            <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
                <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                    <img class="mx-auto h-10 w-auto bg-gray-800 border rounded-full" src="images/logo.jpg"  alt="Your Company">
                    <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Register your account</h2>
                </div>

                <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                    <form class="space-y-6" action="./register" name="" method="POST">
                        <div>
                            <label for="user" class="block text-sm font-medium leading-6 text-gray-900">Account</label>
                            <div class="mt-2">
                                <input id="user" name="user" type="text" placeholder="Username"required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>
                        <div>
                            <label for="fullname" class="block text-sm font-medium leading-6 text-gray-900">Full Name</label>
                            <div class="mt-2">
                                <input id="fullname" name="fullname" type="text" placeholder="Full name"required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>
                        <div>
                            <label for="phone" class="block text-sm font-medium leading-6 text-gray-900">Phone Number</label>
                            <div class="mt-2">
                                <input id="phone" name="phone" type="text" required onkeyup='checkPhoneNumber();' class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="XXX-XXX-XXXX">
                                <div id='message-phone' class="mt-4"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex items-center justify-between">
                                <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Password</label>
                            </div>
                            <div class="mt-2">
                                <input id="password" name="password" type="password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div>
                            <div class="flex items-center justify-between">
                                <label for="confirmPassword" class="block text-sm font-medium leading-6 text-gray-900">Confirm Password</label>
                            </div>
                            <div class="mt-2">
                                <input id="confirmPassword" name="confirmPassword" type="password" onkeyup='check();' required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                <div id='message' class="mt-4"></div>
                            </div>
                        <%! String err;
                        %>
                        <div class="text-sm text-red-800 py-2 mx-2 my-2">
                            <% err = (String) request.getAttribute("error");
                                if (err != null) {
                                    out.print("<div>" + err + "</div");
                                }%>
                        </div>
                    </div>

                    <div>
                        <button id="submitButton" type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600" disabled>Register</button>
                    </div>
                </form>

            </div>
        </div>
        <jsp:include page="footer/footerlevel1.jsp"></jsp:include>
    </body>
</html>
