/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hope.Cart;

import java.util.Comparator;

/**
 *
 * @author Admin
 */
public class Product {

    private String id;
    private String name;
    private double price;
    private int quantity;
    private String color;
    private String size;
    private String link;
    private String currentColor;
    private String currentSize;
    private String description1;
    private String description2;
    private String description3;

    public String getDescription1() {
        return description1;
    }

    public void setDescription1(String description1) {
        this.description1 = description1;
    }

    public String getDescription2() {
        return description2;
    }

    public void setDescription2(String description2) {
        this.description2 = description2;
    }

    public String getDescription3() {
        return description3;
    }

    public void setDescription3(String description3) {
        this.description3 = description3;
    }

    public String getCurrentColor() {
        return currentColor;
    }

    public void setCurrentColor(String currentColor) {
        this.currentColor = currentColor;
    }

    public String getCurrentSize() {
        return currentSize;
    }

    public void setCurrentSize(String currentSize) {
        this.currentSize = currentSize;
    }

    public Product(String id, String name, double price, int quantity, String color, String size, String link, String currentColor, String currentSize, String description1, String description2, String description3) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
        this.link = link;
        this.currentColor = currentColor;
        this.currentSize = currentSize;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
    }

    public Product(String id, String name, double price, String color, String size, String link, String description1, String description2, String description3) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.color = color;
        this.size = size;
        this.link = link;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
    }

    public Product(String id, String name, double price, String color, String size, String link) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.color = color;
        this.size = size;
        this.link = link;
    }

    public Product(String id, String name, double price, int quantity, String color, String size, String link, String currentColor, String currentSize) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
        this.link = link;
        this.currentColor = currentColor;
        this.currentSize = currentSize;
    }

    public Product(String id, String name, double price, int quantity, String color, String size, String link) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
        this.link = link;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Product() {
    }

    public class ProductComparator implements Comparator<Product> {

        @Override
        public int compare(Product a, Product b) {
            return Double.compare(a.getPrice(), b.getPrice());
        }
    }
}
