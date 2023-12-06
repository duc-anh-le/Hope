<%-- 
    Document   : order
    Created on : Jul 19, 2023, 1:07:12 PM
    Author     : Admin
--%>

<%@page import="com.hope.account.AccountDTO"%>
<%@page import="com.hope.Orders.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.hope.Orders.OrderDAO"%>
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

    </head>
    <body>
        <jsp:include page="header/header-top1.jsp"></jsp:include>
            <!--Header - top -->
            <!--Header - Bottom -->
            <div class="hidden"><jsp:include page="header/header-bottom1.jsp"></jsp:include></div>
            <div class="flex flex-col min-h-full p-6">
            <% OrderDAO orderDAO = new OrderDAO();
                AccountDTO accountDTO = (AccountDTO) session.getAttribute("usersession");
                String user = accountDTO.getUsername();
                List<Order> orders = orderDAO.getOrderUser(user);
                if (!orders.isEmpty()) {
            %>
            <div class="ml-12 px-6">
                <h2 class="text-start text-2xl font-bold leading-9 tracking-tight text-red-500 mx-12">Your order: </h2>
            </div>

            <div class="flex justify-center">

                <table border="1" class="w-[66%] text-center text-sm font-light">
                    <thead class="border-b font-medium dark:border-neutral-500 uppercase whitespace-nowrap">
                        <tr>
                            <th class="px-3 py-3">Product Id</th>
                            <th class="px-3 py-3">Phone number</th>
                            <th class="px-3 py-3">Address</th>
                            <th class="px-3 py-3">Full Name</th>
                            <th class="px-3 py-3">Size</th>
                            <th class="px-3 py-3">Color</th>
                            <th class="px-3 py-3">Quantity</th>
                            <th class="px-3 py-3">price</th>
                            <th class="px-3 py-3">Total Price</th>
                        </tr>
                    </thead>
                    <tbody>   
                        <%
                            for (Order order : orders) {
                        %>
                        <tr class="border-b dark:border-neutral-500">
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getProductid()%></td>
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getPhone()%></td>
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getAddress()%></td>             
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getFullname()%></td>
                            <td class="whitespace-nowrap px-6 py-4"><%=(order.getSize().equals("0")) ? "S"
                                    : (order.getSize().equals("1")) ? "M"
                                    : (order.getSize().equals("2")) ? "L"
                                    : (order.getSize().equals("3")) ? "XL" : "Unknown"%></td>
                            <td class="whitespace-nowrap px-6 py-4">  <%=(order.getColor().equals("0")) ? "Black"
                                    : (order.getColor().equals("1")) ? "White"
                                    : (order.getColor().equals("2")) ? "Blue"
                                    : (order.getColor().equals("3")) ? "Green"
                                    : (order.getColor().equals("4")) ? "Yellow"
                                    : (order.getColor().equals("5")) ? "Brown"
                                    : (order.getColor().equals("6")) ? "Gray" : "Unknown"%></td>
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getQuantity()%></td>
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getPrice()%>$</td>
                            <td class="whitespace-nowrap px-6 py-4"><%= order.getTotalPrice()%>$</td>
                        </tr>
                        <% }%>
                        <% } else {%>
                    <h1 class="flex justify-center text-red-500 my-20">You have not bought anything! </h1>
                    <div class="flex justify-center text-red-500 "><a href='./index.jsp'>go back shopping</a></div>
                    <% }%>
                    </tbody>
                </table>

            </div>
        </div>
        <jsp:include page="footer/footerlevel1.jsp"></jsp:include>
    </body>
</html>
