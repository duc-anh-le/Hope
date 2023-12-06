/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.Orders;

/**
 *
 * @author Admin
 */
public class Order {
    private int id;
    private int quantity;
    private double price;
    private double totalPrice;
    private String phone;
    private String address;
    private String username;
    private String productid;
    private String fullname;
    private String size;
    private String color;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Order() {
    }

    public Order(int id, int quantity, double price, double totalPrice, String phone, String address, String username, String productid, String fullname, String size, String color) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.totalPrice = totalPrice;
        this.phone = phone;
        this.address = address;
        this.username = username;
        this.productid = productid;
        this.fullname = fullname;
        this.size = size;
        this.color = color;

    }
    
    
    
}
