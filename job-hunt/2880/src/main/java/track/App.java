package track;
import java.util.Scanner;

import track.Flights.Reservations;

import java.util.ArrayList;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.LocalDate;
import java.time.Duration;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import java.util.Map;
import java.util.HashMap;


class MyDateTime {


  private LocalDateTime localDateTime;
  // 
  private static final DateTimeFormatter DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy/MM/dd-HH:mm:ss");
  // init
  public MyDateTime(int year, int month, int day, int hour, int minute, int second){
    this.localDateTime = LocalDateTime.of(year,month,day,hour,minute,second);
  }
  public MyDateTime(String dateTimeString){
    this.localDateTime = parseDateTimeString(dateTimeString);
  }
  // parse string
  private LocalDateTime parseDateTimeString(String dateTimeString) {
      try {
          return LocalDateTime.parse(dateTimeString, DATETIME_FORMATTER);
      } catch (DateTimeParseException e) {
          throw new IllegalArgumentException("Invalid datetime format: " + dateTimeString);
      }
  }

  // get datetime string
  @Override
  public String toString() {
      return localDateTime.format(DATETIME_FORMATTER);
  }

  // Getter
  public LocalDateTime getLocalDateTime() {
      return localDateTime;
  }
  /**
  MyDateTime dateTime1 = new MyDateTime(2024,11,4,20,10,15);
  MyDateTime dateTime2 = new MyDateTime("2024/11/04-20:10:15");
  */
}
class MyDate {


  private LocalDate localDate;
  // 
  private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy/MM/dd");
  // init
  public MyDate(int year, int month, int day){
    this.localDate = LocalDate.of(year,month,day);
  }
  public MyDate(String dateString){
    this.localDate = parseDateString(dateString);
  }
  // parse string
  private LocalDate parseDateString(String dateString) {
      try {
          return LocalDate.parse(dateString, DATE_FORMATTER);
      } catch (DateTimeParseException e) {
          throw new IllegalArgumentException("Invalid date format: " + dateString);
      }
  }

  // get date string
  @Override
  public String toString() {
      return localDate.format(DATE_FORMATTER);
  }

  // Getter
  public LocalDate getLocalDate() {
      return localDate;
  }
  /**
  MyDate date1 = new MyDate(2024,11,4);
  MyDate date2 = new MyDate("2024/11/04");
  */
}
class MyTime {

  LocalTime localTime;
  // 
  private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");
  // init
  public MyTime(int hour, int minutes, int second){
    this.localTime = LocalTime.of(hour,minutes,second);
  }
  public MyTime(String timeString){
    this.localTime = parseTimeString(timeString);
  }
  // parse string
  private LocalTime parseTimeString(String timeString) {
      try {
          return LocalTime.parse(timeString, TIME_FORMATTER);
      } catch (DateTimeParseException e) {
          throw new IllegalArgumentException("Invalid date format: " + timeString);
      }
  }

  // get time string
  @Override
  public String toString() {
      return localTime.format(TIME_FORMATTER);
  }

  // Getter
  public LocalTime getLocalTime() {
      return localTime;
  }
  /**
  MyTime time1 = new MyTime(20,10,15);
  MyDate time2 = new MyDate("20:10:15");
  */
 
}

class User{
  String userId;

  public User(String userId){
    this.userId = userId;
  }

}

class Users{
Map<String, User > userMap;
}

class Airport{
  Integer airportId;

}

class Airports{
Map<Integer, Airport> airportMap;
}

class DailyFlight{
public DailyFlight(Integer flight_id, Integer departure_airport_id,
Integer arrival_airport_id,
MyTime departure_time, MyTime arrival_time){
  this.dailyFlightNumber = flight_id;
  this.departureAirport = departure_airport_id;
  this.arrivalAirport = arrival_airport_id;
  this.departureTime = departure_time;
  this.arrivalTime = arrival_time;
  this.seats = new Seats();
}
 Airport departureAirport;
 Airport arrivalAirport;
 MyTime departureTime;
 MyTime arrivalTime;
 Integer dailyFlightNumber;
 Integer numberOfSeatClasses;
 Seats seats;

}

class Flights{
Map<Integer, DailyFlight> flightTableByDailyFlightNumber;
public Flights(){
  this.flightTableByDailyFlightNumber = new HashMap<>();
}
public boolean insertFlight(Integer flight_id, Integer departure_airport_id, Integer arrival_airport_id,
MyTime departure_time, MyTime arrival_time){
  DailyFlight newDailyFlight = new DailyFlight(flight_id, departure_airport_id, 
  arrival_airport_id,departure_time, arrival_time);
  this.flightTableByDailyFlightNumber.put(flight_id, newDailyFlight);
  return true;

}

public void insertSeats(Integer flight_id, Integer lastColumn, 
Integer column, Integer price,Integer s){
  DailyFlight selectedDailyFlight = this.flightTableByDailyFlightNumber.get(flight_id);
  seats selectedSeats = selectedDailyFlight.seats;
  for(int i=lastColumn;i<column;i++){
    selectedSeats.insertSeat(i,"A",price,s);
    selectedSeats.insertSeat(i,"B",price,s);
    selectedSeats.insertSeat(i,"C",price,s);
    selectedSeats.insertSeat(i,"D",price,s);
    selectedSeats.insertSeat(i,"E",price,s);
}
}

class Seat{

public Seat(Integer rowNumber, String columnLetter,
Integer seatClass, Integer price){
  this.rowNumber = rowNumber;
  this.columnLetter = columnLetter;
  this.seatId = rowNumber.toString() + columnLetter;
  this.seatClass = seatClass;
  this.price = price;
  this.reservationMapByDate = new HashMap<>();
}
Integer rowNumber;
String columnLetter;
String seatId;
Integer seatClass;
Integer price;
HashMap<MyDate, Reservation> reservationMapByDate;
}

class Seats{
Map<String, Seat > seatsMap; 
void initSeats(){
  Map<String, Seat > seatsMap = new HashMap<>();
}
public void insertSeat(Integer rowNumber, String columnLetter,Integer price,Integer s){
  Seat newSeat = new Seat(rowNumber, columnLetter, s, price);
  this.seatsMap.put(newSeat.seatId, newSeat);
}
}

class Reservation{
Integer reservationId;
DailyFlight dailyFlight;
User user;
Airport airport;
String seatId;
}

class Reservations{
Map<Integer, Reservation> reservationMap;
public Reservations(){
  this.reservationMap = new HashMap<>();
}
public Integer insertReservation( DailyFlight dailyFlight, String userId, String seatId){
  Reservation newReservation = new Reservation();
  newReservation.reservationId = this.reservationMap.size();
  newReservation.dailyFlight = dailyFlight;
  newReservation.user = new User(userId);
  newReservation.seatId = seatId;
  this.reservationMap.put(newReservation.reservationId, newReservation);
  return newReservation.reservationId;
}
}
}

public class App {
  private static Reservations reservations;
  private static Seats seats;

  public static void main(String[] args) {
    // このコードは標準入力と標準出力を用いたサンプルコードです。
    // このコードは好きなように編集・削除してもらって構いません。
    // ---
    // This is a sample code to use stdin and stdout.
    // Edit and remove this code as you like.
    int n=999 ,m=-1;
    String[] lines = getStdin();
    for (int i = 0, l = lines.length; i < l; i++) {
      String output = String.format("line[%s]: %s", i, lines[i]);
      System.out.println(output);
    }

    reservations = new Reservations();

    int i=0;
    int parsedFlights = 0;
    int parsedQuery = 0;
    while(i<lines.length){
      if(i==0){
        n=Integer.parseInt(lines[0]);
        System.out.println(n);
        i++;
      }
      else if(parsedFlights<n){
        String cur  =lines[i];
        String[] parts = cur.split(" ");
        Integer flight_id= Integer.parseInt(parts[0]);
        Integer departure_airport_id = Integer.parseInt(parts[1]);
        Integer arrival_airport_id = Integer.parseInt(parts[2]);
        String departure_time = parts[3];
        String arrival_time = parts[4];
        System.out.print(flight_id);
        System.out.print(" ");
        System.out.print(departure_airport_id);
        System.out.print(" ");
        System.out.print(arrival_airport_id);
        System.out.print(" ");
        System.out.print(departure_time);
        System.out.print(" ");
        System.out.print(arrival_time);
        System.out.println(" ");
        i++;
        Flights flights = new Flights();
        flights.insertFlight(flight_id, departure_airport_id, arrival_airport_id,
        MyTime(departure_time), MyTime(arrival_time));
        
        cur = lines[i];
        int s = Integer.parseInt(cur);
        System.out.println(s);
        i++;
        Integer lastColumn = 0;
        for(int j=0;j<s;j++){
          cur = lines[i];
          parts = cur.split(" ");
          Integer column = Integer.parseInt(parts[0]);
          Integer price = Integer.parseInt(parts[1]);
          System.out.print(column);
          System.out.print(" ");
          System.out.print(price);
          System.out.println(" ");
          i++;
          flights.insertSeats(flight_id,lastColumn, column,price, j);
          lastColumn = column;
        }
        parsedFlights++;
      }
      else if(m==-1){
        m = Integer.parseInt(lines[i]);
        System.out.println(m);
        i++;
      }
      else{
        String cur = lines[i];
        String[] parts = cur.split(" ");
        // System.out.println(parts[0]);
        if(parts[0].equals("reserve:")){
          System.out.print("reserve: ");
          MyDateTime dateTime = new MyDateTime(parts[1]);
          String userId = parts[2];
          MyDate flightDate = new MyDate(parts[3]);
          Integer flightNumber = Integer.parseInt(parts[4]);
          String seatId = parts[5];
          System.out.print(dateTime);
          System.out.print(" ");
          System.out.print(userId);
          System.out.print(" ");
          System.out.print(flightDate);
          System.out.print(" ");
          System.out.print(flightNumber);
          System.out.print(" ");
          System.out.print(seatId);
          System.out.println(" ");
          reserveQuery(reservations,dateTime, userId, flightDate, flightNumber, seatId);
        }
        else if(parts[0].equals("seat-search:")){
          System.out.print("seat-search: ");
          String datetime = parts[1];
          String flightDate = parts[2];
          Integer flightNumber = Integer.parseInt(parts[3]);

          System.out.print(datetime);
          System.out.print(" ");
          System.out.print(flightDate);
          System.out.print(" ");
          System.out.print(flightNumber);
          System.out.println(" ");
          
        }
        else if(parts[0].equals("cancel:")){
          System.out.print("cancel: ");
          String datetime = parts[1];
          String userId = parts[2];
          Integer reservationId = Integer.parseInt(parts[3]);
          System.out.print(datetime);
          System.out.print(" ");
          System.out.print(userId);
          System.out.print(" ");
          System.out.print(reservationId);
          System.out.println(" ");
        }
        else if(parts[0].equals("get-reservation:")){

        }
        else if(parts[0].equals("flight-search:")){

        }
        else {
          System.out.println("invalid query");
        }
        i++;
      }
    }
    
  }
  private static void reserveQuery(Reservations reservations, MyDateTime dateTime, String userId,
   MyDate flightDate, Integer flightNumber, String seatId){
    if(!flights.flightTableByDailyFlightNumber.containsKey(flightNumber)){
      System.out.println("reserve: flight not found");
      return;
    }
    DailyFlight selectedDailyFlight =  flights.flightTableByDailyFlightNumber[flightNumber];
    MyTime departureTime = selectedDailyFlight.departureTime;
    MyDateTime departureDateTime = new MyDateTime(flightDate.toString + "-" + departureTime.toString);
    // define datetime formatter
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd-HH:mm:ss");

    // LocalDateTime a = LocalDateTime.parse("2024/04/27 10:00:00", formatter);
    // LocalDateTime b = LocalDateTime.parse("2024/04/27 12:30:00", formatter);

    // get duration betweeen depatureDateTime and dateTime
    Duration duration = Duration.between(dateTime, departureDateTime);

    // output duration time
    System.out.println("duartion: " + duration.toHours() + " hours " + (duration.toMinutes() % 60) + " minutes");

    // check whether dateTime of ealier than departureDateTime by at least 2 h
    if (!duration.isNegative() && duration.toHours() > 2) {
        System.out.println("reserve: too late");
        return;
    } 
    selectedSeat = selectedDailyFlight.seats.seatsMapBySeatId[seatId];
    if(selectedSeat.reservationMapByDate.containsKey(flightDate)){
        System.out.println("reserve: already reserved");
        return;
    }
    Integer reservationId = reservations.insertReservation(selectedDailyFlight, 
    userId, seatId);
    System.out.println("reserve: %d %d", reservationId, selectedSeat.price);

  }
  private static String[] getStdin() {
    Scanner scanner = new Scanner(System.in);
    ArrayList<String> lines = new ArrayList<>();
    while (scanner.hasNext()) {
      lines.add(scanner.nextLine());
    }
    return lines.toArray(new String[lines.size()]);
  }
}



