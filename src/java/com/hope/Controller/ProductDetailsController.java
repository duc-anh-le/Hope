/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductDetailsController", urlPatterns = {"/productDetails"})
public class ProductDetailsController extends HttpServlet {

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
        String productStr = request.getParameter("productName");
        String tmp[] = productStr.split("_");
        String id = tmp[0];
        String name = tmp[1];
        double price = Double.parseDouble(tmp[2]);
        String link = tmp[3];
        String color = tmp[4];
        String size = tmp[5];
        String des1 = tmp[6];
        String des2 = tmp[7];
        String des3 = tmp[8];
        String[] description1 = tmp[6].split("/");
        String[] description2 = tmp[7].split("/");
        String[] description3 = tmp[8].split("/");
        RequestDispatcher rd = request.getRequestDispatcher("productDetails.jsp");
        request.setAttribute("id", id);
        request.setAttribute("proname", name);
        request.setAttribute("price", price);
        request.setAttribute("link", link);
        request.setAttribute("color", color);
        request.setAttribute("size", size);

//        request.setAttribute("des1", des1);
//        request.setAttribute("des2", des2);
//        request.setAttribute("des3", des3);
        request.setAttribute("description1_string1", description1[1]);

        request.setAttribute("description2_string1", description2[1]);
        request.setAttribute("description2_string2", description2[2]);
        request.setAttribute("description2_string3", description2[3]);
        request.setAttribute("description2_string4", description2[4]);

        request.setAttribute("description3_string1", description3[1]);
        request.setAttribute("description3_string2", description3[2]);
        request.setAttribute("description3_string3", description3[3]);
        request.setAttribute("description3_string4", description3[4]);
        request.setAttribute("description3_string5", description3[5]);


        rd.forward(request, response);

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
