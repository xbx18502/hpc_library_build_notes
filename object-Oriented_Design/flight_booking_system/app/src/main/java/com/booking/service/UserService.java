// src/main/java/com/booking/service/UserService.java
package com.booking.service;

import com.booking.entity.User;

public interface UserService {
    User registerUser(String name, String email, String phone);
    User getUser(String userId);
    void updateUser(User user);
}