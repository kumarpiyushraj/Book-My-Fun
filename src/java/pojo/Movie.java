package pojo;

/**
 *
 
@author acer*/
public class Movie {

    private String movieId;
    private String movieName;
    private String movieStartTime;
    private String movieEndTime;
    private String movieDate;
    private String venue;
    private float TicketPrice;
    private int TicketAvl;



//    public Movie(String movieName, String movieStartTime, String movieEndTime, String movieDate, String venue, float ticketsPrice) {
//        this.movieName = movieName;
//        this.movieStartTime = movieStartTime;
//        this.movieEndTime = movieEndTime;
//        this.movieDate = movieDate;
//        this.venue = venue;
//        this.TicketPrice = ticketsPrice;
//    }
    public Movie(String movieId, String movieName, String movieStartTime, String movieEndTime, String movieDate, String venue, float TicketPrice, int TicketAvl ) {
        this.movieId = movieId;
        this.movieName = movieName;
        this.movieStartTime = movieStartTime;
        this.movieEndTime = movieEndTime;
        this.movieDate = movieDate;
        this.venue = venue;
        this.TicketAvl = TicketAvl;
        this.TicketPrice = TicketPrice;
    }
//    public Movie(String movieName, String movieStartTime,String movieEndTime, String movieDate,String venue ) {
//        this.movieName = movieName;
//        this.movieStartTime = movieStartTime;
//        this.movieEndTime = movieEndTime;
//        this.movieDate = movieDate;
//        this.venue = venue;
//        this.TicketAvl = TicketAvl;
//        this.TicketPrice = TicketPrice;
//    }

    public Movie() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String getmovieId(){
        return movieId;
    }
    public String getmovieName(){
        return movieName;
    }
    public String getmovieStartTime(){
        return movieStartTime;
    }
    public String getmovieEndTime(){
        return movieEndTime;
    }
    public String getmovieDate(){
        return movieDate;
    }
    public String getvenue(){
        return venue;
    }
    public int getTicketAvl(){
        return TicketAvl;
    }
    public float getTicketPrice(){
        return TicketPrice;
    }

}