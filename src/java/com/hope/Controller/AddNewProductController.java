package com.hope.Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.hope.Cart.ProductDAO;
import com.hope.utils.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/addProduct"})
public class AddNewProductController extends HttpServlet {

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

        ProductDAO productDAO = new ProductDAO();
        String productid = request.getParameter("productid");
        String productname = request.getParameter("productname");

        String[] selectedSizes = request.getParameterValues("size[]");
        String sizelist="";
        // Kiểm tra nếu selectedSizes không null và có chứa dữ liệu
        if (selectedSizes != null && selectedSizes.length > 0) {
            // Lặp qua mảng selectedSizes để thực hiện các xử lý cần thiết
            for (String size : selectedSizes) {
                sizelist += size;
            }
        }

        String[] selectedColors = request.getParameterValues("color[]");
        String colorlist="";
        if (selectedColors != null && selectedColors.length > 0) {
            // Lặp qua mảng selectedSizes để thực hiện các xử lý cần thiết
            for (String color : selectedColors) {
                colorlist += color;
            }
        }

        double price = Double.parseDouble(request.getParameter("price"));
        String imagelink = request.getParameter("imagelink");
        String categoryid = request.getParameter("categoryid");
        String description1 = request.getParameter("description1");
        String description2 = request.getParameter("description2");
        String description3 = request.getParameter("description3");

//        productDAO.addProduct(productid, productname, size, color, 100, imagelink, categoryid, description1, description2, description3);
        productDAO.addProduct(productid, productname, sizelist, colorlist, 100, imagelink, categoryid, description1, description2, description3);
        response.sendRedirect("admin.jsp");
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
