package controller;

import dao.DBHelper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pojo.Admin;
import pojo.Booking;
import pojo.Game;
import pojo.Movie;
import pojo.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class ControllerServlet extends HttpServlet {

    private int bookingId;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String check = request.getParameter("Value");
            String password, tickets, resultValue = "Username or Password is wrong.", signUpSuccessMsg = "User Successfully Registered", signUpFailedMsg = "User Registration Failed";
            HttpSession session = request.getSession(true);

            switch (check) {
                case "AdminLogin":
                    String adminUsername = request.getParameter("admin-username");
                    password = request.getParameter("admin-password");
                    Admin admin = DBHelper.getInstance().executeAdminSearch(adminUsername);
                    if (admin != null) {
                        if (admin.getAname().equals(adminUsername) && admin.getPassword().equals(password)) {
                            //values.add(admin.getAname());
                            session.setAttribute("Username", adminUsername);
                            forwardRequest(request, response, "/AdminControls.jsp");
                        } else {
                            session.setAttribute("Findresult", resultValue);
                            forwardRequest(request, response, "/AdminLogin.jsp");
                        }
                    } else {
                        session.setAttribute("AdminLogin", "Login Failed!");
                        forwardRequest(request, response, "/AdminLogin.jsp");
                    }
                    break;

                case "UserLogin":
                    String userUsername = request.getParameter("user-username");
                    password = request.getParameter("user-password");
                    User user = DBHelper.getInstance().executeUserSearch(userUsername);
                    if (user != null) {
                        if (user.getUname().equals(userUsername) && user.getPassword().equals(password)) {
                            session.setAttribute("Username", userUsername);
                            response.sendRedirect("UserSelectionPage.jsp");
                        } else {
                            session.setAttribute("Findresult", resultValue);
                            response.sendRedirect("Login.jsp");
                        }
                    } else {
                        session.setAttribute("UserLogin", "User is not registered! Try Signing Up.");
                        response.sendRedirect("Login.jsp");
                    }
                    break;
                    
                case "UserSignup": 
                    String SUsername = request.getParameter("susername");
                    String SEmail = request.getParameter("semail");
                    long SMobile = Long.parseLong(request.getParameter("smobile"));
                    int SAge = Integer.parseInt(request.getParameter("sage"));
                    String SPassword = request.getParameter("spassword");
                    String SConfirmPassword = request.getParameter("sconfirm-password");
                    if(SUsername != null && SEmail != null && SMobile != 0000000000 && SAge != 0 && SPassword != null && SConfirmPassword != null){
                        if(SPassword.equals(SConfirmPassword)){
                            User u1 = new User(SUsername, SPassword, SEmail, SAge, SMobile);
                            boolean bl = DBHelper.getInstance().executeUserInsert(u1);
                            if(bl){
                                session.setAttribute("UserLogin", "User Registered Successfully. Try Logging In");
                                response.sendRedirect("Login.jsp");
                            }
                            else{
                                session.setAttribute("SignUpFailedMsg", signUpFailedMsg);
                                response.sendRedirect("UserSignUp.jsp");
                            }
                        }
                    }
                    else{
                        session.setAttribute("InputMismatch", "Fill The Asked Details Correctly");
                        response.sendRedirect("UserSignUp.jsp");
                    }
                    break;
                
                case "BookMovie":
                    String id = request.getParameter("movieId");
                    if (request.getSession(false) == null || request.getSession(false).getAttribute("Username") == null) {
                        session.setAttribute("UserLogin", "Session Expired");
                        response.sendRedirect("Login.jsp");
                    }
                    else{
                    if(DBHelper.getInstance().findMovieGame("movie","movieid",id)){
                    tickets = request.getParameter("Movietickets");
                    int persons = 0;
                    try {
                        persons = Integer.parseInt(tickets);
                    } catch (NumberFormatException e) {
                        session.setAttribute("MvBookingFailed", "Enter numeric value only");
                        response.sendRedirect("BookMovie.jsp");
                    }

                    if(session.getAttribute("Username") != null){
                    Movie mv = DBHelper.getInstance().executeMovieAndUpdate(id, persons);
                    if (mv != null) {
                        String movieId = mv.getmovieId();
                        bookingId = (int) (Math.random() * 1000) + 14;
                        String date = mv.getmovieDate();
                        String time = mv.getmovieStartTime();
                        String venue = mv.getvenue();
                        float totalAmt = (mv.getTicketPrice() * persons);

                        Booking bookMv = new Booking(bookingId, session.getAttribute("Username").toString(), movieId, null, date, time, persons, totalAmt, venue);

                        if (DBHelper.getInstance().executeBookingInsert(bookMv)) {
                            session.setAttribute("Id", "MovieBook");
                            session.setAttribute("Tickets", tickets);
                            session.setAttribute("MoviesList", mv);
                            response.sendRedirect("BookingTicket.jsp");
                        } else {
                            session.setAttribute("MvBookingFailed", "Booking Failed");
                            response.sendRedirect("BookMovie.jsp");
                        }
                       
                    } else {
                        session.setAttribute("MvBookingFailed", "No. of tickets for booking exceeded the available tickets value");
                        response.sendRedirect("BookMovie.jsp");
                    }
                    } else{
                        session.setAttribute("MvBookingFailed", "User not found. Try Login Again");
                        response.sendRedirect("BookMovie.jsp");
                        }
                    }
                    else{
                        session.setAttribute("MvBookingFailed", "Booking Failed. Please enter correct Movie Id");
                        response.sendRedirect("BookMovie.jsp");
                    }
                    }
                    break;

                case "BookGame":
                    id = request.getParameter("gameId");
                    if (request.getSession(false) == null || request.getSession(false).getAttribute("Username") == null) {
                        session.setAttribute("UserLogin", "Session Expired");
                        response.sendRedirect("Login.jsp");
                    }
                    else{
                    if(DBHelper.getInstance().findMovieGame("game","gameid",id)){
                    tickets = request.getParameter("Gametickets");
                    int Gpersons;
                    try {
                        Gpersons = Integer.parseInt(tickets);
                    } catch (NumberFormatException e) {
                        session.setAttribute("GmBookingFailed", "Enter numeric value only");
                        response.sendRedirect("BookGames.jsp");
                        return;
                    }

                    if(session.getAttribute("Username") != null){
                    Game gm = DBHelper.getInstance().executeGameAndUpdate(id, Gpersons);
                    if (gm != null) {
                        String gameId = gm.getGameId();
                        bookingId = (int) (Math.random() * 1000) + 14;
                        String gmdate = gm.getGameDate();
                        String gmtime = gm.getGameStarttime();
                        float totAmt = (gm.getTicketPrice() * Gpersons);
                        String venue = gm.getVenue();
                        
                        Booking bookGm = new Booking(bookingId, session.getAttribute("Username").toString(), null, gameId, gmdate, gmtime, Gpersons, totAmt, venue);

                        if (DBHelper.getInstance().executeBookingInsert(bookGm)) {
                            session.setAttribute("Id", "GameBook");
                            session.setAttribute("Tickets", tickets);
                            session.setAttribute("GamesList", gm);
                            response.sendRedirect("BookingTicket.jsp");
                        } else {
                            session.setAttribute("GmBookingFailed", "Booking Failed.");
                            response.sendRedirect("BookGames.jsp");
                        }
                    } else {
                        session.setAttribute("GmBookingFailed", "No. of tickets for booking exceeded the available tickets value.");
                        response.sendRedirect("BookGames.jsp");
                    }
                    }else{
                        session.setAttribute("MvBookingFailed", "User not found. Try Login Again");
                        response.sendRedirect("BookGames.jsp");
                        }
                    }
                    else{
                        session.setAttribute("GmBookingFailed", "Booking Failed. Please enter correct Game Id.");
                        response.sendRedirect("BookGames.jsp");
                    }
                    }
                    break;

                case "AdminControls":
                    String name = request.getParameter("name");
                    String movie_id = request.getParameter("movie_id");
                    String Adate = request.getParameter("movie_date");
                    String Stime = request.getParameter("start_time");
                    String Etime = request.getParameter("end_time");
                    String venue = request.getParameter("venue");
                    String ticketPr = request.getParameter("ticket_price");
                    String ticketAvl = request.getParameter("tickets_available");
                    String type = request.getParameter("type");

                    if (DBHelper.getInstance().executeAdminInsert(type, name, movie_id, Adate, Stime, Etime, venue, ticketPr, ticketAvl)) {
                        int earnings = DBHelper.getInstance().executeEarnings();
                        session.setAttribute("Earnings", earnings);
                        session.setAttribute("AdminInsertMsg", "Successfully Inserted");
                        forwardRequest(request, response, "/AdminControls.jsp");
                    } else {
                        session.setAttribute("AdminInsertMsg", "Insertion Failed.");
                        forwardRequest(request, response, "/AdminControls.jsp");
                    }
                    break;
                
                case "LogoutUser":
                    if (request.getSession(false) != null) {
                        request.getSession().invalidate();
                        response.sendRedirect("Login.jsp");
                    }
                    break;
            }
        }
    }

    private void forwardRequest(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
