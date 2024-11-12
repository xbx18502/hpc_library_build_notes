// src/main/java/com/booking/model/Flight.java
package com.booking.model;

import java.time.LocalDateTime;
import java.util.List;
import java.util.ArrayList;

public class Flight {
    private String flightNumber;
    private String origin;
    private String destination;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private List<Seat> seats;
    
    public Flight(String flightNumber, String origin, String destination, 
                 LocalDateTime departureTime, LocalDateTime arrivalTime) {
        this.flightNumber = flightNumber;
        this.origin = origin;
        this.destination = destination;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.seats = new ArrayList<>();
    }
    
    // Getters and Setters
    // ... 
}