<%-- 
    Document   : search
    Created on : Jul 11, 2023, 10:10:10 AM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="com.hope.Cart.Product"%>
<%@page import="com.hope.Cart.ProductDAO"%>
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
                <div classname="body">
                    <div style="background-color: whitesmoke">
                        <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">
                            <!--category-->
                            <h2 style="text-align: center; font-weight: 900;">___________ Category ___________</h2>
                            <div classname="category_nav" style="display: flex; justify-content:center; align-content: center">
                                <div class="category_btn" style="border: 1px solid antiquewhite; border-radius: 1rem; width: 10rem; height: 10rem; margin: 3rem 1rem 7rem 1rem; background: #eaefef;"</div>
                                <a style="border-radius: 1rem;display: flex; align-items: center; justify-content: center; flex-direction: column; text-decoration: none; color: black;"  href="./index.jsp">
                                    <br>
                                    <div> <img src="images/home_category.jpg" alt=""></div>
                                    <div> <p style="font-weight: bold; font-size:1.5rem;">Home</p></div>
                                    <div style="text-align: center"><p>Featured Product</p></div>
                                </a>
                            </div>
                            <div class="category_btn" style="border: 1px solid antiquewhite; border-radius: 1rem; width: 10rem; height: 10rem; margin: 3rem 1rem 7rem 1rem; background: #eaefef;">
                                <a style="border-radius: 1rem; display: flex; align-items: center; justify-content: center; flex-direction: column; text-decoration: none; color: black;" href="./menProduct.jsp">
                                    <br>
                                    <div> <img src="images/men-category.png" alt=""></div>
                                    <div> <p style="font-weight: bold; font-size:1.5rem;">Men</p></div>
                                    <div style="text-align: center"> <p>All jacket for men</p></div>
                                </a>
                            </div>
                            <div class="category_btn" style="border: 1px solid antiquewhite; border-radius: 1rem; width: 10rem; height: 10rem; margin: 3rem 1rem 7rem 1rem; background: #eaefef;">
                                <a style="border-radius: 1rem; display: flex; align-items: center; justify-content: center; flex-direction: column; text-decoration: none; color: black;" href="./womenProduct.jsp">
                                    <br>
                                    <div> <img src="images/women-category.png" alt=""></div>
                                    <div> <p style="font-weight: bold; font-size:1.5rem;">Women</p></div>
                                    <div style="text-align: center"> <p>All jacket for women</p></div>
                                </a>
                            </div>
                            <div class="category_btn" style="border: 1px solid antiquewhite; border-radius: 1rem; width: 10rem; height: 10rem; margin: 3rem 1rem 7rem 1rem; background: #eaefef;">
                                <a style="border-radius: 1rem; display: flex; align-items: center; justify-content: center; flex-direction: column; text-decoration: none; color: black;" href="./unisexProduct.jsp">
                                    <br>
                                    <div> <img src="images/couple-category.png" alt=""></div>
                                    <div> <p style="font-weight: bold; font-size:1.5rem;">Unisex</p></div>
                                    <div style="text-align: center"> <p>All unisex product</p></div>
                                </a>
                            </div>
                        </div>
                        <!--thêm nút sort ở đây-->
                        <!--item list-->
                        <h2 class="text-2xl font-bold tracking-tight text-gray-900">Search: </h2>                         
                        <div class="mt-6 grid grid-cols-4 gap-x-6 gap-y-10 sm:grid-cols-4 lg:grid-cols-4 xl:gap-x-8 xl:gap-y-8">
                            <!--item-->
                        <%
                            ProductDAO productDAO = new ProductDAO();
                            int pageNumber = 1;
                            if (request.getParameter("page") != null) {
                                pageNumber = Integer.parseInt(request.getParameter("page"));
                                pageNumber = pageNumber == 0 ? 1 : pageNumber;
                            }
                            String search = request.getParameter("search");
                            int pageSize = 8;
                            List<Product> products = productDAO.getProductPageSearch(pageNumber, pageSize, search);
                            for (Product product : products) {
                                String valueSubmit = product.getId() + "_" + product.getName() + "_" + product.getPrice() + "_" + product.getLink();
                        %>
                        <div style="background-color: white;" class="group relative">
                            <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80">
                                <img src="<%= product.getLink()%>" alt="" class="h-full w-full object-cover object-center lg:h-full lg:w-full">
                            </div>
                            <div style="text-align: center">
                                <form method="POST" action="productDetails">
                                    <button type="submit" name="productName" value="<%= valueSubmit%>" style="text-decoration: none; color: black; font-weight: bold"><%= product.getName()%> - <%= product.getId()%></button>
                                </form>
                            </div>
                            <div style="display: flex; justify-content: space-around">
                                <div style="padding:2%">
                                    <p class="text-gray-900 font-medium"><%= product.getPrice()%>$</p> 
                                </div>
                                <span style="width:30%"></span>
                                <div class="rounded-lg border-2 border-black" style=" padding:4%;">                                         
                                    <form method="POST" action="cart">
                                        <button type="submit" name="productName" value="<%= valueSubmit%>">Add</button>
                                    </form>
                                </div>                                                                              
                            </div> 
                        </div>
                        <%    }
                        %>
                    </div> 
                    <%
                        int currentPage = 1; // The current page number
                        int totalRecords = productDAO.getTotalRowSearch(search); // The total number of products (assuming 100 in this example)
                        int totalPages = (int) Math.ceil((double) totalRecords / pageSize); // Calculate the total number of pages

                        // Retrieve the list of products for the current page
                    %>
                    <!-- Render pagination controls -->
                    <div class="text-white transition-colors p-2 mt-2 flex justify-center ">
                        <% for (int i = 1; i <= totalPages; i++) {%>
                        <a href="?page=<%= i%>&&search=<%=search%>" class="p-2 no-underline"><%= i%></a>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>

        <!--footer-->
        <jsp:include page="footer/footerlevel1.jsp"></jsp:include>
    </div>
</body>
</html>
