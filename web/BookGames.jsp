<%@page import="pojo.Game"%>
<%@page import="dao.DBHelper"%>
<%@page import="pojo.Movie"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Booking</title>
    <style>
        /* General styles for body */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('images/02.jpg');
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
            font-weight: bolder;
            font-size: 40px;
        }

        
        .header-container {
            flex: 0 0 auto; /* Fixed height for header */
        }
        
        button {
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        
        /* Table styling */
        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td {
            color: #495057;
        }

        /* Center button styling */
        .center-button {
            display: flex;
            justify-content: center;
            margin-top: 20px; /* Space above the button */
        }

        .submit-btn {
            padding: 12px 24px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .submit-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
            padding-top: 60px; /* Location of the box */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: 20px auto; /* Adjust margin for top positioning */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            max-width: 500px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            position: absolute; /* Change to absolute */
            top: 20px; /* Position it 20px from the top */
            left: 50%; /* Center it horizontally */
            transform: translateX(-50%); /* Adjust to truly center it */
        }

        /* Close button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #333;
            text-decoration: none;
            cursor: pointer;
        }

        /* Input styling */
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 4px;
            border: 1px solid #ced4da;
            box-sizing: border-box;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            table, th, td {
                display: block;
                width: 100%;
                text-align: left;
            }

            th {
                display: none; /* Hide header for smaller screens */
            }

            td {
                position: relative;
                padding-left: 50%; /* Add padding for labels */
                text-align: left;
            }

            td:before {
                position: absolute;
                left: 10px;
                white-space: nowrap;
                font-weight: bold;
                font-size: 0.9rem;
                color: #6c757d;
            }

            td:nth-of-type(1):before { content: "Game Name"; }
            td:nth-of-type(2):before { content: "Start Time"; }
            td:nth-of-type(3):before { content: "End Time"; }
            td:nth-of-type(4):before { content: "Date"; }
            td:nth-of-type(5):before { content: "Venue"; }
            td:nth-of-type(6):before { content: "Available Seats"; }
            td:nth-of-type(7):before { content: "Game ID"; }
            td:nth-of-type(8):before { content: "Ticket Price"; }
        }
    </style>
    <script>
        // Function to open the modal
        function openModal() {
            document.getElementById("bookingModal").style.display = "block";
        }

        // Function to close the modal
        function closeModal() {
            document.getElementById("bookingModal").style.display = "none";
        }

        // Close the modal when clicking anywhere outside of it
//        window.onclick = function(event) {
//            var modal = document.getElementById("bookingModal");
//            if (event.target === modal) {
//                modal.style.display = "none";
//            }
//        }
    </script>
</head>
<body> 
    <!-- Header -->
        <div class="header-container">
            <jsp:include page="header.jsp" />
        </div>

    <h1>Book Your Game</h1>

    <!-- Game Table -->
            <%
                List<Game> games = DBHelper.getInstance().executeGameSearch();
                if(games.isEmpty()){
                %>
        <h2 style="color:white">Currently No Games Available For Booking</h2>
        <%
                }
else{
                for (Game gm : games) {
            %>
    <table>
        <thead>
            <tr>
                <th>Game ID</th>
                <th>Game Name</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Date</th>
                <th>Venue</th>
                <th>Ticket Price</th>
                <th>Available Seats</th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td><%= gm.getGameId() %></td>
                    <td><%= gm.getGameName() %></td>
                    <td><%= gm.getGameStarttime() %></td>
                    <td><%= gm.getGameEndtime() %></td>
                    <td><%= gm.getGameDate() %></td>
                    <td><%= gm.getVenue() %></td>
                    <td><%= gm.getTicketAvl() %></td>
                    <td><%= gm.getTicketPrice() %></td>
                </tr>
        </tbody>
    </table>

    <!-- Center Button to Open Booking Modal -->
    <div class="center-button">
        <button class="submit-btn" onclick="openModal()">Proceed to Booking</button>
    </div>
            <%
                }}
            %>

    <!-- Booking Modal -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Booking</h2>
            <form action="ControllerServlet" method="post">
                <input type="hidden" name="Value" value="BookGame">
                <label for="gameId">Enter Game ID:</label>
                <input type="text" id="gameId" name="gameId" required>

                <label for="seats">Number of Tickets:</label>
                <input type="number" id="Gametickets" name="Gametickets" min="1" required>

               <button type="submit" class="submit-btn">Proceed to Payment</button>
            </form>
        </div>
    </div>
    <div>
       <center>
          <br>
          <%
              String message1 = (String)session.getAttribute("GmBookingFailed");
              if(message1 != null){
          %>
      <strong style="color:red"><%out.print(message1);}%></strong></center>
    </div>

</body>
</html>