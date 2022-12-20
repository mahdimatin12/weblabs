<%-- 
    Document   : Home
    Created on : 27 Nov. 2022, 9:41:44 am
    Author     : 61426
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">       
        <title>SIUA</title>

        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>
    </head>

    <body onload="startTime()">

        <header>       
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It Up Australia</h1>
                <nav>
                    <ul>
                        <li><a class="button" href="admin.jsp"> Admin </a></li>
                        <li><a class="button" href="register.jsp"> Register </a></li>
                        <li><a class="button" href="login.jsp"> Login </a></li>
                        <li><a class="button" href="string.jsp"> Strings </a></li>


                    </ul>
                </nav>
            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <h1>The Java String Class</h1>
                    <h3>The String class represents character strings.</h3>
                    <h4>All string literals in Java programs, such as "abc", are implemented as instances of this class.</h4>
                    <p>Strings are constant; their values cannot be changed after they are created.<br>
                        String buffers support mutable strings. Because String objects are immutable they can be shared.</p>
                    <p>Zaki is coding ...</p>
                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>