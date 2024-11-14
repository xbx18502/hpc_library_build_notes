// src/main/java/com/booking/model/Reservation.java
package com.booking.entity;

import java.time.LocalDateTime;

public class Reservation {
    private String reservationId;
    private User user;
    private Flight flight;
    private Seat seat;
    private LocalDateTime reservationTime;
    
    public Reservation(String reservationId, User user, Flight flight, 
                      Seat seat, LocalDateTime reservationTime) {
        this.reservationId = reservationId;
        this.user = user;
        this.flight = flight;
        this.seat = seat;
        this.reservationTime = reservationTime;
    }
    
    // Getters and Setters
    // ...
}