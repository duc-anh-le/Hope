<%-- 
    Document   : index
    Created on : Jun 27, 2023, 1:59:52 PM
    Author     : dinhg
--%>

<%@page import="java.util.List"%>
<%@page import="com.hope.Cart.ProductDAO"%>
<%@page import="com.hope.Cart.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${id}" />
<c:set var="proname" value="${proname}" />
<c:set var="price" value="${price}" />
<c:set var="link" value="${link}" />
<c:set var="color" value="${color}" />
<c:set var="size" value="${size}" />

<c:set var="description1_string1" value="${description1_string1}" />
<c:set var="description2_string1" value="${description2_string1}" />
<c:set var="description2_string2" value="${description2_string2}" />
<c:set var="description2_string3" value="${description2_string3}" />
<c:set var="description2_string4" value="${description2_string4}" />
<c:set var="description3_string1" value="${description3_string1}" />
<c:set var="description3_string2" value="${description3_string2}" />
<c:set var="description3_string3" value="${description3_string3}" />
<c:set var="description3_string4" value="${description3_string4}" />
<c:set var="description3_string5" value="${description3_string5}" />


<c:set var="valueSubmit" value="${id}_${proname}_${price}_${link}_${color}_${size}" />
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

        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
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
        <div class="">
            <!--Header - top-->
            <jsp:include page="header/header-top1.jsp"></jsp:include>
                <!--Header - top -->
                <!--Header - Bottom -->
            <jsp:include page="header/header-bottom1.jsp"></jsp:include>
                <!--body-->
                <div classname="body">
                <%  String tmp = request.getParameter("productName").substring(0, 1);
                    String category = tmp.equals("N") ? "M" : tmp.equals("W") ? "W" : "U";
                    String linkHref = tmp.equals("N") ? "./menProduct.jsp" : tmp.equals("W") ? "womenProduct.jsp" : "unisexProduct.jsp";
                %>
                <div style="background-color: #E6E6FA">                       
                    <div class="mx-auto max-w-2xl px-4 py-16 sm:px-6 sm:py-24 lg:max-w-7xl lg:px-8">                           
                        <div class="bg-white">                               
                            <div class="pt-6">                                
                                <!-- Image gallery -->                                   
                                <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:grid lg:max-w-7xl lg:grid-cols-2 lg:gap-x-8 lg:px-8">
                                    <div class="aspect-h-4 aspect-w-3 hidden overflow-hidden rounded-lg lg:block">

                                        <img src="${link}" alt="Two each of gray, white, and black shirts laying flat." class="h-full w-full object-cover object-center">
                                    </div>                                    
                                    <!-- Options -->
                                    <div style="padding-top: 25%" class="mt-4 lg:mt-0">
                                        <script>
                                            function toggleRing(label) {
                                                var labels = document.querySelectorAll('label');
                                                labels.forEach(function (label) {
                                                    label.classList.remove('ring');
                                                    label.classList.remove('ring-indigo-500s');
                                                });
                                                label.classList.add('ring');
                                                label.classList.add('ring-indigo-500');
                                            }
                                            function toggleRing2(label) {
                                                var labels = document.querySelectorAll('label');
                                                labels.forEach(function (currLabel) {
                                                    currLabel.classList.remove('border-3');
                                                    var sizeBackground = currLabel.querySelector('.size-background');
                                                    if (sizeBackground) {
                                                        sizeBackground.classList.remove('bg-blue-50');
                                                    }
                                                });
                                                label.classList.add('border-3');
                                                var selectedSizeBackground = label.querySelector('.size-background');
                                                if (selectedSizeBackground) {
                                                    selectedSizeBackground.classList.add('bg-blue-50', 'z');
                                                }
                                            }
                                        </script>
                                        <h2 style="font-weight: 700;">${proname} - ${id}</h2>
                                        <h2 class="sr-only">Product information</h2>
                                        <p class="text-3xl tracking-tight text-gray-900">${price}$</p>
                                        <form method="POST" action="cart" class="mt-10">
                                            <!--fetch proname / link / id / price -->
                                            <div style="display: none">
                                                <input type="text" value="${id}_${proname}_${price}_${link}_${color}_${size}" name="productName">
                                            </div>
                                            <!--Quantity-->
                                            <div>
                                                <h3 class="text-sm font-medium text-gray-900 ">Quantity</h3>
                                                <input class="max-w-[80px]"value="1" style="margin: 2rem 0rem" required type="number" name="quantity" min="1">

                                            </div>
                                            <!-- Colors -->
                                            <div>
                                                <h3 class="text-sm font-medium text-gray-900">Color</h3>

                                                <fieldset class="mt-4" name="currentColor">
                                                    <legend class="sr-only">Choose a color</legend>   
                                                    <div class="flex items-center space-x-3">
                                                        <c:if test="${color.contains('0')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-400">
                                                                <input type="radio" name="color" value="0" class="sr-only" aria-labelledby="color-choice-4-label">
                                                                <span id="color-choice-0-label" class="sr-only">Black</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-black rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${color.contains('1')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-400">
                                                                <input type="radio" name="color" value="1" class="sr-only" aria-labelledby="color-choice-1-label">
                                                                <span id="color-choice-1-label" class="sr-only">White</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-white rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${color.contains('2')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-900">
                                                                <input type="radio" name="color" value="2" class="sr-only" aria-labelledby="color-choice-2-label">
                                                                <span id="color-choice-2-label" class="sr-only">Blue</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-blue-300 rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${color.contains('3')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-900">
                                                                <input type="radio" name="color" value="3" class="sr-only" aria-labelledby="color-choice-3-label">
                                                                <span id="color-choice-3-label" class="sr-only">Green</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-green-700 rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${color.contains('4')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-900">
                                                                <input type="radio" name="color" value="4" class="sr-only" aria-labelledby="color-choice-4-label">
                                                                <span id="color-choice-4-label" class="sr-only">Brown</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-amber-700 rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${color.contains('5')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-900">
                                                                <input type="radio" name="color" value="5" class="sr-only" aria-labelledby="color-choice-5-label">
                                                                <span id="color-choice-5-label" class="sr-only">Yellow</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-yellow-400 rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${color.contains('6')}">
                                                            <label onclick="toggleRing(this)" class="relative -m-0.5 flex cursor-pointer items-center justify-center rounded-full p-0.5 focus:outline-none ring-gray-900">
                                                                <input type="radio" name="color" value="6" class="sr-only" aria-labelledby="color-choice-6-label">
                                                                <span id="color-choice-6-label" class="sr-only">Gray</span>
                                                                <span aria-hidden="true" class="h-8 w-8 bg-gray-200 rounded-full border border-black border-opacity-10"></span>
                                                            </label>
                                                        </c:if>
                                                    </div>
                                                </fieldset>
                                            </div>

                                            <!-- Sizes -->
                                            <div class="mt-10">
                                                <div class="flex items-center justify-between">
                                                    <h3 class="text-sm font-medium text-gray-900">Size</h3>
                                                    <button type="button" class="rounded-full bg-blue-200 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" data-bs-toggle="modal" data-bs-target="#sizeGuide">
                                                        Size guide
                                                    </button>
                                                </div>
                                                <div class="modal fade" id="sizeGuide" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">  
                                                    <div class="modal-dialog"> 
                                                        <div class="modal-content">
                                                            <div class="modal-header text-3xl">
                                                                Size Guide
                                                            </div>
                                                            <div class="modal-body w-full p-4">
                                                                <img src="images/suggestSize.jpg">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <fieldset class="mt-4">
                                                    <legend class="sr-only">Choose a size</legend>
                                                    <div class="grid grid-cols-4 gap-4 sm:grid-cols-8 lg:grid-cols-4">

                                                        <!-- Active: "ring-2 ring-indigo-500" -->
                                                        <c:if test="${size.contains('0')}">
                                                            <label onclick="toggleRing2(this)" class="group relative flex items-center justify-center rounded-md border py-3 px-4 text-sm font-medium uppercase hover:bg-gray-200 focus:outline-none sm:flex-1 sm:py-6 cursor-pointer bg-white text-gray-900 shadow-sm">
                                                                <input type="radio" name="size" value="0" class="sr-only" aria-labelledby="size-choice-2-label">
                                                                <span id="size-choice-2-label" class="z-10">S</span>
                                                                <!--
                                                                  Active: "border", Not Active: "border-2"
                                                                  Checked: "border-indigo-500", Not Checked: "border-transparent"
                                                                -->
                                                                <span class="size-background pointer-events-none absolute -inset-px rounded-md" aria-hidden="true"></span>
                                                            </label>
                                                        </c:if>
                                                        <!-- Active: "ring-2 ring-indigo-500" -->
                                                        <c:if test="${size.contains('1')}">
                                                            <label onclick="toggleRing2(this)" class="group relative flex items-center justify-center rounded-md border py-3 px-4 text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none sm:flex-1 sm:py-6 cursor-pointer bg-white text-gray-900 shadow-sm">
                                                                <input type="radio" name="size" value="1" class="sr-only" aria-labelledby="size-choice-3-label">
                                                                <span id="size-choice-3-label" class="z-10">M</span>
                                                                <!--
                                                                  Active: "border", Not Active: "border-2"
                                                                  Checked: "border-indigo-500", Not Checked: "border-transparent"
                                                                -->
                                                                <span class="size-background pointer-events-none absolute -inset-px rounded-md" aria-hidden="true"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${size.contains('2')}">
                                                            <!-- Active: "ring-2 ring-indigo-500" -->
                                                            <label onclick="toggleRing2(this)" class="group relative flex items-center justify-center rounded-md border py-3 px-4 text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none sm:flex-1 sm:py-6 cursor-pointer bg-white text-gray-900 shadow-sm">
                                                                <input type="radio" name="size" value="2" class="sr-only" aria-labelledby="size-choice-4-label">
                                                                <span id="size-choice-4-label" class="z-10">L</span>
                                                                <!--
                                                                  Active: "border", Not Active: "border-2"
                                                                  Checked: "border-indigo-500", Not Checked: "border-transparent"
                                                                -->
                                                                <span class="size-background pointer-events-none absolute -inset-px rounded-md" aria-hidden="true"></span>
                                                            </label>
                                                        </c:if>
                                                        <c:if test="${size.contains('3')}">
                                                            <!-- Active: "ring-2 ring-indigo-500" -->
                                                            <label onclick="toggleRing2(this)" class="group relative flex items-center justify-center rounded-md border py-3 px-4 text-sm font-medium uppercase hover:bg-gray-50 focus:outline-none sm:flex-1 sm:py-6 cursor-pointer bg-white text-gray-900 shadow-sm">
                                                                <input type="radio" name="size" value="3" class="sr-only" aria-labelledby="size-choice-5-label">
                                                                <span id="size-choice-5-label" class="z-10">XL</span>
                                                                <!--
                                                                  Active: "border", Not Active: "border-2"
                                                                  Checked: "border-indigo-500", Not Checked: "border-transparent"
                                                                -->
                                                                <span class="size-background pointer-events-none absolute -inset-px rounded-md" aria-hidden="true"></span>
                                                            </label>
                                                        </c:if>
                                                    </div>
                                                </fieldset>
                                            </div>

                                            <button type="submit" class="mt-10 flex w-full items-center justify-center rounded-md border border-transparent bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">Add to cart</button>
                                        </form>
                                    </div>
                                </div>

                                <!-- Product info -->
                                <div class=" mx-auto text-lg max-w-2xl px-4 pb-2 pt-10 sm:px-6 lg:max-w-7xl">
                                    <div class="lg:col-span-2 lg:border-r lg:border-gray-200 lg:pr-8 p-4">
                                        <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">Description</h1>
                                        <h5 class="px-3 font-bold tracking-tight text-gray-900 ">${proname}</h5>
                                    </div>

                                    <div class="px-4 lg:col-span-2 lg:col-start-1 lg:border-r lg:border-gray-200 lg:pb-16 lg:pr-8 lg:pt-6">
                                        <!-- Description and details -->
                                        <div>                                           
                                            <div class="px-4">
                                                <p class="text-lg text-gray-900">${description1_string1}</p>
                                            </div>
                                        </div>

                                        <div class="px-4">
                                            <h2 class="text-lg font-medium text-gray-900">Highlights: </h2>

                                            <div class="mt-4">
                                                <ul role="list" class="list-disc space-y-2 pl-4 text-md">
                                                    <li class="text-gray-400"><span class="text-gray-600">${description2_string1}</span></li>
                                                    <li class="text-gray-400"><span class="text-gray-600">${description2_string2}</span></li>
                                                    <li class="text-gray-400"><span class="text-gray-600">${description2_string3}</span></li>
                                                    <li class="text-gray-400"><span class="text-gray-600">${description2_string4}</span></li>

                                                </ul>


                                            </div>
                                        </div>

                                        <div class=" px-4">
                                            <h2 class="text-lg font-medium text-gray-900">More: </h2>

                                            <div class="mt-4 space-y-6">
                                                <ul role="list" class="list-disc space-y-2 pl-4 text-md">
                                                    <li class="text-gray-400"><span class="text-gray-600">${description3_string1}</span></li>
                                                    <li class="text-gray-400"><span class="text-gray-600">${description3_string2}</span></li>
                                                    <li class="text-gray-400"><span class="text-gray-600">${description3_string3}</span></li>
                                                    <li class="text-gray-400"><span class="text-gray-600">${description3_string4}</span></li>   
                                                    <li class="text-gray-400"><span class="text-gray-600">${description3_string5}</span></li>                          

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--Relative product-->
                                <div class="py-2 mx-auto text-lg max-w-2xl px-4 pb-16 sm:px-6 lg:max-w-7xl">
                                    <div class="lg:col-span-2 lg:border-r lg:border-gray-200 lg:pr-8 p-4">
                                        <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">       
                                            Relative 
                                        </h1>
                                        <div class=" grid grid-cols-4 gap-x-6 gap-y-10 sm:grid-cols-4 lg:grid-cols-4 xl:gap-x-8 xl:gap-y-8">
                                            <!--item-->
                                            <%
                                                ProductDAO productDAO = new ProductDAO();
                                                int pageNumber = 1;
                                                if (request.getParameter("page") != null) {
                                                    pageNumber = Integer.parseInt(request.getParameter("page"));
                                                    pageNumber = pageNumber == 0 ? 1 : pageNumber;
                                                }
                                                int pageSize = 4;
                                                List<Product> products = productDAO.getProductPageByCategory(pageNumber, pageSize, category);
                                                for (Product product : products) {
                                                    String valueSubmit = product.getId() + "" + product.getName() + "" + product.getPrice() + "" + product.getLink() + "" + product.getColor() + "_" + product.getSize();
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
                                                    <div class="mt-1">                                         
                                                        <form method="POST" action="cart">
                                                            <button type="submit" name="productName" value="<%= valueSubmit%>" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full">Add</button>
                                                        </form>
                                                    </div>                                                                              
                                                </div> 
                                            </div>
                                            <%    }
                                            %>
                                        </div> 
                                    </div>
                                    <div class="flex justify-center items-center ">
                                        <div class="border-2 border-black py-2 px-3 rounded-md">
                                            <a class="no-underline text-black" href="<%= linkHref%>">See more</a>
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
