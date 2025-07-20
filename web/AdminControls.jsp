<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Movie/Game Management</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f5f7fa, #c4dff6);
            padding: 20px;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 32px;
        }

        .wrapper {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            max-width: 1200px;
            margin: 0 auto;
            gap: 20px;
        }

        .container {
            width: 70%;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .earnings-section {
            width: 25%;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative; /* Positioning for pseudo-elements */
        }

        .earnings-section::before {
            content: '';
            position: absolute;
            top: 10px;
            right: 10px;
            width: 60%;
            height: 80%;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            z-index: 0;
        }

        .earnings-section h3 {
            font-size: 26px;
            margin-bottom: 10px;
            z-index: 1; /* Ensure text is above pseudo-element */
            position: relative;
        }

        .earnings-section .earnings-value {
            font-size: 48px;
            font-weight: bold;
            margin-top: 10px;
            z-index: 1; /* Ensure text is above pseudo-element */
        }

        .container h2 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 20px;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: #34495e;
        }

        input, select {
           width :100%; 
           padding :12px; 
           margin-bottom :20px; 
           border :2px solid #dcdde1; 
           border-radius :8px; 
           font-size :16px; 
           transition :border-color .3s; 
       }

       input[type="radio"] {
           margin-right: 5px; 
       }

       button {
           width :100%; 
           padding :15px; 
           background-color :#3498db; 
           color:white; 
           border:none; 
           border-radius :10px; 
           font-size :18px; 
           cursor:pointer; 
           transition :background-color .3s ease , transform .1s ease; 
       }

       button:hover {
           background-color:#2980b9; 
       }
       
       button :active {
           transform :scale(.98); 
       }
       
       /* Media queries for responsive design */
       @media (max-width :768px) {
           .wrapper {
               flex-direction :column; 
               align-items:center; 
           }
           
           .container , .earnings-section {
               width :100%; 
           }
           
           h1 {
               font-size :28px; 
           }
       }
    </style>
</head>
<body>

    <h1>Admin Panel - Movie/Game Management</h1>

    <div class="wrapper">
        <!-- Form Section for Adding Movie/Game -->
        <div class="container">
             <h2>Add Movie/Game Details</h2>
             <form action="ControllerServlet" method="POST">
                <input type="hidden" name="Value" value="AdminControls">
                <label for="name">Name of Movie/Game:</label>
                <input type="text" id="name" name="name" required placeholder="Enter Movie/Game Name">

                <label for="movie-id">Movie/Game ID:</label>
                <input type="text" id="movie-id" name="movie_id" required placeholder="Enter Unique ID">

                <label for="movie-date">Movie/Game Date:</label>
                <input type="date" id="movie-date" name="movie_date" required>

                <label for="start-time">Start Time:</label>
                <input type="time" id="start-time" name="start_time" required placeholder="e.g., 12:00 PM">

                <label for="end-time">End Time:</label>
                <input type="time" id="end-time" name="end_time" required placeholder="e.g., 02:00 PM">

                <label for="venue">Venue:</label>
                <input type="text" id="venue" name="venue" required placeholder="Enter Venue">

                <label for="ticket-price">Ticket Price:</label>
                <input type="number" id="ticket-price" name="ticket_price" required min="1" placeholder="Enter Ticket Price">

                <label for="tickets-available">Tickets Available:</label>
                <input type="number" id="tickets-available" name="tickets_available" required min="1" placeholder="Enter Available Tickets">

                <!-- Radio Buttons for Game/Movie Selection -->
                <fieldset style='border:none; display:flex; align-items:center;'>
                    <legend style='font-weight:bold;'>Type:</legend>
                    <label style='margin-right:20px;'>
                        <input type='radio' name='type' value='game' required> Game
                    </label>
                    <label>
                        <input type='radio' name='type' value='movie'> Movie
                    </label>
                </fieldset>

                <button type="submit" name="action" value="add">Add Movie/Game</button>
             </form>
         </div>

         <!-- Earnings Section -->
         <div class="earnings-section">
             <h3>Total Earnings Today:</h3>
             <div class="earnings-value" id="earnings">
             </div>
         </div>
         
         <div>
         <center>
          <br>
          <%
              String message1 = (String)session.getAttribute("AdminInsertMsg");
              if(message1 != null){
          %>
      <strong style="color:red"><%out.print(message1);}%></strong></center>
         </div>
     </div>

</body>
</html>
