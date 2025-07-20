<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies and Games</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: sans-serif;
        }

        .page-wrapper {
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
            overflow: hidden;
            height: 100vh;
        }

        .header-container {
            flex: 0 0 auto; /* Fixed height for header */
        }

        .content {
            flex: 1;
            display: flex;
            flex-direction: row; /* Side-by-side layout */
        }

        .section {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
            overflow: hidden;
/*            transition: transform 0.5s ease;*/
        }

/*        .section:hover {
            transform: scale(1.02);
        }*/

        .movies {
            background-image: url('images/12345.jpg');
        }

        .sports {
            background-image: url('images/03.jpg');
        }

        h1 {
            margin-bottom: 20px;
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

        .movies button {
            background-color: #3498db;
        }

        .sports button {
            background-color: #e74c3c;
        }

        .movies button:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .sports button:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        .tagline {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s ease;
            font-size: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px;
            border-radius: 5px;
        }

        .section:hover .tagline {
            opacity: 1;
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <!-- Header -->
        <div class="header-container">
            <jsp:include page="header.jsp" />
        </div>

        <!-- Side-by-side sections -->
        <div class="content">
            <div class="section movies">
                <h1>Movies</h1>
                <div class="tagline">Explore the world of cinema</div>
                <a href="BookMovie.jsp">
                    <button>Explore Movies</button>
                </a>
            </div>
            <div class="section sports">
                <h1>Games</h1>
                <div class="tagline">Join the ultimate gaming adventure</div>
                <a href="BookGames.jsp">
                    <button>Explore Games</button>
                </a>
            </div>
        </div>
    </div>
</body>
</html>

