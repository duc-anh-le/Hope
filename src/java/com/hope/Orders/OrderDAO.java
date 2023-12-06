/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.Orders;

import com.hope.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    public List<Order> getOrderUser(String user) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * From orders WHERE username = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("orderid");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double totalprice = rs.getInt("quantity") * rs.getDouble("price");
                String phonenumber = rs.getString("phonenumber");
                String address = rs.getString("address");
                String username = rs.getString("username");
                String productid = rs.getString("productid");
                String fullname = rs.getString("fullname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                Order order = new Order(id, quantity, price, totalprice, phonenumber, address, username, productid, fullname, size, color);
                orders.add(order);
            }
            return orders;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public List<Order> getAllOrderByPage(int pageNumber, int pageSize) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY orderid) AS RowNum, * FROM orders) AS P WHERE RowNum BETWEEN ? AND ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            // Calculate the starting row and ending row based on the page number and page size
            int startRow = (pageNumber - 1) * pageSize + 1;
            int endRow = pageNumber * pageSize;

            // Set the start and end row parameters in the SQL query
            ps.setInt(1, startRow);
            ps.setInt(2, endRow);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("orderid");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double totalprice = rs.getInt("quantity") * rs.getDouble("price");
                String phonenumber = rs.getString("phonenumber");
                String address = rs.getString("address");
                String username = rs.getString("username");
                String productid = rs.getString("productid");
                String fullname = rs.getString("fullname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                Order order = new Order(id, quantity, price, totalprice, phonenumber, address, username, productid, fullname, size, color);
                orders.add(order);
            }
            return orders;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public int getTotalRow() {
        String sql = "SELECT * From orders";
        int total = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total++;
            }
            return total;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return total;
    }

    public List<Order> getAllOrder() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * From orders";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("orderid");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                double totalprice = rs.getInt("quantity") * rs.getDouble("price");
                String phonenumber = rs.getString("phonenumber");
                String address = rs.getString("address");
                String username = rs.getString("username");
                String productid = rs.getString("productid");
                String fullname = rs.getString("fullname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                Order order = new Order(id, quantity, price, totalprice, phonenumber, address, username, productid, fullname, size, color);
                orders.add(order);
            }
            return orders;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public void deleteOrderByID(String delid) {
        String sql = " DELETE FROM Orders WHERE orderid = (?)";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, delid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
    }

    public void editOrder(String orderid, int quantity, double price, String phonenumber, String address, String fullname) {
        String sql = "UPDATE Orders SET quantity = ?, price = ?, phonenumber = ?, address = ?, fullname = ? WHERE orderid = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setDouble(2, price);
            ps.setString(3, phonenumber);
            ps.setString(4, address);
            ps.setString(5, fullname);
            ps.setString(6, orderid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
    }

    public OrderDAO() {
    }
}
