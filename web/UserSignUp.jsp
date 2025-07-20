<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup Page</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #dd5e89, #f7bb97); /* Gradient background */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 40px;
      max-width: 400px;
      width: 100%;
    }

    .signup-form h2 {
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
    
    .back-to-login {
      text-align: center;
      margin-top: 20px;
    }

    .back-to-login a {
      color: #007bff;
      text-decoration: none;
      font-size: 14px;
    }

    .back-to-login a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="signup-form">
      <h2>Create an Account</h2>
      <form action="ControllerServlet" method="POST">
        <input type="hidden" name="Value" value="UserSignup">
        <div class="form-group">
          <label for="username">Username</label>
          <input type="text" id="susername" name="susername" required>
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="semail" name="semail" required>
        </div>
        <div class="form-group">
          <label for="mobile">Mobile Number</label>
          <input type="tel" id="smobile" name="smobile" required 
                 pattern="[0-9]{10}" 
                 maxlength="10" 
                 minlength="10" 
                 title="Please enter a valid 10-digit mobile number">
        </div>
        <div class="form-group">
          <label for="age">Age</label>
          <input type="number" id="sage" name="sage" required>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="spassword" name="spassword" required>
        </div>
        <div class="form-group">
          <label for="confirm-password">Confirm Password</label>
          <input type="password" id="sconfirm-password" name="sconfirm-password" required>
        </div>
        <button type="submit">Sign Up</button>
      </form>
      <center>
          <br>
          <%
              String message2 = (String)session.getAttribute("SignUpFailedMsg");
              String message3 = (String)session.getAttribute("InputMismatch");
              if(message2 != null || message3 != null){
              if(message2 != null){
          %>
      <p><%out.print(message2);}else if(message3 != null){%></p>
      <p><%out.print(message3);}}%></p></center>
      <div class="back-to-login">
        <p><a href="Login.jsp">Back to User Login</a></p>
      </div>
    </div>
  </div>
</body>
</html>
