
package com.onlinenursery.plantshop.servlets;

import com.onlinenursery.plantshop.dao.OrdersDao;
import com.onlinenursery.plantshop.entities.Orders;
import com.onlinenursery.plantshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class OrdersServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //code code
            
            try {
                
                int userId = Integer.parseInt(request.getParameter("userId"));
                String orderEmail = request.getParameter("orderEmail");
                String orderName = request.getParameter("orderName");
                String orderPhone = request.getParameter("orderPhone");
                String paymentMethod = request.getParameter("paymentMethod");
                String orderAddress = request.getParameter("orderAddress");
                String details = request.getParameter("orderCart");
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                String orderStatus = "Pending";
                String paymentStatus= "Pending";
                Orders orders = new Orders(userId, details, orderName, orderPhone, orderAddress, totalPrice, paymentMethod, orderStatus, paymentStatus);
                OrdersDao oDao = new OrdersDao(FactoryProvider.getFactory());
                int orderId = oDao.addOrder(orders);
                out.println(orders.getDetails());
                System.out.println(orders.getDetails());
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Order Submitted Successfully. Order Id:" + orderId);
                response.sendRedirect("checkout.jsp");
                return;
                
                
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
