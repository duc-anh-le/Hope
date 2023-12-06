/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.Controller;

import com.hope.Cart.Cart;
import com.hope.Cart.Product;
import com.hope.account.AccountDTO;
import com.hope.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");
        if (session != null && session.getAttribute("usersession") != null && cart != null && cart.getCart().size() > 0) {
            String username = ((AccountDTO) session.getAttribute("usersession")).getUsername();
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String fullname = request.getParameter("name");
            double total=0;
            

           

            // Insert into the orders table
            String sql = "INSERT INTO orders (productid, username, quantity, address, phonenumber, price, totalprice, fullname, size, color) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try {
                Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
               
                // Iterate over the products in the cart and insert their details into the orders table
                for (Product product : cart.getCart().values()) {
                    total = 0;
                    total += product.getPrice() * product.getQuantity();
                    ps.setString(1, product.getId());
                    ps.setString(2, username);
                    ps.setInt(3, product.getQuantity());
                    ps.setString(4, address);
                    ps.setString(5, phoneNumber);
                    ps.setDouble(6, product.getPrice());
                    ps.setDouble(7, total);
                    ps.setString(8, fullname);
                    ps.setString(9, product.getCurrentSize());
                    ps.setString(10, product.getCurrentColor());
                    ps.executeUpdate();
                }

            } catch (SQLException ex) {
                // Handle the exception appropriately (e.g., log the error or display an error message)
                ex.printStackTrace();
            }

            // Clear the cart after successful order submission
            cart.clearCart();
            RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
            request.setAttribute("thanks", "Thanks for shopping, we will contact you soon!");
            rd.forward(request, response);
        } else {
            response.sendRedirect("checkout.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

//        response.setContentType("text/html;charset=UTF-8");
//        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("CART");
////        try (PrintWriter out = response.getWriter()) {
////            /* TODO output your page here. You may use following sample code. */
////            out.println("<!DOCTYPE html>");
////            out.println("<html>");
////            out.println("<head>");
////            out.println("<title>Order</title>");
////            out.println("</head>");
////            out.println("<body>");
////            out.println("<h1>Servlet order at " + request.getContextPath() + "</h1>");
//            if (session != null && session.getAttribute("usersession") != null && cart != null && cart.getCart().size() > 0) {
//                String username = ((AccountDTO) session.getAttribute("usersession")).getUsername();
//                String address = request.getParameter("address");
//                String phoneNumber = request.getParameter("phoneNumber");
//                String fullname = request.getParameter("name");
//
//                double total = 0.0;
//
//                // Iterate over the products in the cart to calculate the total
//                for (Product product : cart.getCart().values()) {
//                    total += product.getPrice() * product.getQuantity();
//                }
//
//                // Insert into the orders table
//                String sql = "INSERT INTO orders (productid, username, quantity, address, phonenumber, price, totalprice, fullname) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//                try {
//                    Connection conn = DBUtils.getConnection();
//                    PreparedStatement ps = conn.prepareStatement(sql);
//
//                    // Iterate over the products in the cart and insert their details into the orders table
//                    for (Product product : cart.getCart().values()) {
////                        out.println("Productid: " + product.getId());
////                        out.println("Productquatity: " + product.getQuantity());
////                        out.println("Productprice: " + product.getPrice());
////                        out.println("Username: " + username);
////                        out.println("address: " + address);
////                        out.println("phoneNumber: " + phoneNumber);
////                        out.println("fullname: " + fullname);
//                        ps.setString(1, product.getId());
//                        ps.setString(2, username);
//                        ps.setInt(3, product.getQuantity());
//                        ps.setString(4, address);
//                        ps.setString(5, phoneNumber);
//                        ps.setDouble(6, product.getPrice());
//                        ps.setDouble(7, total);
//                        ps.setString(8, fullname);
//                        ps.executeUpdate();
//                    }
//
//                } catch (SQLException ex) {
//                    // Handle the exception appropriately (e.g., log the error or display an error message)
//                    ex.printStackTrace();
//                }
//
//                // Clear the cart after successful order submission
////            cart.clearCart();
////            response.sendRedirect("checkout.jsp");
//            }
//
////            out.println("</body>");
////            out.println("</html>");
////        }
////        if (session != null && session.getAttribute("usersession") != null && cart != null && cart.getCart().size() > 0) {
////            String username = ((AccountDTO) session.getAttribute("usersession")).getUsername();
////            String address = request.getParameter("address");
////            String phoneNumber = request.getParameter("phoneNumer");
////            String fullname = request.getParameter("name");
////
////            double total = 0.0;
////
////            // Iterate over the products in the cart to calculate the total
////            for (Product product : cart.getCart().values()) {
////                total += product.getPrice() * product.getQuantity();
////            }
////
////            // Insert into the orders table
////            String sql = "INSERT INTO orders (productid, username, quantity, address, phonenumber, price, totalprice, fullname) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
////            try {
////                Connection conn = DBUtils.getConnection();
////                PreparedStatement ps = conn.prepareStatement(sql);
////
////                // Iterate over the products in the cart and insert their details into the orders table
////                for (Product product : cart.getCart().values()) {
////                    ps.setString(1, product.getId());
////                    ps.setString(2, username);
////                    ps.setInt(3, product.getQuantity());
////                    ps.setString(4, address);
////                    ps.setString(5, phoneNumber);
////                    ps.setDouble(6, product.getPrice());
////                    ps.setDouble(7, total);
////                    ps.setString(8, fullname);
////                    ps.executeUpdate();                    
////                }
////
////            } catch (SQLException ex) {
////                // Handle the exception appropriately (e.g., log the error or display an error message)
////                ex.printStackTrace();
////            }
////
////            // Clear the cart after successful order submission
//////            cart.clearCart();
//////            response.sendRedirect("checkout.jsp");
////        }
