<%-- 
    Document   : index
    Created on : Jun 27, 2023, 1:59:52 PM
    Author     : dinhg
--%>

<%@page import="com.hope.account.AccountDTO"%>
<%@page import="com.hope.Cart.Product"%>
<%@page import="com.hope.Cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOPE'S SHOP</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="icon" type="image/x-icon" href="images/favicon.png">

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
        <div class="">
            <!--Header - top-->
            <jsp:include page="header/header-top1.jsp"></jsp:include>
                <!--Header - top -->
                <!--Header - Bottom -->
            <jsp:include page="header/header-bottom1.jsp"></jsp:include>
                <!--body-->
                <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
                    <div style="background-color: whitesmoke">
                        <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8 text-lg">
                        <%! String thanks;%>
                        <div class="text-md text-red-500 py-2 mx-2 my-2 flex justify-center">
                            <% thanks = (String) request.getAttribute("thanks");
                                if (thanks != null) {
                                    out.print("<div>" + "*" + thanks + "</div>");
                                }%>
                        </div>
                        <div class="py-14 px-4 md:px-6 2xl:px-20 2xl:container 2xl:mx-auto">
                            <%
                                if (session == null || session.getAttribute("usersession") == null) {
                                    // User is not logged in
                            %>
                            <div style="text-align: center; font-size: 1.5rem">
                                <p style="display:inline; font-weight: bold; ">Have you have an account?</p> 
                                <a href="./login" style="text-decoration: none;"> Login now</a>                                    
                            </div>
                            <%
                            } else {
                                // User is logged in
                            %>

                            <%
                                }
                            %>

                            <div class="flex justify-start item-start space-y-2 flex-col">
                                <h1 class="text-3xl dark:text-white lg:text-4xl font-semibold leading-7 lg:leading-9 text-gray-800">Order Checkout</h1>                                   
                            </div> 

                            <div class="mt-10 flex flex-col xl:flex-row justify-center items-stretch w-full xl:space-x-8 space-y-4 md:space-y-6 xl:space-y-0">
                                <% Cart cart = (Cart) session.getAttribute("CART");
                                    if (cart != null && cart.getCart().size() > 0) { %>
                                <div class="flex flex-col justify-start items-start w-full space-y-4 md:space-y-6 xl:space-y-8">
                                    <% double total = 0;
                                        for (Product product : cart.getCart().values()) {
                                            total += product.getPrice() * product.getQuantity();%>
                                    <div class="mt-4 md:mt-6 flex flex-col md:flex-row justify-start items-start md:items-center md:space-x-6 xl:space-x-8 w-full">
                                        <div class="pb-4 md:pb-8 w-full md:w-40">
                                            <img class="w-full" src="<%= product.getLink()%>" alt="dress" />
                                        </div>
                                        <div class="border-b border-gray-200 md:flex-row flex-col flex justify-between items-start w-full pb-8 space-y-4 md:space-y-0">
                                            <div class="w-full flex flex-col justify-start items-start space-y-8">
                                                <h3 class="text-xl dark:text-white xl:text-2xl font-semibold leading-6 text-gray-800"><%= product.getName()%></h3>
                                                <div class="flex justify-start items-start flex-col space-y-2">
                                                    <p class="text-sm dark:text-white leading-none text-gray-800"><span class="dark:text-gray-400 text-gray-300">Size: </span>           
                                                        <% if (product.getCurrentSize().contains("0")) {%>
                                                        <span value="0">S</span>
                                                        <% } %>
                                                        <% if (product.getCurrentSize().contains("1")) { %>
                                                        <span value="1">M</span>
                                                        <% } %>
                                                        <% if (product.getCurrentSize().contains("2")) { %>
                                                        <span value="2">L</span>
                                                        <% } %>
                                                        <% if (product.getCurrentSize().contains("3")) { %>
                                                        <span value="3">XL</span>
                                                        <% } %>

                                                    </p>
                                                    <p class="text-sm dark:text-white leading-none text-gray-800"><span class="dark:text-gray-400 text-gray-300">Color: </span> 
                                                        <% if (product.getCurrentColor().contains("0")) {%>
                                                        <span value="0">Black</span>
                                                        <% } %>
                                                        <% if (product.getCurrentColor().contains("1")) { %>
                                                        <span value="1">White</span>
                                                        <% } %>
                                                        <% if (product.getCurrentColor().contains("2")) { %>
                                                        <span value="2">Blue</span>
                                                        <% } %>
                                                        <% if (product.getCurrentColor().contains("3")) { %>
                                                        <span value="3">Green</span>
                                                        <% } %>
                                                        <% if (product.getCurrentColor().contains("4")) { %>
                                                        <span value="4">Yellow</span>
                                                        <% } %>
                                                        <% if (product.getCurrentColor().contains("5")) { %>
                                                        <span value="5">Brown</span>
                                                        <% } %>
                                                        <% if (product.getCurrentColor().contains("6")) { %>
                                                        <span value="6">Gray</span>
                                                        <% }%>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="flex justify-between space-x-8 items-start w-full">
                                                <p class="text-base dark:text-white xl:text-lg leading-6">$<%= product.getPrice()%></p>
                                                <p class="text-base dark:text-white xl:text-lg leading-6 text-gray-800"><%= product.getQuantity()%></p>
                                                <p class="text-base dark:text-white xl:text-lg font-semibold leading-6 text-gray-800">$<%= product.getPrice() * product.getQuantity()%></p>
                                            </div>
                                        </div>
                                    </div>
                                    <% }%>
                                    <h2>Total: <%= total%>$</h2>
                                </div>
                                <% } else {%>
                                <div class="text-xl dark:text-white xl:text-2xl font-semibold leading-6 text-gray-800">Cart is empty <a href='./index.jsp'>go back shopping</a></div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="flex justify-between xl:h-full items-stretch w-full flex-col mt-6 md:mt-0">
                                <div class="flex justify-center md:justify-start xl:flex-col flex-col md:space-x-6 lg:space-x-8 xl:space-x-0 space-y-4 xl:space-y-12 md:space-y-0 md:flex-row items-center md:items-start">
                                    <div class="flex justify-center md:justify-start items-center md:items-start flex-col space-y-4 xl:mt-8">   
                                        <p class="text-lg md:text-xl dark:text-white font-semibold leading-6 xl:leading-5 text-gray-800">Shipment Details</p>
                                        <div>
                                            <form method="POST" action="order">
                                                <div class="grid grid-cols-3 gap-x-6 gap-y-10 sm:grid-cols-4 lg:grid-cols-3 xl:gap-x-8 xl:gap-y-8">
                                                    <div class="relative mt-2 rounded-md shadow-sm">   
                                                        <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Receiver's Name: </label>
                                                        <input required type="text" name="name" id="name" class="block w-full rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Full Name">

                                                    </div>
                                                    <div class="relative mt-2 rounded-md shadow-sm">   
                                                        <label for="phoneNumber" class="block text-sm font-medium leading-6 text-gray-900">Receiver's Phone number: </label>
                                                        <input required type="text" name="phoneNumber" id="phoneNumber" class="block w-full rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Phone number">
                                                    </div>
                                                    <div class="relative mt-2 rounded-md shadow-sm">   
                                                        <label for="address" class="block text-sm font-medium leading-6 text-gray-900">Shipping Address: </label>
                                                        <input required type="text" name="address" id="address" style="width: 370px" class="block rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Address/City/District/Commune">

                                                    </div>
                                                    <%
                                                        if (session == null || session.getAttribute("usersession") == null) {
                                                            // User is not logged in
                                                    %>
                                                    <div>
                                                        <button style="border: 1px solid black; background-color: aquamarine; font-weight: 400; text-align: center; padding: 1rem; border-radius: 5px; font-weight: 700;" onclick="showLoginMessage()">Confirm Order</button>
                                                    </div>
                                                    <script>
                                                        function showLoginMessage() {
                                                            alert("Please login to submit an order.");
                                                        }
                                                    </script>
                                                    <%
                                                    } else {
                                                    %>
                                                    <div>
                                                        <button type='submit' style="border: 1px solid black; background-color: aquamarine; font-weight: 400; text-align: center; padding: 1rem; border-radius: 5px; font-weight: 700;">Confirm Order</button>
                                                    </div>
                                                    <%
                                                        }
                                                    %>
                                                </div>                                                                    
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                                                  
                            <hr>

                            <div class="flex flex-col justify-center px-4 py-6 md:p-6 xl:p-8 w-full bg-gray-50 dark:bg-gray-800 space-y-6">
                                <h3 class="text-xl dark:text-white font-semibold leading-5 text-gray-800">Payment Method</h3>
                                <div class="flex justify-between items-start w-full">
                                    <div class="flex justify-center items-center space-x-4">
                                        <div class="w-12 h-10">
                                            <img class="w-full h-full" alt="logo" src="images/cod.png" />
                                        </div>
                                        <div class="flex flex-col justify-start items-center pt-4">
                                            <p class="text-lg leading-6 dark:text-white font-semibold text-gray-800">COD (Pay on delivery)<br /><span class="font-normal">Delivery within 4 days</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

        <!--footer-->
        <jsp:include page="footer/footerlevel1.jsp"></jsp:include>
    </div>
</div>
<!---->
</body>
</html>
