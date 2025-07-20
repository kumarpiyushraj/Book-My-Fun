<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-image: url('images/1234.jpg');
      background-size: cover; /* Ensures the image covers the entire background */
      background-position: center; /* Centers the background image */
      background-repeat: no-repeat; /* Prevents the image from repeating */
      background-attachment: fixed; /* Ensures the background image stays fixed during scrolling */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      position: relative; /* Needed for absolute positioning of the title */
    }

    .container {
      background-color: rgba(255, 255, 255, 0.7); /* Added transparency to the form background */
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
      max-width: 400px;
      width: 100%;
      margin-top: 50px;
      position: relative; /* Keep the container relative for the title positioning */
      z-index: 1; /* Ensures the container is above the title */
    }

    /* Title styling */
/*    .title {
      position: absolute;  Position it absolutely within the body 
      top: 50px;  Adjust as needed 
      left: 50%;  Center horizontally 
      transform: translateX(-50%);  Offset the position by half its width 
      font-size: 60px;  Large font size 
      color: white;  White color for the title 
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);  Add shadow for better readability 
      text-align: center;  Center text alignment 
      z-index: 0;  Make sure it's below the container 
    }*/
    
.title {
    position: absolute;  
      top: 50px;  
      left: 50%; 
      transform: translateX(-50%);
      width: max-content;
      padding: 0px 10px 5px 10px;
    font-size: 100px;
    color: whitesmoke;
    font-family: western;
    text-align: center;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    z-index: 0;
}

    .login-form h2 {
      margin-bottom: 20px;
      font-size: 24px;
      color: #333;
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-size: 14px;
      color: #555;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ddd;
      border-radius: 5px;
      border: 1px solid darkgrey;
    }

    button {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      color: #fff;
      background-color: #007bff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #0056b3;
    }

    .signup-link {
      text-align: center;
      margin-top: 20px;
    }

    .signup-link a {
      color: #007bff;
      text-decoration: none;
      font-size: 14px;
    }

    .signup-link a:hover {
      text-decoration: underline;
    }

    /* Admin login button */
    .admin-section {
      text-align: center;
      margin-top: 20px;
    }

    .admin-section label {
      display: block;
      padding: 10px;
      background-color: #007bff;
      color: white;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .admin-section label:hover {
      background-color: #c82333;
    }
    
    .login-form{
        border: 1.5px solid black;
        border-radius: 10px;
        background: lightgrey;
        padding: 30px 30px 30px 30px;
    }
  </style>
</head>
<body>
  <div class="title">Book My Fun</div> <!-- Title Positioned on Background -->
  <div class="container">
    <div class="login-form">
      <h2>Login to Your Account</h2>
      <form action="ControllerServlet" method="post">
        <input type="hidden" name="Value" value="UserLogin">
        <div class="form-group">
          <label for="user-username">Username</label>
          <input type="text" id="user-username" name="user-username" required>
        </div>
        <div class="form-group">
          <label for="user-password">Password</label>
          <input type="password" id="user-password" name="user-password" required>
        </div>
        <button type="submit">Login</button>
      </form>
      <center>
          <br>
          <%
              String message1 = (String)session.getAttribute("Findresult");
              String message2 = (String)session.getAttribute("UserLogin");
              if(message1 != null || message2 != null){
              if(message2 != null){
          %>
      <strong style="color:red"><%out.print(message2);}else if(message1 != null){%></strong>
      <strong style="color:red"><%out.print(message1);}}%></strong></center>
      <div class="signup-link">
        <p>Don't have an account? <a href="UserSignUp.jsp">Sign Up</a></p>
      </div>

      <!-- Admin login section -->
      <div class="admin-section">
        <label onclick="location.href='AdminLogin.jsp'">Admin Login</label>
      </div>
    </div>
  </div>
</body>
</html>
