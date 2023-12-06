<%-- 
    Document   : admin
    Created on : Jul 19, 2023, 12:39:44 PM
    Author     : ADMIN
--%>

<%@page import="com.hope.account.AccountDAO"%>
<%@page import="com.hope.Cart.ProductDAO"%>
<%@page import="com.hope.Cart.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.hope.Orders.OrderDAO"%>
<%@page import="com.hope.Orders.Order"%>
<%@page import="com.hope.account.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>HOPE'S SHOP</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </head>
    <body> 
        <%
            AccountDAO accountDAO = new AccountDAO();
            AccountDTO accountDTO = (AccountDTO) session.getAttribute("usersession");
            int user = accountDTO.getRole();
            if (user == 0) {
                response.sendRedirect("./index.jsp");
            }
        %>
        <div class="w-full min-h-[100vh] flex flex-shrink-0 antialiased bg-gray-50 text-gray-800">

            <div class="flex flex-col top-0 left-0 w-64 bg-white h-full border-r ">
                <div class="flex items-center justify-center h-20 border-b bg-gray-500">                
                    <img src="images/logo.jpg" class="h-16 mr-3 bg-gray-800 rounded-full" alt="Logo" />
                </div>
                <div>
                    <form action="admin" method="POST">
                        <ul class="flex flex-col py-4 space-y-1">

                            <li  class="px-5">
                                <div class="flex flex-row items-center h-8">
                                    <div class="text-sm font-light tracking-wide text-gray-500">Menu</div>
                                </div>
                            </li>

                            <li>
                                <button type="submit" name="action" value="dashboard" class="relative flex flex-row items-center h-11 w-full focus:outline-none hover:bg-blue-100 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                                    <span class="inline-flex justify-center items-center ml-4">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5"></path></svg>
                                    </span>
                                    <span class="ml-2 text-sm tracking-wide truncate">Dashboard</span>
                                </button>
                            </li>

                            <li>
                                <button type="submit" name="action" value="product" class="relative flex flex-row items-center h-11 w-full focus:outline-none hover:bg-blue-100 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                                    <span class="inline-flex justify-center items-center ml-4">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 10.5v6m3-3H9m4.06-7.19l-2.12-2.12a1.5 1.5 0 00-1.061-.44H4.5A2.25 2.25 0 002.25 6v12a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18V9a2.25 2.25 0 00-2.25-2.25h-5.379a1.5 1.5 0 01-1.06-.44z"></path></svg>                                </span>
                                    <span class="ml-2 text-sm tracking-wide truncate">Products</span>
                                </button>
                            </li>


                            <li>
                                <button type="submit" name="action" value="user" class="relative flex flex-row items-center h-11 w-full focus:outline-none hover:bg-blue-100 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                                    <span class="inline-flex justify-center items-center ml-4">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>                                </span>
                                    <span class="ml-2 text-sm tracking-wide truncate">Users</span>
                                </button>
                            </li>


                            <li>
                                <button type="submit" name="action" value="order" class="relative flex flex-row items-center h-11 w-full focus:outline-none hover:bg-blue-100 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                                    <span class="inline-flex justify-center items-center ml-4">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M11.35 3.836c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m8.9-4.414c.376.023.75.05 1.124.08 1.131.094 1.976 1.057 1.976 2.192V16.5A2.25 2.25 0 0118 18.75h-2.25m-7.5-10.5H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V18.75m-7.5-10.5h6.375c.621 0 1.125.504 1.125 1.125v9.375m-8.25-3l1.5 1.5 3-3.75"></path></svg>                                </span>
                                    <span class="ml-2 text-sm tracking-wide truncate">Orders</span>                              
                                </button>
                            </li>
                            <li>
                                <button type="submit" name="action" value="logout" class="relative flex flex-row items-center h-11 w-full focus:outline-none hover:bg-blue-100 text-gray-600 hover:text-gray-800 border-l-4 border-transparent hover:border-indigo-500 pr-6">
                                    <span class="inline-flex justify-center items-center ml-4">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 6H5.25A2.25 2.25 0 003 8.25v10.5A2.25 2.25 0 005.25 21h10.5A2.25 2.25 0 0018 18.75V10.5m-10.5 6L21 3m0 0h-5.25M21 3v5.25"></path></svg></span>
                                    <span class="ml-2 text-sm tracking-wide truncate">Logout</span>                              
                                </button>
                            </li>

                        </ul>
                    </form>
                </div>    
            </div>
            <div class="w-full bg-gray-200">
                <!-- if dashboard-->

                <c:if test="${show eq 'dashboard'}">
                    <div >
                        <% AccountDTO accountDTO_1 = (AccountDTO) session.getAttribute("usersession");%>
                        <c:set var="accountDTO_1" value="${sessionScope.usersession}" />
                        <div class="p-4 bg-white">
                            <h1>Admin / Dashboard</h1>
                        </div>

                        <div style="height: 100vh" class="m-4 p-4 bg-white border-2 border-white rounded-md">  
                            <p class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Welcome, ${accountDTO_1.name} !</p>
                            <h1  style="font-size: 2rem" class="text-gray-900 font-bold">Monthly Income: <%= accountDAO.getMonthlyIncome()%>$</h1>

                        </div>
                    </div>
                </c:if>
                <!--if users-->
                <c:if test="${show eq 'user'}">
                    <div>
                        <div class="p-4 bg-white">
                            <h1>Admin / Users</h1>
                        </div>
                        <div class="py-2 px-6">
                            <!-- Button trigger modal -->
                            <button type="button" class="" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                <a href="#" class="inline-flex items-center justify-center px-3 py-2 text-base font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-900">
                                    Create User
                                    <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                                    </svg>
                                </a>
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Create User</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form method="POST" action="createUser">
                                            <input hidden name="action" value="user">
                                            <input hidden name="feature" value="create">
                                            <div class="modal-body">
                                                <div class="mb-6">
                                                    <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your Account</label>
                                                    <input name="username" type="text" id="username" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Your account" required>
                                                </div>
                                                <div class="mb-6">
                                                    <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Full Name</label>
                                                    <input name="name" type="text" id="username" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Name" required>
                                                </div>
                                                <div class="mb-6">
                                                    <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone Number</label>
                                                    <input name="phone" onkeyup='checkPhoneNumber();' type="text" id="phone" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Phone" required>
                                                    <div id='message-phone' class="mt-4"></div>
                                                </div>
                                                <div class="mb-6">
                                                    <label for="role" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Role</label>
                                                    <select name="role">
                                                        <option name="role" value="0">User</option>
                                                        <option name="role" value="1">Admin</option>
                                                    </select>
                                                </div>
                                                <div class="mb-6">
                                                    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your password</label>
                                                    <input name="password" type="password" id="password" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                </div>
                                                <div class="mb-6">
                                                    <label for="confirmPassword" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Repeat password</label>
                                                    <input type="password" onkeyup='check();' id="confirmPassword" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                </div>
                                                <div id='message' class="mt-4"></div>
                                                <%! String err;
                                                %>
                                                <div class="text-sm text-red-800 py-2 mx-2 my-2">
                                                    <% err = (String) request.getAttribute("error");
                                                        if (err != null) {
                                                            out.print("<div>" + err + "</div");
                                                        }%>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="text-white bg-gray-700 hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-gray-600 dark:hover:bg-gray-700 dark:focus:ring-blue-800" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Create</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-2 p-4 bg-white border-2 border-white rounded-md">

                            <div class="flex flex-col min-h-full p-6">
                                <%;
                                    List<AccountDTO> accounts = accountDAO.getAllAccount();
                                    if (!accounts.isEmpty()) {
                                %>

                                <div class="flex justify-center">

                                    <table class="w-full text-center text-sm font-light border-2 ">
                                        <thead class="border-b font-medium dark:border-neutral-500 uppercase whitespace-nowrap bg-blue-300">
                                            <tr>                                               
                                                <th class="px-1 py-3">User's Account</th>
                                                <th class="px-1 py-3">User's Full Name</th>
                                                <th class="px-1 py-3">Phone number</th>
                                                <th class="px-1 py-3">Total Bill</th>
                                                <th class="px-1 py-3">Role</th>
                                                <th class="px-1 py-3">Action</th>                                              
                                            </tr>
                                        </thead>
                                        <tbody>   
                                            <%
                                                for (AccountDTO account : accounts) {
                                                    String username = (String) account.getUsername();
                                            %>
                                            <tr class="border-b dark:border-neutral-500">
                                                <td class="whitespace-nowrap px-6 py-4"><%= account.getUsername()%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= account.getName()%></td>                                                
                                                <td class="whitespace-nowrap px-6 py-4"><%= account.getPhoneNumber()%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= account.getTotalbill()%>$</td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= account.getRole() == 1 ? "admin" : "user"%></td>     
                                                <td class="whitespace-nowrap px-6 py-4">
                                                    <div class="flex w-full h-auto justify-center items-center">
                                                        <form class="w-1/2 p-2" action="deleteAccount" method="POST">
                                                            <input hidden name="delusername" value="<%= account.getUsername()%>">
                                                            <button type="submit">
                                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"></path>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                        <form class="w-1/2 p-2" action="editAccount" method="POST">
                                                            <input hidden name="editusername" value="<%= account.getUsername()%>">
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="w-1/2 p-2" data-bs-toggle="modal" data-bs-target="#exampleModal2_<%= account.getUsername()%>">
                                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"></path>
                                                                </svg>
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="exampleModal2_<%= account.getUsername()%>" tabindex= "-1" aria-labelledby="#exampleModal2" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="EditAccountLabel">Edit Account</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <div class="mb-6">
                                                                                <label for="editusername" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your Account</label>
                                                                                <input readonly="" value="<%= account.getUsername()%>" name="editusername" type="text" id="editusername" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Your account" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Full Name</label>
                                                                                <input name="name" value="<%= account.getName()%>" type="text" id="fullname" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Name" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone Number</label>
                                                                                <input name="phone" value="<%= account.getPhoneNumber()%>" onkeyup='checkPhoneNumber();' type="text" id="phone" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="Phone" required>
                                                                                <div id='message-phone' class="mt-4"></div>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="role" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Role</label>
                                                                                <select name="role">
                                                                                    <option name="role" value="0">User</option>
                                                                                    <option name="role" value="1">Admin</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your password</label>
                                                                                <input name="password" type="password" id="password" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="confirmPassword" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Repeat password</label>
                                                                                <input type="password" onkeyup='check();' id="confirmPassword" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>
                                                                            <div id='message' class="mt-4"></div>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="text-white bg-gray-700 hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-gray-600 dark:hover:bg-gray-700 dark:focus:ring-blue-800" data-bs-dismiss="modal">Close</button>
                                                                            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Save</button>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% }
                                                }%>                                          
                                        </tbody>
                                    </table>

                                </div>
                            </div>

                        </div>
                    </div>
                </c:if>

                <!--if product-->
                <c:if test="${show eq 'product'}">
                    <div>
                        <div class="p-4 bg-white">
                            <h1>Admin / Products</h1>
                        </div>

                        <!-- Button trigger modal -->
                        <button type="button" class="" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <div class="p-2">
                                <a href="#" class="inline-flex items-center justify-center px-3 py-2 text-base font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-900">
                                    Add product
                                    <svg class="w-3.5 h-3.5 ml-2" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 10">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
                                    </svg>
                                </a>
                            </div>
                        </button>


                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form action="addProduct" method="POST">                                
                                        <div class="modal-body">

                                            <div class="mb-6">
                                                <label for="productid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product ID</label>
                                                <input type="text" name="productid" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="NXX with XX is number" required>
                                            </div>
                                            <div class="mb-6">
                                                <label for="productname" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Name</label>
                                                <input type="text" name="productname" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                            </div>
                                            <div class="mb-6">
                                                <label for="size" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Size</label>
                                                S  <input type="checkbox" name="size[]" value="0"> 
                                                M  <input type="checkbox" name="size[]" value="1"> 
                                                L  <input type="checkbox" name="size[]" value="2"> 
                                                XL  <input type="checkbox" name="size[]" value="3"> 
                                            </div>
                                            <div class="mb-6">
                                                <label for="color" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Color</label>
                                                <div class="flex items-center justify-between ">
                                                    <div class="w-5 h-5 bg-black" style="border: 1px solid black; display:inline-block;"></div>  <input type="checkbox" name="color[]" value="0"> 
                                                    <div class="w-5 h-5 bg-gray-100" style="border: 1px solid black; display:inline-block;"></div> <input type="checkbox" name="color[]" value="1"> 
                                                    <div class="w-5 h-5 bg-blue-300" style="border: 1px solid black; display:inline-block;"></div>  <input type="checkbox" name="color[]" value="2"> 
                                                    <div class="w-5 h-5 bg-green-700" style="border: 1px solid black; display:inline-block;"></div>  <input type="checkbox" name="color[]" value="3"> 
                                                    <div class="w-5 h-5 bg-yellow-400" style="border: 1px solid black; display:inline-block;"></div>  <input type="checkbox" name="color[]" value="4"> 
                                                    <div class="w-5 h-5 bg-amber-700" style="border: 1px solid black; display:inline-block;"></div>  <input type="checkbox" name="color[]" value="5"> 
                                                    <div class="w-5 h-5 bg-gray-800" style="border: 1px solid black; display:inline-block;"></div>  <input type="checkbox" name="color[]" value="6"> 
                                                </div>
                                            </div>
                                            <div class="mb-6">
                                                <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                                                <input type="number" name="price" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                            </div>
                                            <div class="mb-6">
                                                <label for="imagelink" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Image</label>
                                                <input type="text" name="imagelink" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                            </div>
                                            <div class="mb-6">
                                                <label for="categoryid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Category ID</label>
                                                <input type="text" name="categoryid" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required placeholder="M: male W: female U: unisex            ">
                                            </div>
                                            <div class="mb-6">
                                                <label for="description1" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description 1</label>
                                                <input type="text" name="description1" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                            </div>
                                            <div class="mb-6">
                                                <label for="description2" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description 2</label>
                                                <input type="text" name="description2" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                            </div>
                                            <div class="mb-6">
                                                <label for="description3" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description 3</label>
                                                <input type="text" name="description3" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                            </div>

                                        </div>


                                        <div class="modal-footer">
                                            <button type="button" class="btn" style="background-color: antiquewhite; font-weight: bold " data-bs-dismiss="modal">Close</button>  
                                            <button type="submit"  class="btn" style="background-color: teal; font-weight: bold ">Add</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> 

                        <div class="m-2 p-4 bg-white border-2 border-white rounded-md">
                            <!--                            <form method="POST" action="#" class="flex items-center">   
                                                            <label for="simple-search" class="sr-only">Search</label>
                                                            <div class="relative w-[50%]">
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
                                                        <div style="margin: 0.2rem 0">
                                                            <span>Show </span>
                                                            <select style="display: inline" name="color" required="" class="rounded-md w-[5%] p-1">                            
                                                                <option value="5">5</option>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                            </select>
                                                            <span> entries </span>
                                                        </div>-->

                            <div class="flex flex-col min-h-full p-6">
                                <% ProductDAO productDAO = new ProductDAO();
                                    List<Product> products = productDAO.getAllProduct();
                                    if (!products.isEmpty()) {
                                %>

                                <div class="flex justify-center">

                                    <table class="w-full text-center text-sm font-light border-2 ">
                                        <thead class="border-b font-medium dark:border-neutral-500 uppercase whitespace-nowrap bg-blue-300">
                                            <tr>
                                                <th class="px-3 py-3">Product Id</th>
                                                <th class="px-3 py-3">Product's Name</th>
                                                <th class="px-3 py-3">Image</th>
                                                <th class="px-3 py-3">Size</th>
                                                <th class="px-3 py-3">Color</th>
                                                <th class="px-3 py-3">Price</th>   
                                                <th class="px-1 py-3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>   
                                            <% String displaySize;
                                                String displayColor;
                                                for (Product product : products) {
                                                    displaySize = "";
                                                    String sizeList = product.getSize();
                                                    if (sizeList.isEmpty()) {
                                                        displaySize = "This product has no size choice";
                                                    } else {
                                                        if (sizeList.contains("0")) {
                                                            displaySize += "S" + "  ";
                                                        }
                                                        if (sizeList.contains("1")) {
                                                            displaySize += "M" + "  ";
                                                        }
                                                        if (sizeList.contains("2")) {
                                                            displaySize += "L" + "  ";
                                                        }
                                                        if (sizeList.contains("3")) {
                                                            displaySize += "XL" + "  ";
                                                        }
                                                        if (!sizeList.contains("0") && !sizeList.contains("1") && !sizeList.contains("2") && !sizeList.contains("3")) {
                                                            displaySize += "Unknow Size";
                                                        }

                                                    }
                                                    displayColor = "";
                                                    String colorList = product.getColor();
                                                    if (colorList.isEmpty()) {
                                                        displayColor = "This product has no color choice";
                                                    } else {
                                                        if (colorList.contains("0")) {
                                                            displayColor += "Black" + "  ";
                                                        }
                                                        if (colorList.contains("1")) {
                                                            displayColor += "White" + "  ";
                                                        }
                                                        if (colorList.contains("2")) {
                                                            displayColor += "Blue" + "  ";
                                                        }
                                                        if (colorList.contains("3")) {
                                                            displayColor += "Green" + "  ";
                                                        }
                                                        if (colorList.contains("4")) {
                                                            displayColor += "Yellow" + "  ";
                                                        }
                                                        if (colorList.contains("5")) {
                                                            displayColor += "Brown" + "  ";
                                                        }
                                                        if (colorList.contains("6")) {
                                                            displayColor += "Gray" + "  ";
                                                        }
                                                        if (!colorList.contains("0") && !colorList.contains("1") && !colorList.contains("2") && !colorList.contains("3")
                                                                && !colorList.contains("4") && !colorList.contains("5") && !colorList.contains("6")) {
                                                            displayColor += "Unknow Color";
                                                        }

                                                    }

                                            %>
                                            <tr class="border-b dark:border-neutral-500">
                                                <td class="whitespace-nowrap px-6 py-4"><%= product.getId()%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= product.getName()%></td>
                                                <td class="whitespace-nowrap px-6 py-4 flex items-center justify-center">
                                                    <img src="<%= product.getLink()%>" style="max-height: 80px; max-width: 80px; min-height: 80px; min-width: 80px" class="flex justify-center items-center" alt="se n dd o de">
                                                </td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= displaySize%></td>
                                                <td class="whitespace-nowrap px-6 py-4">  <%= displayColor%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= product.getPrice()%>$</td>    
                                                <td class="whitespace-nowrap px-6 py-4">
                                                    <div class="flex w-full h-auto">
                                                        <form class="w-1/2 p-2" action="deleteProduct" method="POST">
                                                            <input hidden name="delid" value="<%= product.getId()%>">
                                                            <button type="submit">
                                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"></path>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                        <form class="w-1/2 p-2" action="editProduct" method="POST">
                                                            <!-- Button trigger modal -->
                                                            <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"></path>
                                                                </svg>
                                                            </button>

                                                            <!-- Modal -->
                                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="staticBackdropLabel">Edit product</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="mb-6">
                                                                                <label for="productid" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Product ID</label>
                                                                                <input type="text" value="<%= product.getId()%>" readonly name="productid" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="NXX with XX is number" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="productname" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Product Name</label>
                                                                                <input type="text" value="<%= product.getName()%>" name="productname" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="price" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                                                                                <input type="number"value="<%= product.getPrice()%>" name="price" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="imagelink" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Image</label>
                                                                                <input type="text" value="<%= product.getLink()%>" name="imagelink" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>    
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn" style="background-color: antiquewhite; font-weight: bold " data-bs-dismiss="modal">Close</button>  
                                                                            <button type="submit"  class="btn" style="background-color: teal; font-weight: bold ">Save</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>

                                                    </div>
                                                </td>
                                            </tr>
                                            <% }
                                                }%>                                          
                                        </tbody>
                                    </table>

                                </div>
                            </div>


                        </div>
                    </div>
                </c:if>
                <c:if test="${show eq 'order'}">
                    <div>
                        <div class="p-4 bg-white">
                            <h1>Admin / Orders</h1>
                        </div>
                        <div class="m-2 p-2 bg-white border-2 border-white rounded-md">
                            <div class="flex flex-row w-full justify-between items-center px-8">
                                <div> 

                                </div>
                                <div class="p-4">
                                    <form id="pageSizeForm" action="admin" method="GET">
                                        <span>Show </span>
                                        <select required="" class="rounded-md min-w-[50px] p-1" name="pageSize" onchange="this.form.submit()">
                                            <!-- onchange="this.form.submit()" will trigger form submission when an option is selected -->
                                            <option value="5" <%= (request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("5")) ? "selected" : ""%>>5</option>
                                            <option value="10" <%= (request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("10")) ? "selected" : ""%>>10</option>
                                            <option value="15" <%= (request.getParameter("pageSize") != null && request.getParameter("pageSize").equals("15")) ? "selected" : ""%>>15</option>
                                        </select>
                                        <span> entries </span>
                                        <input hidden name="action" value="order">
                                    </form>
                                </div>
                            </div>

                            <div class="flex flex-col min-h-full p-6">
                                <% OrderDAO orderDAO = new OrderDAO();
                                    int pageNumber = 1;
                                    if (request.getParameter("pagination") != null) {
                                        pageNumber = Integer.parseInt(request.getParameter("pagination"));
                                        pageNumber = pageNumber == 0 ? 1 : pageNumber;
                                    }
                                    int pageSize = 5;
                                    int size = 1;
                                    if (request.getParameter("pageSize") != null) {
                                        pageSize = Integer.parseInt(request.getParameter("pageSize"));
                                    }
                                    List<Order> orders = orderDAO.getAllOrderByPage(pageNumber, pageSize);
                                    if (!orders.isEmpty()) {
                                %>
                                <div class="flex justify-center">

                                    <table class="w-full text-center text-sm font-light border-2 ">
                                        <thead class="border-b font-medium dark:border-neutral-500 uppercase whitespace-nowrap bg-blue-300">
                                            <tr>
                                                <th class="px-3 py-3">Order Id</th>
                                                <th class="px-3 py-3">Quantity</th>
                                                <th class="px-3 py-3">price</th>
                                                <th class="px-3 py-3">Total Price</th>
                                                <th class="px-3 py-3">Phone number</th>
                                                <th class="px-3 py-3">Address</th>
                                                <th class="px-3 py-3">Product Id</th>
                                                <th class="px-3 py-3">Full Name</th>
                                                <th class="px-3 py-3">Size</th>
                                                <th class="px-3 py-3">Color</th>
                                                <th class="px-3 py-3">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>   
                                            <%
                                                for (Order order : orders) {
                                                    size++;
                                            %>
                                            <tr class="border-b dark:border-neutral-500">
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getId()%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getQuantity()%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getPrice()%>$</td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getQuantity() * order.getPrice()%>$</td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getPhone()%></td>
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getAddress()%></td>             
                                                <td class="whitespace-nowrap px-6 py-4"><%= order.getProductid()%></td>
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
                                                <td class="whitespace-nowrap px-6 py-4">     
                                                    <div class="flex w-full h-auto">
                                                        <form class="w-1/2 p-2" action="deleteOrder" method="POST">
                                                            <input hidden name="delid" value="<%= order.getId()%>">
                                                            <button type="submit">
                                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"></path>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                        <form class="w-1/2 p-2" action="editOrder" method="POST">
                                                            <!-- Button trigger modal -->
                                                            <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125"></path>
                                                                </svg>
                                                            </button>
                                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="staticBackdropLabel">Edit Order</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="mb-6">
                                                                                <label for="orderid" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Order ID</label>
                                                                                <input type="text" value="<%= order.getId()%>" readonly name="orderid" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="NXX with XX is number" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="quantity" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Quantity</label>
                                                                                <input type="text" value="<%= order.getQuantity()%>" name="quantity" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="price" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                                                                                <input type="number"value="<%= order.getPrice()%>" name="price" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>
                                                                            <div class="mb-6">
                                                                                <label for="phonenumber" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone number</label>
                                                                                <input type="text" value="<%= order.getPhone()%>" name="phonenumber" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>    
                                                                            <div class="mb-6">
                                                                                <label for="address" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
                                                                                <input type="text" value="<%= order.getAddress()%>" name="address" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>    
                                                                            <div class="mb-6">
                                                                                <label for="fullname" class="flex mb-2 text-sm font-medium text-gray-900 dark:text-white">Full Name</label>
                                                                                <input type="text" value="<%= order.getFullname()%>" name="fullname" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required>
                                                                            </div>    
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn" style="background-color: antiquewhite; font-weight: bold " data-bs-dismiss="modal">Close</button>  
                                                                            <button type="submit"  class="btn" style="background-color: teal; font-weight: bold ">Save</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                            <% }
                                                }%>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        int currentPage = 1; // The current page number
                        int totalRecords = orderDAO.getTotalRow(); // The total number of products (assuming 100 in this example)
                        int totalPages = (int) Math.ceil((double) totalRecords / pageSize); // Calculate the total number of pages

                        // Retrieve the list of products for the current page
                    %>
                    <!-- Render pagination controls -->
                    <div class="text-blue-500 transition-colors p-2 mt-2 flex justify-center ">
                        <% for (int i = 1; i <= totalPages; i++) {%>
                        <form method="POST">
                            <input value="<%=i%>" name="pagination" hidden>
                            <input value="order" name="action" hidden>
                            <button class="p-2 no-underline"><%= i%></button>
                        </form>
                        <% }%>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</body>
</html>
