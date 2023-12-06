/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.Cart;

import com.hope.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    public List<Product> getProductPage(int pageNumber, int pageSize, String order) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY productid) AS RowNum, * FROM product) AS P WHERE RowNum BETWEEN ? AND ?";
        if (order.equals("low")) {
            sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY price ASC) AS RowNum, * FROM product) AS P WHERE RowNum BETWEEN ? AND ?";
        } else if (order.equals("high")) {
            sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY price DESC) AS RowNum, * FROM product) AS P WHERE RowNum BETWEEN ? AND ?";
        }
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
                String productId = rs.getString("productid");
                String productName = rs.getString("productname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                double price = rs.getDouble("price");
                String imageLink = rs.getString("imagelink");

                Product product = new Product(productId, productName, price, color, size, imageLink);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public int getTotalRow(String categoryid) {
        String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY productid) AS RowNum, * FROM product) AS P WHERE P.categoryid = ?";
        int total = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, categoryid);
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

    public List<Product> getProductPageByCategory(int pageNumber, int pageSize, String categoryid, String order) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM (\n"
                + "    SELECT ROW_NUMBER() OVER (PARTITION BY categoryid ORDER BY productid) AS RowNum, *\n"
                + "    FROM product\n"
                + ") AS P\n"
                + "WHERE P.categoryid = ?\n"
                + "    AND P.RowNum BETWEEN ? AND ?";
        if (order.equals("high")) {
            sql = "SELECT *\n"
                    + "FROM (\n"
                    + "    SELECT ROW_NUMBER() OVER (PARTITION BY categoryid ORDER BY price) AS RowNum, *\n"
                    + "    FROM product\n"
                    + ") AS P\n"
                    + "WHERE P.categoryid = ?\n"
                    + "    AND P.RowNum BETWEEN ? AND ?";
        } else if (order.equals("low")) {
            sql = "SELECT *\n"
                    + "FROM (\n"
                    + "    SELECT ROW_NUMBER() OVER (PARTITION BY categoryid ORDER BY price DESC) AS RowNum, *\n"
                    + "    FROM product\n"
                    + ") AS P\n"
                    + "WHERE P.categoryid = ?\n"
                    + "    AND P.RowNum BETWEEN ? AND ?";
        }
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            // Calculate the starting row and ending row based on the page number and page size
            int startRow = (pageNumber - 1) * pageSize + 1;
            int endRow = pageNumber * pageSize;

            // Set the start and end row parameters in the SQL query
            ps.setInt(2, startRow);
            ps.setInt(3, endRow);
            ps.setString(1, categoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productid");
                String productName = rs.getString("productname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                double price = rs.getDouble("price");
                String imageLink = rs.getString("imagelink");
                String description1 = rs.getString("description1");
                String description2 = rs.getString("description2");
                String description3 = rs.getString("description3");
                Product product = new Product(productId, productName, price, color, size, imageLink, description1, description2, description3);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public List<Product> getProductPageFeature(int pageNumber, int pageSize, String order) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM (\n"
                + "    SELECT *,\n"
                + "           ROW_NUMBER() OVER (PARTITION BY categoryid ORDER BY productid) AS RowNum\n"
                + "    FROM product\n"
                + ") AS P\n"
                + "WHERE P.RowNum <= 4\n"
                + "ORDER BY P.categoryid, P.productid\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        if (order.equals("low")) {
            sql = "SELECT *\n"
                    + "FROM (\n"
                    + "    SELECT *,\n"
                    + "           ROW_NUMBER() OVER (PARTITION BY categoryid ORDER BY price) AS RowNum\n"
                    + "    FROM product\n"
                    + ") AS OrderedByCategory\n"
                    + "WHERE OrderedByCategory.RowNum <= 4\n"
                    + "ORDER BY OrderedByCategory.price\n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";

        } else if (order.equals("high")) {
            sql = "SELECT *\n"
                    + "FROM (\n"
                    + "    SELECT *,\n"
                    + "           ROW_NUMBER() OVER (PARTITION BY categoryid ORDER BY price) AS RowNum\n"
                    + "    FROM product\n"
                    + ") AS OrderedByCategory\n"
                    + "WHERE OrderedByCategory.RowNum <= 4\n"
                    + "ORDER BY OrderedByCategory.price DESC\n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";

        }

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            // Calculate the starting row and ending row based on the page number and page size
            int startRow = (pageNumber - 1) * pageSize + 1;
            int endRow = pageNumber * pageSize;
            ps.setInt(1, startRow);
            ps.setInt(2, endRow);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productid");
                String productName = rs.getString("productname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                double price = rs.getDouble("price");
                String imageLink = rs.getString("imagelink");
                String description1 = rs.getString("description1");
                String description2 = rs.getString("description2");
                String description3 = rs.getString("description3");
                Product product = new Product(productId, productName, price, color, size, imageLink, description1, description2, description3);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public List<Product> getProductPageSearch(int pageNumber, int pageSize, String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM (\n"
                + "  SELECT *, ROW_NUMBER() OVER (ORDER BY productid) AS rownumber\n"
                + "  FROM product\n"
                + "  WHERE productname LIKE ? OR productid LIKE ?\n"
                + ") AS subquery\n"
                + "ORDER BY rownumber\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            // Calculate the starting row and ending row based on the page number and page size
            int startRow = (pageNumber - 1) * pageSize;
            int endRow = pageNumber * pageSize;
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setInt(3, startRow);
            ps.setInt(4, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productid");
                String productName = rs.getString("productname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                double price = rs.getDouble("price");
                String imageLink = rs.getString("imagelink");
                String description1 = rs.getString("description1");
                String description2 = rs.getString("description2");
                String description3 = rs.getString("description3");
                Product product = new Product(productId, productName, price, color, size, imageLink, description1, description2, description3);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public int getTotalRowSearch(String keyword) {
        int total = 0;
        String sql = "SELECT *\n"
                + "FROM (\n"
                + "  SELECT *, ROW_NUMBER() OVER (ORDER BY productid) AS rownumber\n"
                + "  FROM product\n"
                + "  WHERE productname LIKE ? OR productid LIKE ?\n"
                + ") AS subquery\n"
                + "ORDER BY rownumber";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
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

    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * From product";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productid");
                String productName = rs.getString("productname");
                String size = rs.getString("size");
                String color = rs.getString("color");
                double price = rs.getDouble("price");
                String imageLink = rs.getString("imagelink");
                Product product = new Product(productId, productName, price, color, size, imageLink);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }

    public void addProduct(String productid, String productname, String size, String color, double price, String imagelink, String categoryid, String description1, String description2, String description3) {
        String sql = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productid);
            ps.setString(2, productname);
            ps.setString(3, size);
            ps.setString(4, color);
            ps.setDouble(5, price);
            ps.setString(6, imagelink);
            ps.setString(7, categoryid);
            ps.setString(8, description1);
            ps.setString(9, description2);
            ps.setString(10, description3);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
    }

    public void deleteProductByID(String delid) {
        String sql = "UPDATE orders SET productid = NULL WHERE productid = (?);"
                + " DELETE FROM product WHERE productid = (?)";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, delid);
            ps.setString(2, delid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
    }

    public void editProductByID(String productid, String productname, double price, String imagelink, String categoryid) {
        String sql = "UPDATE product SET productname = ?, price = ?, imagelink = ? WHERE productid = ?";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productname);
            ps.setDouble(2, price);
            ps.setString(3, imagelink);
            ps.setString(4, productid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }

    }
}
