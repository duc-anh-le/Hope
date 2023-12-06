package com.hope.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLLER = "LoginController";

    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLLER = "SearchController";

    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLLER = "DeleteController";

    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLLER = "UpdateController";

    private static final String LOGOUT_CONTROLLLER = "LogoutController";
    private static final String LOGOUT = "Logout";

    private static final String CREATE_PAGE = "CreatePage";
    private static final String CREATE_PAGE_VIEW = "create.html";

    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";

    private static final String SHOPPING_PAGE = "ShoppingPage";
    private static final String SHOPPING_PAGE_VIEW = "shopping.html";
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";

    private static final String VIEW = "View";
    private static final String VIEW_PAGE = "viewcart.jsp";

    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";

    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLLER;
            } else if (CREATE_PAGE.equals(action)) {
                url = CREATE_PAGE_VIEW;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (SHOPPING_PAGE.equals(action)) {
                url = SHOPPING_PAGE_VIEW;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = VIEW_PAGE;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
