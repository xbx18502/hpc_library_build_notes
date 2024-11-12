// src/main/java/com/booking/model/Seat.java
package com.booking.model;

public class Seat {
    private String seatNumber;
    private boolean isOccupied;
    private String seatClass; // economy, business, first
    
    public Seat(String seatNumber, String seatClass) {
        this.seatNumber = seatNumber;
        this.seatClass = seatClass;
        this.isOccupied = false;
    }
    
    // Getters and Setters
    // ...
}