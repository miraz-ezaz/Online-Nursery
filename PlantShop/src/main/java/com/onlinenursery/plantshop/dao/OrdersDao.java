package com.onlinenursery.plantshop.dao;

import com.onlinenursery.plantshop.entities.Orders;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class OrdersDao {

    private SessionFactory factory;

    public OrdersDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int addOrder(Orders orders) {
        int orderId = 0;

        try {

            Session session = this.factory.openSession();

            Transaction tx = session.beginTransaction();
            orderId = (int) session.save(orders);
            tx.commit();

            session.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return orderId;

    }

    public Orders getOrderById(int oid) {
        Orders order = null;
        try {
            Session session = this.factory.openSession();
            order = session.get(Orders.class, oid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    public List<Orders> getOrders() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Orders");
        List<Orders> list = query.list();

        return list;
    }

    public List<Orders> getOrderByUserId(int uid) {
        List<Orders> list = null;
        try {
            String query = "from Orders where userId =: u";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("u", uid);
            list = q.list();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public void confirmOrder(int oId)
    {
        try {

            Session session = this.factory.openSession();

            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("update Orders set orderStatus=: s where orderId=:i");
            query.setParameter("s", "Confirmed");
            query.setParameter("i", oId);
            query.executeUpdate();
            tx.commit();

            session.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
    
    public void confirmPyment(int oId)
    {
        try {

            Session session = this.factory.openSession();

            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("update Orders set paymentStatus=: s where orderId=:i");
            query.setParameter("s", "Paid");
            query.setParameter("i", oId);
            query.executeUpdate();
            tx.commit();

            session.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
