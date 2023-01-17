<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="js/time.js"></script>
        <title>Login Action</title>
    </head>
    <style>
        table {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
        }
        caption {
            text-align: right;
            font-size: .85em;
            margin-bottom: 10px;
        }
        th, td {
            font-size: 1.1em;
            border: 1px solid #DDB575;
            padding: 3px 7px 2px 7px;
        }
        th {
            text-transform:uppercase;
            text-align: left;
            padding-top: 5px;
            padding-bottom: 4px;
            background: rgb(229,76,16);
            background: linear-gradient(to bottom, rgb(229,76,16), rgb(173,54,8));
            color: white;
        }
        tr:nth-of-type(even){
            background-color: rgba(255,255,255,.1);
        }
        tr:nth-of-type(odd){
            background-color: rgba(229,76,16,.1);
        }

    </style>
    <body onload="startTime()">
        <header>       
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It Up Australia</h1>
                <nav>
                    <ul>
                        <li><a class="button" href="main.jsp"> Main </a></li>
                        <li><a class="button" href="logout.jsp"> Logout </a></li>                   
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <article>
                <div class="content">
                    <%
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");

                        User user = userSqlDAO.login(email, password);

                        if (user != null) {
                            
                            session.setAttribute("user", user);
                            response.sendRedirect("main.jsp");
                        } else {
                            session.setAttribute("error", "User does not exist");
                            response.sendRedirect("login.jsp");
                        }
                    %>
                    <h1>Hay, you're now logged in to your SIUA account.</h1>
                    <% if (user != null) {%>
                    <table>
                        <caption>User Information</caption>
                        <tr><td>Email: </td><td> <%= email%></td></tr>
                        <tr><td>Password: </td><td> <%= password%></td></tr>
                    </table>
                    <%} else {%>
                    <p>User does not exist</p>
                    <%}%>
                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
    <div id="clock" class="footer"></div>
</html>


