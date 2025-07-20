/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import pojo.User;
import pojo.Admin;
import pojo.Booking;
import pojo.Game;
import pojo.Movie;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author dell
 */
public class DBHelper {
    public Connection con = null;
    public Statement stmt = null;
    public ResultSet rs=null;
    public PreparedStatement pStmt=null;
    Movie mv = null;
    Game gm = null;
    
    
    public static DBHelper instance=null;
    
        // SINGLETON PATTERN
    public static synchronized DBHelper getInstance()
    {
        if (instance == null)
            instance = new DBHelper();
 
        return instance;
    }
    
    private DBHelper() {
        try{            
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Entertainment","postgres", "zyrenz");
            System.out.println("Connection Object--------->"+con);
            stmt=con.createStatement();
        }
        catch(Exception e){            
            e.printStackTrace();            
        }
    }
    
     public int executeEarnings(){
       //String value = "0";
       Integer val = 0;
        try{
            rs= stmt.executeQuery("Select sum(ticketprice) from booking;");
            while(rs.next()){
               val += Integer.parseInt(rs.getString(1));
            }
            //val = Integer.parseInt(value);
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return val;
    }
    
    public User executeUserSearch(String Uname){
        User u = null;
        try{
            rs= stmt.executeQuery("select * from users where username = "+"'"+Uname+"'");
            while(rs.next()){
                u = new User(
                        rs.getString(5), rs.getString(1), rs.getString(2),rs.getInt(3),
                        rs.getLong(4));
            }         
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return u;
    }
    public ArrayList executeMovieSearch(){
        ArrayList<Movie> moviesList = new ArrayList<>();
        try{
            rs= stmt.executeQuery("select * from movie;");
            while(rs.next()){
                mv = new Movie(
                       rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                moviesList.add(mv);
            }         
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return moviesList;
    }
    
 public boolean findMovieGame(String name, String gmid, String mvgmId){
        try{
            rs= stmt.executeQuery("select "+gmid+" from "+name+" movie where movieid = "+"'"+mvgmId+"'");
            if(rs.next()){
                return true;
            }         
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
 
     public ArrayList executeGameSearch(){
         ArrayList<Game> gamesList = new ArrayList<>();
        try{
            rs= stmt.executeQuery("select * from game;");
            while(rs.next()){
                gm = new Game(
                        rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                gamesList.add(gm);
            }         
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return gamesList;
    }
        public Admin executeAdminSearch(String Aname){
        Admin a = null;
        try{
            rs= stmt.executeQuery("select adminname,apassword from Admin where adminname = "+"'"+Aname+"'");
            while(rs.next()){
                a = new Admin(
                        rs.getString(1), rs.getString(2));
            }         
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return a;
    }
     public boolean executeAdminInsert(String choice, String name, String id, String Adate, String Stime, String Etime,  String venue,  String tpr,  String tavl){
            boolean isSuccess = false;
        try{
             pStmt = con.prepareStatement("insert into "+choice+" values(?,?,?,?,?,?,?,?)");
            //pStmt.setString(1,choice);
            pStmt.setString(1,id);
            pStmt.setString(2,name);
            pStmt.setTime(3,java.sql.Time.valueOf(Stime+":00"));
            pStmt.setTime(4, java.sql.Time.valueOf(Etime+":00"));
            pStmt.setDate(5,java.sql.Date.valueOf(Adate));
            pStmt.setString(6,venue);
            pStmt.setFloat(7,Integer.valueOf(tpr));
            pStmt.setInt(8,Integer.valueOf(tavl));
            
            int rowCount= pStmt.executeUpdate();      
             if(rowCount >0){
                isSuccess = true;
            }
            else{
                isSuccess = false;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return isSuccess;
    }
         public boolean executeBookingInsert(Booking b){
             boolean isSuccess = false;
        try{
            pStmt = con.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?)");
            pStmt.setInt(1,b.getBookingId());
            pStmt.setString(2,b.getUsername());
            pStmt.setString(3,b.getMovieId());
            pStmt.setString(4,b.getGameId());
            pStmt.setDate(5,java.sql.Date.valueOf(b.getBookingDate()));
            pStmt.setTime(6, java.sql.Time.valueOf(b.getBookingTime()));
            pStmt.setInt(7,b.getTotalPersons());
            pStmt.setFloat(8,b.getTotalPrice());
            pStmt.setString(9,b.getVenue());
            
            int rowCount= pStmt.executeUpdate();
            if(rowCount >0){
                isSuccess = true;
            }
            else{
                isSuccess = false;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return isSuccess;
    }
    public Movie executeMovieAndUpdate(String mid, int tickets){
        try{
            //System.out.println("SEARCH"+mid);
            rs= stmt.executeQuery("select * from Movie where movieid = "+"'"+mid+"'");
            while(rs.next()){
                mv = new Movie(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getFloat(7), rs.getInt(8));
            }
            if(executeUpdateMovieTicketAvl(mv.getTicketAvl(), mid, tickets)){
                return mv;
            }
          }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
     public Game executeGameAndUpdate(String gid, int tickets){
        try{
            System.out.println("SEARCH"+gid);
            rs= stmt.executeQuery("select * from game where gameid = "+"'"+gid+"'");
            while(rs.next()){
                gm = new Game(rs.getString(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getFloat(7), rs.getInt(8));
            }
            if(executeUpdateGameTicketAvl(gm.getTicketAvl(), gid, tickets)){
                return gm;
            }
          }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public boolean executeUpdateMovieTicketAvl(int ticketAvl, String mvId, int val){
        try{
            if(ticketAvl < val || val == 0){
                return false;
            }
            else{
         String sql = "Update Movie set tickets_available = ? Where movieid = ?";
         ticketAvl = ticketAvl - val;
          pStmt = con.prepareStatement(sql);
            pStmt.setInt(1,ticketAvl);
            pStmt.setString(2, mvId);
          int rows = pStmt.executeUpdate();
          System.out.println(rows+" rows updated successfully.");
            }
          }
        catch(Exception e){
            e.printStackTrace();
        }
        return true;
    }
    public boolean executeUpdateGameTicketAvl(int ticketAvl, String gmId, int val){
        try{
            if(ticketAvl < val || val == 0){
                return false;
            }
            else{
         String sql = "Update game set tickets_available = ? Where gameid = ?";
         ticketAvl = ticketAvl - val;
          pStmt = con.prepareStatement(sql);
            pStmt.setInt(1,ticketAvl);
            pStmt.setString(2, gmId);
          int rows = pStmt.executeUpdate();
          System.out.println(rows+" rows updated successfully.");
            }
          }
        catch(Exception e){
            e.printStackTrace();
        }
        return true;
    }
        public boolean executeUserInsert(User u){
        try{
            pStmt = con.prepareStatement("insert into users values(?,?,?,?,?)");
            pStmt.setString(1,u.getPassword());
            pStmt.setString(2,u.getEmail());
            pStmt.setInt(3,u.getAge());
            pStmt.setLong(4,u.getMobNo());
            pStmt.setString(5,u.getUname());
            
            int rowCount= pStmt.executeUpdate();
            if(rowCount > 0){
                return true;
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
