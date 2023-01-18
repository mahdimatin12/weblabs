<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="js/time.js"></script>
        <title>Admin Login</title>

        <style>
            form {

                padding: 10px;
                width: 400px;               
                border-radius: .5rem;
                background-color: hsl(0, 0%, 100%);
                border: 1px solid hsl(0, 0%, 60%);


            }
            form input[type="text"],input[type="password"] {
                border: 1px solid #333;
                background-color: white;
                border-radius: 0.25rem;
                width: 80px;
                text-align: center;
            }
            form input[type="submit"], #cancelbtn  {

                padding: 5x 15px;
                font-size: 1em;                              
                border-radius: 5px;               
                background-color: gray;
                color: white;
            }

        </style>
    </head>
    <body onload="startTime()"> 
        <header>
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It <span>Up</span> Australia</h1>
                <h2>ADMIN</h2>
            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <%
                        String exist = (String) session.getAttribute("error");
                    %>
                    <div>
                        <form method="POST" action="/weblabs/AdminServlet">
                            <table class="table" style="width: 100%;">
                                <caption><b>Sign In As Admin</b> <span class="message"><%= (exist != null) ? exist : ""%></span></caption>
                                <tr><td><input style="width: 80%;" type="text" name="email" placeholder="Enter your email" /></td></tr>
                                <tr><td><input style="width: 80%;" type="password" name="password" placeholder="Enter your password" /></td></tr>
                                <tr style="background-color: transparent;">
                                    <td colspan="2" style="text-align: center;">
                                        <a style="margin: 0;" id="cancelbtn" href="index.jsp">Cancel</a>
                                        <input style="margin-left: 0;" type="submit" value="Sign In"/>                                        
                                    <td>                                   

                                </tr>
                            </table>
                        </form>
                    </div>
                    <% exist = "";%>

                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>
