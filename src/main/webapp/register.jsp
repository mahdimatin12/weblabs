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
                <h1>Register new user</h1>
                <nav>
                    <ul class="nav">
                        <li><a class="button" href="index.jsp"> Home </a></li>
                        <li><a class="button" href="login.jsp"> Login </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <main>
            <article>
                <div class="content">           
                    <%
                        String exist = (String) session.getAttribute("error");
                    %>            
                    <form method="POST" id="registerForm" action="/weblabs/RegisterServlet">                      

                        <fieldset>
                            <legend>
                                <%= (exist != null) ? exist : "Register Form"%>
                            </legend>
                            <br>
                            <label for="name"> Name </label>
                            <input name="name" id="name" type="text" placeholder="Your name"><br>

                            <label for="email"> Email </label>
                            <input name="email" id="name" type="email" placeholder="enter your email"><br>

                            <label for="password"> Password </label>
                            <input name="password" id="password" type="password" placeholder="enter your password"><br>

                            <label for="dob"> DOB </label>
                            <input name="dob" id="dob" type="date"><br>

                            <p>                       
                                <input style="background: gray" type="submit" value="Sign Up">
                                <a style="background: gray" href="index.jsp" id="cancelbtn">Cancel</a>
                            </p>

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