// src/main/java/com/booking/model/User.java
package com.booking.entity;

public class User {
    private String id;
    private String name;
    private String email;
    private String phone;
    
    // Constructor
    public User(String id, String name, String email, String phone) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }
    
    // Getters and Setters
    public String getId() {
        return id;
    }
    public String getName() {
        return name;
    }
}
