package com.hope.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.hope.Cart.Cart;
import com.hope.Cart.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String productStr = request.getParameter("productName");
            String tmp[] = productStr.split("_");
            String id = tmp[0];
            String name = tmp[1];
            double price = Double.parseDouble(tmp[2]);
            int quantity = Integer.parseInt(request.getParameter("quantity") == null ? "1" : request.getParameter("quantity"));
            String link = tmp[3];
            String color = tmp[4];
            String size = tmp[5];
            String currentColor = request.getParameter("color") == null ? String.valueOf(color.charAt(0)) : request.getParameter("color");
            String currentSize = request.getParameter("size") == null ? String.valueOf(size.charAt(0)) : request.getParameter("size");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();
            }
            Product product = new Product(id, name, price, quantity, color, size, link, currentColor, currentSize);
            boolean check = cart.add(product);

            if (check) {
                session.setAttribute("CART", cart);
                request.setAttribute("MESSAGE", quantity + " - " + name + " added !");
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
