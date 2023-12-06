<%-- 
    Document   : header-top1
    Created on : Jun 27, 2023, 2:35:49 PM
    Author     : dinhg
--%>

<%@page import="com.hope.Cart.Product"%>
<%@page import="com.hope.Cart.Cart"%>
<%@page import="com.hope.account.AccountDTO"%>
<%@page import="com.hope.account.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/index.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <script>
        /* When the user clicks on the button,
         toggle between hiding and showing the dropdown content */
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

// Close the dropdown menu if the user clicks outside of it
        window.onClick = function (event) {
            if (!event.target.matches('.dropbtn-1')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>

    <nav class="bg-gray-800">
        <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
            <div class="relative flex h-16 items-center justify-between">
                <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                    <!-- Mobile menu button-->
                    <button type="button" class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <!--
                          Icon when menu is closed.
              
                          Menu open: "hidden", Menu closed: "block"
                        -->
                        <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                        </svg>
                        <!--
                          Icon when menu is open.
              
                          Menu open: "block", Menu closed: "hidden"
                        -->
                        <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
                    <div class="flex flex-shrink-0 items-center">
                        <img src="images/logo.png"  alt="Your Company" class="bg-transparent h-8 w-auto"/>
                    </div>
                    <div class=" sm:ml-6 sm:block">
                        <div class="flex space-x-4">
                            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                            <a href="./index.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-md font-medium hover:underline no-underline">Home</a>
                            <a href="./productPage.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-md font-medium hover:underline no-underline">Product</a>
                            <!--<a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-md font-medium hover:underline no-underline">Feedback</a>-->
                        </div>
                    </div>
                </div>
                <div>
                    <form method="POST" action="./search.jsp" class="flex items-center">   
                        <label for="simple-search" class="sr-only">Search</label>
                        <div class="relative w-full">
                            <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input type="text" name="search" id="simple-search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search" required>
                        </div>
                        <button type="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-blue-700 rounded-lg border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                            <span class="sr-only">Search</span>
                        </button>
                    </form>
                </div>
                <div class="inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0" onClick="openModal()">
                    <!--                    <button  id="cart" class="rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                                            <span class="sr-only">Cart</span>
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                                            </svg>
                                        </button>-->
                    <button type="button" class="rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z" />
                        </svg>
                    </button>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" style="max-width: 70vw">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Shopping Cart</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body w-full">
                                    <%
                                        Cart cart = (Cart) session.getAttribute("CART");
                                        if (cart != null) {
                                            if (cart.getCart().size() > 0) {

                                    %>
                                    <table border="1" class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                            <tr>
                                                <th class="px-3 py-3">No</th>
                                                <th class="px-3 py-3">Images</th>
                                                <th class="px-3 py-3">ID</th>
                                                <th class="px-3 py-3">Name</th>
                                                <th class="px-3 py-3">Price</th>
                                                <th class="px-3 py-3">Color</th>
                                                <th class="px-3 py-3">Size</th>
                                                <th class="px-3 py-3">Quantity</th>
                                                <th class="px-3 py-3">Remove</th>
                                                <th class="px-3 py-3">Total</th>
                                                <th class="px-3 py-3">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <%                    int count = 1;
                                                double total = 0;
                                                for (Product product : cart.getCart().values()) {
                                                    total += product.getPrice() * product.getQuantity();
                                            %>
                                        <form action="MainController" method="POST">
                                            <tr class="border">
                                                <td class="px-3 py-3"><%= count++%></td>
                                                <td class="px-3 py-3">
                                                    <img src="<%= product.getLink()%>" style="max-height: 60px; max-width: 60px; min-height: 60px; min-width: 60px" class="flex justify-center items-center" alt="se n dd o de">
                                                </td>
                                                <td class="px-3 py-3" ><input name="id" value="<%= product.getId()%>" class="max-w-[70px]" readonly=""></td>
                                                <td class="px-3 py-3"><%= product.getName()%></td>
                                                <td class="px-3 py-3"><%= product.getPrice()%></td>
                                                <td class="px-3 py-3">
                                                    <select name="color" required="" class="rounded-md w-full">
                                                        <% if (product.getColor().contains("0")) { %>
                                                        <option value="0" <% if (product.getCurrentColor().equals("0")) { %>selected<% } %>>Black</option>
                                                        <% } %>
                                                        <% if (product.getColor().contains("1")) { %>
                                                        <option value="1"  <% if (product.getCurrentColor().equals("1")) { %>selected<% } %>>White</option>
                                                        <% } %>
                                                        <% if (product.getColor().contains("2")) { %>
                                                        <option value="2"  <% if (product.getCurrentColor().equals("2")) { %>selected<% } %>>Blue</option>
                                                        <% } %>
                                                        <% if (product.getColor().contains("3")) { %>
                                                        <option value="3" <% if (product.getCurrentColor().equals("3")) { %>selected<% } %>>Green</option>
                                                        <% } %>
                                                        <% if (product.getColor().contains("4")) { %>
                                                        <option value="4" <% if (product.getCurrentColor().equals("4")) { %>selected<% } %>>Yellow</option>
                                                        <% } %>
                                                        <% if (product.getColor().contains("5")) { %>
                                                        <option value="5" <% if (product.getCurrentColor().equals("5")) { %>selected<% } %>>Brown</option>
                                                        <% } %>
                                                        <% if (product.getColor().contains("6")) { %>
                                                        <option value="6" <% if (product.getCurrentColor().equals("6")) { %>selected<% } %>>Gray</option>
                                                        <% }%>
                                                    </select>

                                                </td>
                                                <td class="px-3 py-3">
                                                    <select name="size" required="" class="rounded-md w-full">
                                                        <% if (product.getSize().contains("0")) { %>
                                                        <option value="0" <% if (product.getCurrentSize().equals("0")) { %>selected<% } %>>S</option>
                                                        <% } %>
                                                        <% if (product.getSize().contains("1")) { %>
                                                        <option value="1" <% if (product.getCurrentSize().equals("1")) { %>selected<% } %>>M</option>
                                                        <% } %>
                                                        <% if (product.getSize().contains("2")) { %>
                                                        <option value="2" <% if (product.getCurrentSize().equals("2")) { %>selected<% } %>>L</option>
                                                        <% } %>
                                                        <% if (product.getSize().contains("3")) { %>
                                                        <option value="3" <% if (product.getCurrentSize().equals("3")) { %>selected<% } %>>XL</option>
                                                        <% }%>                                                 
                                                    </select>
                                                </td>
                                                <td class="px-3 py-3">
                                                    <input type="number" value="<%= product.getQuantity()%>" class="max-w-[70px] rounded-md" min="1" name="quantity" required=""/>
                                                </td>

                                                <td class="px-3 py-3">
                                                    <input type="submit" name="action" value="Remove"/>
                                                </td>
                                                <td class="px-3 py-3"><%= product.getPrice() * product.getQuantity()%></td>
                                                <td class="px-3 py-3">
                                                    <button type="submit" name="action" value="Edit" class="bg-blue-300 rounded-lg whitespace-nowrap py-2 px-3">Save change</button>
                                                </td>
                                            </tr>
                                        </form>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>

                                    <h2> Total: <%= total%>$ </h2>

                                    <%
                                    } else {
                                    %>
                                    <div class="text-xl text-red-500 xl:text-2xl font-semibold leading-6 text-gray-800">Cart is empty</div>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <div class="text-xl text-red-500 xl:text-2xl font-semibold leading-6 text-gray-800">Cart is empty</div>
                                    <%}%>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary"><a href="./checkout.jsp" class="text-white no-underline">Order</a></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Profile dropdown -->

                <div class="relative ml-3" onClick="myFunction()" >
                    <div class="dropbtn w-6 h-6">                           
                        <svg fill="none" stroke="currentColor" stroke-width="1.5" class="h-6 w-6 absolute top-1 right-0 dropbtn-1"viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg>
                    </div>
                    <div id="myDropdown" class="dropdown-content right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                        <%
                            if (session == null || session.getAttribute("usersession") == null) {
                                // User is not logged in
                        %>
                        <a href="login.jsp">Login</a>
                        <%
                        } else {
                            // User is logged in
                        %>
                        <a href="${pageContext.request.contextPath}/login?action=logout">Logout</a>
                        <a href="./profile.jsp">Profile</a>
                        <a href="./order.jsp">Orders History</a>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>

    </nav>
</html>
