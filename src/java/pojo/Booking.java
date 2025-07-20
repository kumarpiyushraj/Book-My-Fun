/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pojo;

/**
 *
 * @author dell
 */
public class Booking {
    private int BookingId = 0;
    private String Username;
    private String MovieId;
    private String GameId;
    private String BookingDate;
    private String BookingTime;
    private int TotalPersons;
    private float TotalPrice;
    private String venue;
    
    
    public Booking(int Bookid,String Uname, String MvId, String GameId, String BookingDate, String BookingTime, int TotalPersons, float TotalPrice, String venue) {
        this.BookingId = Bookid;
        this.Username = Uname;
        this.MovieId = MvId;
        this.GameId = GameId;
        this.BookingDate = BookingDate;
        this.BookingTime = BookingTime;
        this.TotalPersons = TotalPersons;
        this.TotalPrice = TotalPrice;
        this.venue = venue;
         
    }
    public Booking() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    public int getBookingId(){
        return BookingId;
    }
    public String getUsername(){
        return Username;
    }
    public String getMovieId(){
        return MovieId;
    }
    public String getGameId(){
        return GameId;
    }
    public String getBookingDate(){
        return BookingDate;
    }
    public String getBookingTime(){
        return BookingTime;
    }
    public int getTotalPersons(){
        return TotalPersons;
    }
    public float getTotalPrice(){
        return TotalPrice;
    }
    public String getVenue(){
        return venue;
    }
}
