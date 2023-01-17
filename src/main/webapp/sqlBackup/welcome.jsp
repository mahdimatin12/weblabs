<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">       
        <title>register page</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>

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
    </head>

    <body onload="startTime()">
        <header>
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Welcome to SIUA</h1>
                <nav>
                    <ul class="nav">
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
                    int id = 0;
                    %>

                    <%
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        String dob = request.getParameter("dob");

                        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
                        //User user = new User(name, email, password, dob);
                        
                        User userSql = userSqlDAO.getUser(email);

                        if (userSql != null) {
                            session.setAttribute("error", "User already exists");
                            response.sendRedirect("register.jsp");
                        } else {
                            userSqlDAO.create(name, email, password, dob);
                            
                            User user = userSqlDAO.getUser(email);                           
                            id = user.getID();
                            session.setAttribute("user", user);
                           
                            
                            
                        }


                    %>



                    <table>
                        <caption>User Details</caption>
                                    
                       
                        <tbody>
                            <tr><td>ID </td><td> <%= id%></td></tr>
                            <tr><td>Name </td><td> <%= name%></td></tr>
                            <tr><td>Email </td><td> <%= email%></td></tr>
                            <tr><td>Password </td><td> <%= password%></td></tr>
                            <tr><td>D.O.B. </td><td> <%= dob%></td></tr>


                        </tbody>
                    </table>
                </div>
            </article>
        </main>
    </body>
    <footer>
        <p id="clock"></p>
    </footer>
</html>
