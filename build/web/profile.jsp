<%-- 
    Document   : index
    Created on : Jul 8, 2023, 10:31:09 AM
    Author     : Admin
--%>

<%@page import="com.hope.account.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    </head>
    <body>
        <jsp:include page="header/header-top1.jsp"></jsp:include>
            <!--Header - top -->
            <!--Header - Bottom -->
            <div class="hidden"><jsp:include page="header/header-bottom1.jsp"></jsp:include></div>
            <div class="flex w-full justify-center">
                <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
                    <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                        <img class="mx-auto h-20 w-auto bg-gray-800 border rounded-full" src="images/user.png"  alt="Your Avatar">
                        <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Your Account</h2>
                    </div>


                </div>
                <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8 mx-5">
                    <form action="update" method="POST">
                    <% AccountDTO accountDTO = (AccountDTO) session.getAttribute("usersession");%>
                    <c:set var="accountDTO" value="${sessionScope.usersession}" />
                    <c:if test="${accountDTO == null}">
                        <p class="mt-10 text-center text-sm text-gray-500">
                            <a href="./login" class="font-semibold leading-6 text-indigo-600 hover:text-indigo-500">Please Login!</a>
                        </p>
                    </c:if>
                    <c:if test="${accountDTO != null}">
                        <!-- Render a message or other content when a user is logged in -->
                        <div class="mt-2 text-start text-md font-normal leading-4 tracking-tight text-gray-900">Username: <input value=" ${accountDTO.username}" class="rounded-md bg-blue-100 p-1 ml-8" name="username" readonly=""></div> 

                        <!-- Render a message or other content when a user is logged in -->
                        <div class="mt-2 text-start text-md font-normal leading-4 tracking-tight text-gray-900">Full Name:  <input value=" ${accountDTO.name}" class="rounded-md bg-blue-100 p-1 ml-8" name="fullname"></div> 

                        <!-- Render a message or other content when a user is logged in -->
                        <div class="mt-2 text-start text-md font-normal leading-4 tracking-tight text-gray-900">Phone Number:  <input value=" ${accountDTO.phoneNumber}" class="rounded-md bg-blue-100 p-1" name="phone"></div> 

                        <div class="w-full flex justify-center mt-4"> 
                            <button class="flex w-[33%] justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Save</button>
                        </div>
                    </c:if>
                </form>

            </div>
        </div>

        <jsp:include page="footer/footerlevel1.jsp"></jsp:include>
    </body>
</html>
