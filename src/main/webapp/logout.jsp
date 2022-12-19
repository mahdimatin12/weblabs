<%-- 
    Document   : logout
    Created on : 27 Nov. 2022, 6:34:04 pm
    Author     : 61426
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">       
        <title>Register Now</title>  
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>
    </head>
    <body onload="startTime()">
        <header>
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>You're Logged Out</h1>
                <nav>
                    <ul class="nav">
                        <li><a class="button" href="index.jsp"> Home </a></li>                 
                    </ul>
                </nav>
            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <p>You have been logged out - Thank you!</p>
                    <% session.invalidate(); %>
                </div>

            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>