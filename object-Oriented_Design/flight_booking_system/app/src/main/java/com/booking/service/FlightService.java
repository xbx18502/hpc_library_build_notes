// src/main/java/com/booking/service/FlightService.java
package com.booking.service;

import java.time.LocalDateTime;
import java.util.List;

import com.booking.entity.Flight;

public interface FlightService {
    List<Flight> searchFlights(String origin, String destination, LocalDateTime date);
    Flight getFlight(String flightNumber);
    List<Flight> getAllFlights();
}