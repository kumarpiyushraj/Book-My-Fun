package pojo;

/**
 *
 
@author acer*/
public class Game {
    private String gameid;
    private String gamename ;
    private String gamestarttime;
    private String gameendtime;
    private String gamedate;
    private String venue; 
    private float ticketprice;
    private int ticketavl;

   public Game(String gameid, String gamename, String gamestarttime, String gameendtime, String gamedate, String venue, float ticketprice, int ticketavl) {
        this.gameid = gameid;
        this.gamename = gamename;
        this.gamestarttime = gamestarttime ;
        this.gameendtime = gameendtime;
        this.gamedate = gamedate;
        this.venue = venue;
        this.ticketavl = ticketavl;
        this.ticketprice = ticketprice;
}
//   public Game(String gamename, String gamestarttime, String gameendtime, String gamedate, String venue, float price) {
//        this.gamename = gamename;
//        this.gamestarttime = gamestarttime ;
//        this.gameendtime = gameendtime;
//        this.gamedate = gamedate;
//        this.venue = venue;
//        this.ticketprice = price;
//}
    public Game() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public String getGameId(){
        return gameid;
    }
    public String getGameName(){
        return gamename;
    }
    public String getGameStarttime(){
        return gamestarttime;
    }
    public String getGameEndtime(){
        return gameendtime;
    }
    public String getGameDate(){
        return gamedate;
    }
    public String getVenue(){
        return venue;
    }
    public int getTicketAvl(){
        return ticketavl;
    }
    public float getTicketPrice(){
        return ticketprice;
    }
}