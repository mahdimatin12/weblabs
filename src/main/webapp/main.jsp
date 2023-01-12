<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">       
        <title>Welcome</title>
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


        <%
            User user = (User) session.getAttribute("user");
           

        %>
        <header>


            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Your Dashboard Page</h1>
                <nav>
                    <ul class="nav">
                        <li><a class="button" href="account.jsp"> Account </a></li>
                        <li><a class="button" href="logout.jsp"> Logout </a></li>
                    </ul>

                </nav>
            </div>
        </header>


        <main>
            <article>
                <div class="content">
                    <h2 style="color: darkorange;"><%= user.getName()%></h2>
                    <table>
                        <colgroup>
                            <col class="name">
                            <col class="email">
                            <col class="date of birth">
                        </colgroup>
                        <thead>
                            <tr>
                               
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Date of Birth</th>
                            </tr>
                        </thead>
                        <tr>
                            
                           
                            <td> <%= user.getName()%></td>
                            <td> <%= user.getEmail()%></td>
                            <td> <%= user.getDob()%></td>
                        </tr>
                    </table>
                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>
