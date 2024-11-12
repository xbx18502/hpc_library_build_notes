// src/main/java/com/booking/service/FlightService.java
package com.booking.service;

import com.booking.model.Flight;
import java.time.LocalDateTime;
import java.util.List;

public interface FlightService {
    List<Flight> searchFlights(String origin, String destination, LocalDateTime date);
    Flight getFlight(String flightNumber);
    List<Flight> getAllFlights();
}