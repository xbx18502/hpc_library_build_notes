// src/main/java/com/booking/service/ReservationService.java
package com.booking.service;

import com.booking.entity.Flight;
import com.booking.entity.Reservation;
import com.booking.entity.User;

public interface ReservationService {
    Reservation bookFlight(User user, Flight flight, String seatNumber);
    void cancelReservation(String reservationId);
    Reservation rescheduleReservation(String reservationId, Flight newFlight, String newSeatNumber);
    Reservation getReservation(String reservationId);
}