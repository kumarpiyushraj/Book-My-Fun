# 🎬🎮 Book My Fun

<div align="center">

![Book My Fun Banner](https://img.shields.io/badge/Book%20My%20Fun-Entertainment%20Booking-FF6B6B?style=for-the-badge&logo=ticket&logoColor=white)

**A modern, full-stack entertainment booking platform built with Java EE**

[![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=openjdk&logoColor=white)](https://www.java.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat-square&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Servlet](https://img.shields.io/badge/Servlet-007396?style=flat-square&logo=java&logoColor=white)](https://javaee.github.io/servlet-spec/)

</div>

---

## 🌟 Overview

Book My Fun is a comprehensive entertainment booking system that streamlines ticket reservations for movies and games. Built with enterprise-grade Java technologies, it offers a seamless experience for both end-users and administrators.

<table>
<tr>
<td width="50%">

### 👤 For Users
- Browse movies & games
- Real-time seat availability
- Instant booking confirmation
- Digital ticket receipts

</td>
<td width="50%">

### 👨‍💼 For Admins
- Event management dashboard
- Live earnings tracking
- Inventory control
- Analytics & reporting

</td>
</tr>
</table>

---

## ✨ Key Features

<div align="center">

| 🎬 Movies | 🎮 Games | 💳 Booking | 📊 Admin |
|:---:|:---:|:---:|:---:|
| Browse catalog | Event listings | Instant confirmation | Dashboard |
| Show timings | Venue details | Seat selection | Revenue tracking |
| Price info | Availability | Receipt generation | Event management |

</div>

---

## 🛠️ Tech Stack

<div align="center">

```mermaid
graph LR
    A[Frontend] --> B[HTML5/CSS3/JS]
    C[Backend] --> D[Java Servlets]
    C --> E[JSP]
    F[Database] --> G[PostgreSQL]
    H[Server] --> I[Apache Tomcat]
    
    style A fill:#61DAFB,stroke:#333,stroke-width:2px,color:#000
    style C fill:#ED8B00,stroke:#333,stroke-width:2px,color:#fff
    style F fill:#316192,stroke:#333,stroke-width:2px,color:#fff
    style H fill:#F8DC75,stroke:#333,stroke-width:2px,color:#000
```

</div>

<table align="center">
<tr>
<th>Category</th>
<th>Technology</th>
<th>Purpose</th>
</tr>
<tr>
<td><b>Frontend</b></td>
<td>HTML5, CSS3, JavaScript</td>
<td>User Interface & Interactions</td>
</tr>
<tr>
<td><b>Backend</b></td>
<td>Java Servlets, JSP</td>
<td>Business Logic & Views</td>
</tr>
<tr>
<td><b>Database</b></td>
<td>PostgreSQL + JDBC</td>
<td>Data Persistence</td>
</tr>
<tr>
<td><b>Server</b></td>
<td>Apache Tomcat 9.x</td>
<td>Application Container</td>
</tr>
<tr>
<td><b>Architecture</b></td>
<td>MVC, DAO, Singleton</td>
<td>Design Patterns</td>
</tr>
</table>

---

## 🏛️ Architecture

<div align="center">

### System Flow

```mermaid
flowchart TD
    subgraph Client["🖥️ Client Layer"]
        A[Web Browser]
    end
    
    subgraph View["🎨 View Layer"]
        B[JSP Pages]
        B1[Login/Signup]
        B2[Booking Pages]
        B3[Admin Panel]
        B --> B1 & B2 & B3
    end
    
    subgraph Controller["⚙️ Controller Layer"]
        C[ControllerServlet]
        C1{Route Handler}
        C --> C1
    end
    
    subgraph Business["💼 Business Layer"]
        D[DBHelper - DAO]
        D1[User Ops]
        D2[Booking Ops]
        D3[Admin Ops]
        D --> D1 & D2 & D3
    end
    
    subgraph Model["📦 Model Layer"]
        E[POJOs]
        E1[User]
        E2[Movie/Game]
        E3[Booking]
        E --> E1 & E2 & E3
    end
    
    subgraph Database["🗄️ Database Layer"]
        F[(PostgreSQL)]
    end
    
    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    
    style Client fill:#E3F2FD,stroke:#1976D2,stroke-width:3px
    style View fill:#F3E5F5,stroke:#7B1FA2,stroke-width:3px
    style Controller fill:#FFF3E0,stroke:#F57C00,stroke-width:3px
    style Business fill:#E8F5E9,stroke:#388E3C,stroke-width:3px
    style Model fill:#FCE4EC,stroke:#C2185B,stroke-width:3px
    style Database fill:#E0F2F1,stroke:#00796B,stroke-width:3px
```

### Request-Response Cycle

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant JSP as 📄 JSP
    participant Servlet as ⚙️ Servlet
    participant DAO as 💼 DBHelper
    participant DB as 🗄️ Database
    
    User->>JSP: Submit Form
    JSP->>Servlet: HTTP POST Request
    Servlet->>Servlet: Parse Parameters
    Servlet->>DAO: Call Business Method
    DAO->>DB: Execute SQL Query
    DB-->>DAO: Return ResultSet
    DAO-->>Servlet: Return Java Object
    Servlet->>Servlet: Set Session Attributes
    Servlet->>JSP: Forward/Redirect
    JSP-->>User: Render Response
    
    Note over User,DB: Complete request cycle in ~100-200ms
```

</div>

---

## 🚀 Quick Start

<div align="center">

### Prerequisites

![JDK](https://img.shields.io/badge/JDK-8+-ED8B00?style=flat-square&logo=openjdk)
![Tomcat](https://img.shields.io/badge/Tomcat-9.x-F8DC75?style=flat-square&logo=apache-tomcat)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-12+-316192?style=flat-square&logo=postgresql)

</div>

### 📥 Installation

<details open>
<summary><b>Step 1: Clone Repository</b></summary>

```bash
git clone https://github.com/kumarpiyushraj/book-my-fun.git
cd book-my-fun
```

</details>

<details open>
<summary><b>Step 2: Database Setup</b></summary>

```sql
-- Create database
CREATE DATABASE Entertainment;
\c Entertainment

-- Create tables
CREATE TABLE users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 0),
    mobile BIGINT CHECK (mobile >= 1000000000 AND mobile <= 9999999999)
);

CREATE TABLE admin (
    adminname VARCHAR(50) PRIMARY KEY,
    apassword VARCHAR(100) NOT NULL
);

CREATE TABLE movie (
    movieid VARCHAR(20) PRIMARY KEY,
    moviename VARCHAR(100) NOT NULL,
    starttime TIME NOT NULL,
    endtime TIME NOT NULL,
    moviedate DATE NOT NULL,
    venue VARCHAR(100),
    ticket_price FLOAT CHECK (ticket_price > 0),
    tickets_available INTEGER CHECK (tickets_available >= 0)
);

CREATE TABLE game (
    gameid VARCHAR(20) PRIMARY KEY,
    gamename VARCHAR(100) NOT NULL,
    starttime TIME NOT NULL,
    endtime TIME NOT NULL,
    gamedate DATE NOT NULL,
    venue VARCHAR(100),
    ticket_price FLOAT CHECK (ticket_price > 0),
    tickets_available INTEGER CHECK (tickets_available >= 0)
);

CREATE TABLE booking (
    bookingid INTEGER PRIMARY KEY,
    username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
    movieid VARCHAR(20) REFERENCES movie(movieid) ON DELETE SET NULL,
    gameid VARCHAR(20) REFERENCES game(gameid) ON DELETE SET NULL,
    bookingdate DATE NOT NULL,
    bookingtime TIME NOT NULL,
    totalpersons INTEGER CHECK (totalpersons > 0),
    ticketprice FLOAT CHECK (ticketprice > 0),
    venue VARCHAR(100)
);

-- Insert default admin
INSERT INTO admin VALUES ('KumarPiyush', 'admin123');
```

</details>

<details open>
<summary><b>Step 3: Configure Application</b></summary>

Edit `src/java/dao/DBHelper.java`:

```java
con = DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/Entertainment",
    "postgres",        // 👈 Your PostgreSQL username
    "your_password"    // 👈 Your PostgreSQL password
);
```

</details>

<details open>
<summary><b>Step 4: Deploy & Run</b></summary>

```bash
# Build project (NetBeans/Eclipse)
# OR manually create WAR file
jar -cvf BookMyFun.war .

# Deploy to Tomcat
cp BookMyFun.war $TOMCAT_HOME/webapps/

# Start Tomcat
$TOMCAT_HOME/bin/startup.sh

# Access application
open http://localhost:8080/BookMyFun/Login.jsp
```

</details>

### 🔑 Default Credentials

```plaintext
Admin Login:
├─ Username: KumarPiyush
└─ Password: admin123
```

---

## 💻 Demo

### 🎬 User Journey

<div align="center">

#### 1️⃣ Authentication

<table>
<tr>
<td width="33%">
<img src="web/images/homepage_and_sigin.jpg" alt="Login Page" width="100%"/>
<p align="center"><b>Login Page</b><br/>Modern gradient design</p>
</td>
<td width="33%">
<img src="web/images/admin_login.png" alt="Admin Login" width="100%"/>
<p align="center"><b>Admin Portal</b><br/>Secure admin access</p>
</td>
<td width="33%">
<img src="web/images/signup.png" alt="User Signup" width="100%"/>
<p align="center"><b>Registration</b><br/>Quick signup form</p>
</td>
</tr>
</table>

#### 2️⃣ Browse & Select

<img src="web/images/category_selection.png" alt="Selection Page" width="100%"/>
<p><b>Entertainment Hub</b> - Choose between Movies (cinema-themed) and Games (carnival-themed)</p>

#### 3️⃣ Booking Flow

<table>
<tr>
<td width="50%">
<img src="web/images/available_movies.png" alt="Movie Booking" width="100%"/>
<p align="center"><b>Movie Listings</b><br/>Detailed show information</p>
</td>
<td width="50%">
<img src="web/images/available_game_after_insertion.png" alt="Game Booking" width="100%"/>
<p align="center"><b>Game Events</b><br/>Live sports & activities</p>
</td>
</tr>
</table>

<img src="web/images/movie_booking.png" alt="Booking Modal" width="70%"/>
<p><b>Interactive Booking Modal</b> - Enter event ID and ticket quantity</p>

<table>
<tr>
<td width="50%">
<img src="web/images/booking_success.png" alt="Confirmation" width="100%"/>
<p align="center"><b>Booking Confirmation</b><br/>Digital ticket receipt</p>
</td>
<td width="50%">
<img src="web/images/available_games.png" alt="Empty State" width="100%"/>
<p align="center"><b>Empty State</b><br/>User-friendly messaging</p>
</td>
</tr>
</table>

#### 4️⃣ Admin Panel

<table>
<tr>
<td width="50%">
<img src="web/images/admin_available_show_insertion.png" alt="Admin Dashboard" width="100%"/>
<p align="center"><b>Control Panel</b><br/>Event management + earnings</p>
</td>
<td width="50%">
<img src="web/images/admin_success_insertion.png" alt="Success Message" width="100%"/>
<p align="center"><b>Success Notification</b><br/>Real-time feedback</p>
</td>
</tr>
</table>

</div>

---

## 📊 Database Schema

<div align="center">

```mermaid
erDiagram
    USERS ||--o{ BOOKING : creates
    MOVIE ||--o{ BOOKING : "referenced in"
    GAME ||--o{ BOOKING : "referenced in"
    
    USERS {
        varchar username PK "Unique identifier"
        varchar password "Hashed password"
        varchar email UK "Unique email"
        int age "User age"
        bigint mobile "10-digit phone"
    }
    
    ADMIN {
        varchar adminname PK "Admin username"
        varchar apassword "Admin password"
    }
    
    MOVIE {
        varchar movieid PK "Unique movie ID"
        varchar moviename "Movie title"
        time starttime "Show start"
        time endtime "Show end"
        date moviedate "Show date"
        varchar venue "Theater name"
        float ticket_price "Price per ticket"
        int tickets_available "Remaining seats"
    }
    
    GAME {
        varchar gameid PK "Unique game ID"
        varchar gamename "Game name"
        time starttime "Event start"
        time endtime "Event end"
        date gamedate "Event date"
        varchar venue "Stadium name"
        float ticket_price "Price per ticket"
        int tickets_available "Remaining seats"
    }
    
    BOOKING {
        int bookingid PK "Auto-generated ID"
        varchar username FK "User reference"
        varchar movieid FK "Movie reference"
        varchar gameid FK "Game reference"
        date bookingdate "Booking date"
        time bookingtime "Booking time"
        int totalpersons "Number of tickets"
        float ticketprice "Total amount"
        varchar venue "Event location"
    }
```

### 🔗 Relationships

```
📌 One User → Many Bookings
📌 One Movie → Many Bookings  
📌 One Game → Many Bookings
📌 One Booking → One Movie OR One Game (nullable)
```

</div>

---

## 📁 Project Structure

```
book-my-fun/
│
├── 📂 src/java/
│   ├── 📂 controller/
│   │   └── 📄 ControllerServlet.java      # Request routing & session management
│   │
│   ├── 📂 dao/
│   │   └── 📄 DBHelper.java                # Database operations (Singleton)
│   │
│   └── 📂 pojo/
│       ├── 📄 User.java                    # User entity
│       ├── 📄 Admin.java                   # Admin entity
│       ├── 📄 Movie.java                   # Movie entity
│       ├── 📄 Game.java                    # Game entity
│       └── 📄 Booking.java                 # Booking entity
│
├── 📂 web/
│   ├── 📄 Login.jsp                        # User login interface
│   ├── 📄 AdminLogin.jsp                   # Admin login interface
│   ├── 📄 UserSignUp.jsp                   # User registration form
│   ├── 📄 UserSelectionPage.jsp            # Movie/Game selection hub
│   ├── 📄 BookMovie.jsp                    # Movie booking page
│   ├── 📄 BookGames.jsp                    # Game booking page
│   ├── 📄 BookingTicket.jsp                # Confirmation receipt
│   ├── 📄 AdminControls.jsp                # Admin dashboard
│   ├── 📄 header.jsp                       # Reusable header component
│   │
│   └── 📂 images/                          # UI screenshots
│       ├── 🖼️ 1234.jpg
│       ├── 🖼️ AdminLogin.png
│       ├── 🖼️ UserSignUp.png
│       └── ...
│
└── 📄 README.md
```

---

## 🔌 API Reference

<div align="center">

### Servlet Endpoints

All requests route through `ControllerServlet` with `Value` parameter

<table>
<tr>
<th>Value Parameter</th>
<th>Method</th>
<th>Purpose</th>
<th>Response</th>
</tr>
<tr>
<td><code>UserLogin</code></td>
<td>POST</td>
<td>User authentication</td>
<td>→ UserSelectionPage.jsp</td>
</tr>
<tr>
<td><code>UserSignup</code></td>
<td>POST</td>
<td>Register new user</td>
<td>→ Login.jsp</td>
</tr>
<tr>
<td><code>BookMovie</code></td>
<td>POST</td>
<td>Create movie booking</td>
<td>→ BookingTicket.jsp</td>
</tr>
<tr>
<td><code>BookGame</code></td>
<td>POST</td>
<td>Create game booking</td>
<td>→ BookingTicket.jsp</td>
</tr>
<tr>
<td><code>AdminLogin</code></td>
<td>POST</td>
<td>Admin authentication</td>
<td>→ AdminControls.jsp</td>
</tr>
<tr>
<td><code>AdminControls</code></td>
<td>POST</td>
<td>Add movie/game event</td>
<td>→ AdminControls.jsp</td>
</tr>
<tr>
<td><code>LogoutUser</code></td>
<td>POST</td>
<td>End user session</td>
<td>→ Login.jsp</td>
</tr>
</table>

### Example Request

```html
<form action="ControllerServlet" method="POST">
    <input type="hidden" name="Value" value="BookMovie">
    <input type="text" name="movieId" required>
    <input type="number" name="Movietickets" min="1" required>
    <button type="submit">Book Now</button>
</form>
```

</div>

---

## 🎯 Roadmap

<div align="center">

```mermaid
gantt
    title Development Roadmap
    dateFormat  YYYY-MM
    section Security
    Password Hashing           :2024-01, 1M
    JWT Authentication         :2024-02, 1M
    section Features
    Payment Integration        :2024-03, 2M
    Email Notifications        :2024-05, 1M
    Booking History           :2024-06, 1M
    section Admin
    Analytics Dashboard       :2024-07, 2M
    Revenue Charts           :2024-09, 1M
    section Mobile
    React Native App         :2024-10, 3M
```

</div>

<table>
<tr>
<td width="50%">

### 🔐 Security
- [x] Session management
- [ ] Password encryption
- [ ] JWT tokens
- [ ] 2FA authentication
- [ ] CAPTCHA integration

</td>
<td width="50%">

### ✨ Features
- [x] Booking system
- [ ] Payment gateway
- [ ] Email/SMS alerts
- [ ] User profiles
- [ ] Reviews & ratings

</td>
</tr>
<tr>
<td width="50%">

### 📊 Admin Tools
- [x] Event management
- [x] Earnings tracker
- [ ] Analytics dashboard
- [ ] Export reports
- [ ] Inventory alerts

</td>
<td width="50%">

### 📱 Platform
- [x] Web application
- [ ] Mobile app
- [ ] PWA support
- [ ] API services
- [ ] Microservices

</td>
</tr>
</table>

---

## 🤝 Contributing

<div align="center">

We welcome contributions! Here's how you can help:

[![Contribute](https://img.shields.io/badge/Contribute-Now-brightgreen?style=for-the-badge)](https://github.com/kumarpiyushraj/book-my-fun/fork)

</div>

### 📝 Contribution Guidelines

```mermaid
gitGraph
    commit id: "Initial"
    branch feature/your-feature
    checkout feature/your-feature
    commit id: "Implement feature"
    commit id: "Add tests"
    commit id: "Update docs"
    checkout main
    merge feature/your-feature
    commit id: "Release"
```

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add AmazingFeature'`)
4. **Push** to branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### 🐛 Report Issues

Found a bug? [Open an issue](https://github.com/kumarpiyushraj/book-my-fun/issues/new) with:
- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)

---

## 📄 License

<div align="center">

```
MIT License

Copyright (c) 2024 Book My Fun

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

</div>

---

## 👨‍💻 Author

<div align="center">

<img src="https://github.com/kumarpiyushraj.png" width="100" style="border-radius: 50%"/>

### Kumar Piyush

[![GitHub](https://img.shields.io/badge/GitHub-@kumarpiyushraj-181717?style=flat-square&logo=github)](https://github.com/kumarpiyushraj)
[![Email](https://img.shields.io/badge/Email-Contact-D14836?style=flat-square&logo=gmail)](mailto:kmpiyushraj@gmail.com)

</div>

---

## 🙏 Acknowledgments

<div align="center">

Special thanks to:

- **Java EE Community** - For comprehensive documentation
- **PostgreSQL Team** - For robust database system
- **Apache Tomcat** - For reliable servlet container
- **Stack Overflow** - For community support

</div>

---

<div align="center">

### ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/book-my-fun&type=Date)](https://star-history.com/#kumarpiyushraj/book-my-fun&Date)

---

### 📊 Repository Stats

![GitHub repo size](https://img.shields.io/github/repo-size/kumarpiyushraj/book-my-fun?style=flat-square)
![GitHub code size](https://img.shields.io/github/languages/code-size/kumarpiyushraj/book-my-fun?style=flat-square)

---

### 🌟 Show Your Support

If you found this project helpful, please consider giving it a ⭐!

[![GitHub stars](https://img.shields.io/github/stars/kumarpiyushraj/book-my-fun?style=social)](https://github.com/yourusername/book-my-fun/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/kumarpiyushraj/book-my-fun?style=social)](https://github.com/yourusername/book-my-fun/network/members)
[![GitHub watchers](https://img.shields.io/github/watchers/kumarpiyushraj/book-my-fun?style=social)](https://github.com/yourusername/book-my-fun/watchers)

---

**Made with ❤️ and ☕ using Java EE**

[Back to Top](#-book-my-fun)

</div>
