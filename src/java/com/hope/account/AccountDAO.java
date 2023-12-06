/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.account;

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
 * @author DUNGHUYNH
 */
public class AccountDAO {

    public AccountDTO login(String user, String password) {

        String sql = "select username, fullname, phonenumber, role  from Account "
                + " where username = ? and password = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                AccountDTO accountDTO = new AccountDTO();

                accountDTO.setUsername(rs.getString("username"));
                accountDTO.setName(rs.getString("fullname"));
                accountDTO.setPhoneNumber(rs.getString("phonenumber"));
                accountDTO.setRole(rs.getByte("role"));
                accountDTO.setLoginDate(new Date());

                return accountDTO;

            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }

    public boolean register(String user, String password, String phone, String fullname) {
        String sql = "INSERT INTO account (username, password, phonenumber, fullname, role) VALUES (?, ?, ?, ?, 0)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            ps.setString(3, phone);
            ps.setString(4, fullname);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            System.out.println("Query account error!" + ex.getMessage());
        }
        return false;
    }

    public AccountDTO update(String username, String fullname, String phone) {
        String sql = "UPDATE account SET fullname = ?, phonenumber = ? WHERE username = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setString(3, username);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                AccountDTO accountDTO = new AccountDTO();
                accountDTO.setUsername(username);
                accountDTO.setName(fullname);
                accountDTO.setPhoneNumber(phone);
                accountDTO.setLoginDate(new Date());
                return accountDTO;
            }
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
        return null;
    }
    
    
    
    public double getMonthlyIncome(){
        String sql = "select sum(b.[total bill]) as 'monthly income' from (select a.username, a.fullname, a.phonenumber, b.[total bill] as 'total bill',a.role from account a JOIN (select username, sum(totalprice) as 'total bill'from orders group by username) as b\n" +
        "ON a.username = b.username) as b";
        double monthly_income = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                monthly_income = rs.getDouble("monthly income");
            }
            return monthly_income;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return monthly_income;
    }
   
    
    public List<AccountDTO> getAllAccount() {
        List<AccountDTO> accounts = new ArrayList<>();
        String sql = "SELECT a.username, a.fullname, a.phonenumber, COALESCE(b.[total bill], 0) as 'total bill', a.role\n"
                + "FROM account a\n"
                + "LEFT JOIN (\n"
                + "    SELECT username, SUM(totalprice) as 'total bill'\n"
                + "    FROM orders\n"
                + "    GROUP BY username\n"
                + ") as b ON a.username = b.username;";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String name = rs.getString("fullname");
                String phonenumber = rs.getString("phonenumber");
                double total_bill = rs.getDouble("total bill");
                int role = rs.getByte("role");
                AccountDTO account = new AccountDTO(username, name, phonenumber, role, total_bill);
                accounts.add(account);
            }
            return accounts;
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
        return null;
    }
    public boolean register(String user, String password, String phone, String fullname, int role) {
        String sql = "INSERT INTO account (username, password, phonenumber, fullname, role) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            ps.setString(3, phone);
            ps.setString(4, fullname);
            ps.setInt(5, role);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            System.out.println("Query account error!" + ex.getMessage());
        }
        return false;
    }
    public void deleteAccountByUsername(String delusername){
        String sql = "DELETE FROM account WHERE username = (?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, delusername);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Query product error!" + ex.getMessage());
        }
    }
    
    public void editAccount(String username, String name, String phone, String password, int role){
        String sql = "UPDATE account SET fullname = ?, phonenumber = ?, password = ?, role = ? WHERE username = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, password);
            ps.setInt(4, role);
            ps.setString(5, username);
            ps.executeUpdate();           
        } catch (SQLException ex) {
            System.out.println("Query Student error!" + ex.getMessage());
        }
    }
}
