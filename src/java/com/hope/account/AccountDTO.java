/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hope.account;

import java.util.Date;

/**
 *
 * @author DUNGHUYNH
 */
public class AccountDTO {

    private String username;
    private String name;
    private Date loginDate;
    private String phoneNumber;
    private int role;
    private double totalbill;
  
    
    

    public double getTotalbill() {
        return totalbill;
    }

    public void setTotalbill(double totalbill) {
        this.totalbill = totalbill;
    }
    

    public AccountDTO(String username, String name, Date loginDate, String phoneNumber) {
        this.username = username;
        this.name = name;
        this.loginDate = loginDate;
        this.phoneNumber = phoneNumber;
    }

    public AccountDTO(String username, String name, Date loginDate, String phoneNumber, int role) {
        this.username = username;
        this.name = name;
        this.loginDate = loginDate;
        this.phoneNumber = phoneNumber;
        this.role = role;
    }

    public AccountDTO(String username, String name, String phoneNumber, int role) {
        this.username = username;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.role = role;
    }

    public AccountDTO(String username, String name, String phoneNumber, int role, double totalbill) {
        this.username = username;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.totalbill = totalbill;
    }   
    
    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public AccountDTO() {
    }

    
    
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }
    

    /**
     * Get the value of username
     *
     * @return the value of username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the value of username
     *
     * @param username new value of username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
