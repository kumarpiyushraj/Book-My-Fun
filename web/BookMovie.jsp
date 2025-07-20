<%@page import="dao.DBHelper"%>
<%@page import="pojo.Movie"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking</title>
    <style>
        /* General body and layout styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('images/12.jpg');
            color: #333;
            margin: 0;
            padding: 0px;
            padding-top: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 100vh;
            overflow: hidden;
        }

        h1 {
            text-align: center;
            margin: 20px;
            color: #2c3e50;
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
            width: 90%;
            max-width: 1200px;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #34495e;
            color: white;
        }

        td {
            color: #2c3e50;
        }

        /* Button styling */
        .submit-btn {
            padding: 12px 24px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 20px;
            display: block;
            width: 220px;
            text-align: center;
            margin: 20px auto;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #2980b9;
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
            padding-top: 60px;
            animation: fadeIn 0.5s;
        }

        /* Modal fade-in animation */
        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 90%;
            max-width: 500px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

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

        /* Input fields */
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        /* Responsive adjustments */
        @media only screen and (max-width: 768px) {
            table, th, td {
                display: block;
                width: 100%;
                text-align: center;
            }

            th {
                display: none;
            }

            td {
                border: none;
                position: relative;
                padding-left: 50%;
            }

            td:before {
                position: absolute;
                top: 50%;
                left: 10px;
                transform: translateY(-50%);
                white-space: nowrap;
                font-weight: bold;
            }

            td:nth-of-type(1):before { content: "Movie Title"; }
            td:nth-of-type(2):before { content: "Start Time"; }
            td:nth-of-type(3):before { content: "End Time"; }
            td:nth-of-type(4):before { content: "Date"; }
            td:nth-of-type(5):before { content: "Venue"; }
            td:nth-of-type(6):before { content: "Available Seats"; }
            td:nth-of-type(7):before { content: "Movie ID"; }
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
        
         // Close modal on form submit
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelector("#bookingModal form").addEventListener("submit", function(){
            closeModal();
        });
    });
        //Close the modal when clicking anywhere outside of it
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
        
    <h1>Book Your Movie</h1>

    <!-- Movie Table -->
    <%
                List<Movie> movies = DBHelper.getInstance().executeMovieSearch();
                if(movies.isEmpty()){
                %>
        <h2 style="color:red">Currently No Movies Available For Booking</h2>
                <%
                }
else{
                for (Movie movie : movies) {
            %>
    <table>
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Movie Title</th>
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
                    <td><%= movie.getmovieId() %></td>
                    <td><%= movie.getmovieName() %></td>
                    <td><%= movie.getmovieStartTime() %></td>
                    <td><%= movie.getmovieEndTime() %></td>
                    <td><%= movie.getmovieDate() %></td>
                    <td><%= movie.getvenue() %></td>
                    <td><%= movie.getTicketPrice()  %></td>
                    <td><%= movie.getTicketAvl()%></td>
                </tr>
        </tbody>
    </table>

    <!-- Button to Open Booking Modal -->
    <button class="submit-btn" onclick="openModal()">Proceed to Booking</button>
    
            <%
                }}
            %>

    <!-- Booking Modal -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Booking</h2>
            <form action="ControllerServlet" method="post">
                 <input type="hidden" name="Value" value="BookMovie">
                <label for="movieId">Enter Movie ID:</label>
                <input type="text" id="movieId" name="movieId" required>

                <label for="seats">Number of Tickets:</label>
                <input type="number" id="Movietickets" name="Movietickets" min="1" required>

                <button type="submit" class="submit-btn">Proceed to Payment</button>
            </form>
        </div>
    </div>
    <div>
       <center>
          <br>
          <%
              String message1 = (String)session.getAttribute("MvBookingFailed");
              if(message1 != null){
          %>
      <strong style="color:red"><%out.print(message1);}%></strong></center>
    </div>

</body>
</html>