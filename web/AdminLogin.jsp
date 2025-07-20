<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
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

    .admin-form h2 {
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
      background-color: #dc3545;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #c82333;
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
    <div class="admin-form">
      <h2>Admin Login</h2>
      <form action="ControllerServlet" method="post">
          <input type="hidden" name="Value" value="AdminLogin">
        <div class="form-group">
          <label for="admin-username">Admin Username</label>
          <input type="text" id="admin-username" name="admin-username" required>
        </div>
        <div class="form-group">
          <label for="admin-password">Admin Password</label>
          <input type="password" id="admin-password" name="admin-password" required>
        </div>
        <button type="submit">Login as Admin</button>
      </form>
      <center>
          &nbsp;
  <%
       String message1 = (String)session.getAttribute("Findresult");
       String message2 = (String)session.getAttribute("AdminLogin");
      if(message2 != null){
  %>
      <p><%out.print(message2);}else if(message1 != null){%></p>
      <p><%out.print(message1);}%></p></center>
      <div class="back-to-login">
        <p><a href="Login.jsp">Back to User Login</a></p>
      </div>
    </div>
  </div>
</body>
</html>
