<%@page import="pojo.Game"%>
<%@page import="pojo.Movie"%>
<%@page import="dao.DBHelper"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Generation</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 0px;
            margin: 0;
        }

        h1, h2 {
            text-align: center;
        }

        .bill-container {
            width: max-content;
            display: block;
            margin: auto;
            background-color: white;
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .bill-details {
            width: 100%;
            margin-top: 20px;
        }

        .bill-details td, th {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .total {
            font-weight: bold;
            font-size: 1.2em;
        }

        .btn {
            display: block;
            margin: 20px auto;
            padding: 10px;
            width: fit-content;
            height: fit-content;
            background: #5cb85c;
            border: 2px;
            border-radius: 5px;
            font-family: western;
        }
    </style>
</head>
<body>
    <h1 style="color: #5cb85c; margin:50px">Ticket Booked Successfully!!</h1>
    <div class="bill-container">
        <h2>Booking Details</h2>
        <table class="bill-details" border="1" style="width: max-content">
            
            <%
                String Id = (String)session.getAttribute("Id");
                if(Id.equals("MovieBook")){
                String tickets = (String)session.getAttribute("Tickets");
                Integer ticket = Integer.valueOf(tickets);
                Movie mv = (Movie)session.getAttribute("MoviesList");

                float price = mv.getTicketPrice();
                float total = price * ticket;
            %>
            <tr>
                <th>Movie Name</th>
                <th>Show Start Time</th>
                <th>Show End Time</th>
                <th>Show Date</th>
                <th>Venue</th>
                <th>Number of Tickets</th>
                <th>Total Amount</th>
            </tr>
            <tr>
                <td><%= mv.getmovieName() %></td>
                <td><%= mv.getmovieStartTime() %></td>
                <td><%= mv.getmovieEndTime() %></td>
                <td><%= mv.getmovieDate() %></td>
                <td><%= mv.getvenue() %></td>
                <td><%= tickets %></td>
                <td class="total">₹<%= total%></td></tr>
            <%}else if(Id.equals("GameBook")){
                String tickets = (String)session.getAttribute("Tickets");
                Integer ticket = Integer.valueOf(tickets);
                Game gm = (Game)session.getAttribute("GamesList");

                float price = gm.getTicketPrice();
                float total = price * ticket;
                    %>
            <tr>
                <th>Game Name</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Date</th>
                <th>Venue</th>
                <th>Number of Tickets</th>
                <th>Total Amount</th>
            </tr>
            <tr>
                <td><%= gm.getGameName() %></td>
                <td><%= gm.getGameStarttime() %></td>
                <td><%= gm.getGameEndtime() %></td>
                <td><%= gm.getGameDate() %></td>
                <td><%= gm.getVenue() %></td>
                <td><%= tickets %></td>
                <td class="total">₹<%= total%></td></tr> <% } %>
        </table>
    </div>
        <button class="btn" onclick="history.back()">
    OK
</button>

</body>
</html>