/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.hope.Controller;

import com.hope.account.AccountDAO;
import com.hope.account.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DUNGHUYNH
 */
public class LoginController extends HttpServlet {

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
        /* TODO output your page here. You may use following sample code. */
//             response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String user = request.getParameter("user");
        String password = request.getParameter("password");

//            RequestDispatcher rd1 = request.getRequestDispatcher("menu.html");
//            rd1.include(request, response);
        if (action != null && action.equals("logout")) {
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.invalidate();
            }

            response.sendRedirect("index.jsp");
        } else {

            log("Debug user : " + user + " " + password);

            if (user == null && password == null) {

                log("Debug user : Go to login " + user + " " + password);
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
            } else {

                log("Debug user : Go to here " + user + " " + password);
                AccountDAO accountDAO = new AccountDAO();
                AccountDTO accountDTO = accountDAO.login(user, password);

                if (accountDTO != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usersession", accountDTO);
                    if (accountDTO.getRole() == 1) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    request.setAttribute("error", "Wrong username or password");
                    rd.forward(request, response);
                }
            }
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
