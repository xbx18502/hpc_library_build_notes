// src/main/java/com/booking/service/ReservationService.java
package com.booking.service;

import com.booking.model.Reservation;
import com.booking.model.User;
import com.booking.model.Flight;

public interface ReservationService {
    Reservation bookFlight(User user, Flight flight, String seatNumber);
    void cancelReservation(String reservationId);
    Reservation rescheduleReservation(String reservationId, Flight newFlight, String newSeatNumber);
    Reservation getReservation(String reservationId);
}