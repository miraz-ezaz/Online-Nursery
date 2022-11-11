
package com.onlinenursery.plantshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderId;
    private int userId;
    @Column(length =150000000)
    private String details;
    private String orderName;
    private String orderPhone;
    private String orderAddress;
    private double totalPrice;
    private String paymentMethod;
    private String orderStatus;
    private String paymentStatus;

    public Orders() {
    }

    public Orders(int userId, String details, String orderName, String orderPhone, String orderAddress, double totalPrice, String paymentMethod, String orderStatus,String paymentStatus) {
        this.userId = userId;
        this.details = details;
        this.orderName = orderName;
        this.orderPhone = orderPhone;
        this.orderAddress = orderAddress;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.orderStatus = orderStatus;
        this.paymentStatus = paymentStatus;
    }

    public Orders(int orderId, int userId, String details, String orderName, String orderPhone, String orderAddress, double totalPrice, String paymentMethod, String orderStatus) {
        this.orderId = orderId;
        this.userId = userId;
        this.details = details;
        this.orderName = orderName;
        this.orderPhone = orderPhone;
        this.orderAddress = orderAddress;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.orderStatus = orderStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Override
    public String toString() {
        return "Orders{" + "orderId=" + orderId + ", userId=" + userId + ", details=" + details + ", orderName=" + orderName + ", orderPhone=" + orderPhone + ", orderAddress=" + orderAddress + ", totalPrice=" + totalPrice + ", paymentMethod=" + paymentMethod + ", orderStatus=" + orderStatus + '}';
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    
    
    
}


