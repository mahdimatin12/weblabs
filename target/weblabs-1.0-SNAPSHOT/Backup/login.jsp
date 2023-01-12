<%-- 
    Document   : login
    Created on : 29 Nov. 2022, 2:56:01 pm
    Author     : 236347
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">      
        <title>Java web</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>
    </head>

    <body onload="startTime()">


        <header>          

            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>SIUA Login Page</h1>
                <nav>

                    <ul class="nav">

                        <li><a class="button" href="index.jsp"> Home </a></li>
                        <li><a class="button" href="logout.jsp"> Logout </a></li>

                    </ul>

                </nav>
            </div>
        </header>
        <main>
            <article>
                <div class="content"> 

                    <%
                        String error = (String) session.getAttribute("error");
                       
                    %>
                    <form method="POST" id="registerForm" action="loginAction.jsp">       
                        <fieldset>
                            <legend>
                                <%= (error != null) ?error: "Login Details"%>
                            </legend>
                            <br>
                            <label for="email"> Email </label>
                            <input name="email" id="name" type="email" placeholder="enter your email"><br>

                            <label for="password"> Password </label>
                            <input name="password" id="password" type="password" placeholder="enter your password"><br>
                            <br>
                            <input type="submit" value="Login">
                            <a href="index.jsp" id="cancelbtn">Cancel</a>
                            <p></p>
                        </fieldset>

                    </form>
                </div>
            </article>
        </main>
        <footer>

            <p id="clock"></p>
        </footer>
    </body>
</html>
