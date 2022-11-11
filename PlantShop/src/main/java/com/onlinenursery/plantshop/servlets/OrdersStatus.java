package com.onlinenursery.plantshop.servlets;

import com.onlinenursery.plantshop.dao.OrdersDao;
import com.onlinenursery.plantshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrdersStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {

                String o_S = request.getParameter("Oid");
                String o_P = request.getParameter("pid");
                if (o_S != null && o_P == null) {
                    int Oid = Integer.parseInt(o_S);
                    OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
                    odao.confirmOrder(Oid);
                    HttpSession httpSession = request.getSession();
                    //httpSession.setAttribute("message", "Category Added Successfully. Category Id:" + catId);
                    response.sendRedirect("orders.jsp");
                    return;
                }
                
                else if(o_P!=null && o_S == null)
                {
                    int Pid = Integer.parseInt(o_P);
                    OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
                    odao.confirmPyment(Pid);
                    HttpSession httpSession = request.getSession();
                    //httpSession.setAttribute("message", "Category Added Successfully. Category Id:" + catId);
                    response.sendRedirect("orders.jsp");
                    return;
                }
                else
                {
                   HttpSession httpSession = request.getSession();
                    //httpSession.setAttribute("message", "Category Added Successfully. Category Id:" + catId);
                    response.sendRedirect("orders.jsp");
                    return; 
                }

            } catch (Exception e) {
                e.printStackTrace();
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
