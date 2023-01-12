<%-- 
    Document   : main
    Created on : 29 Nov. 2022, 3:47:48 pm
    Author     : 236347
--%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">       
        <title>Welcome</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>
    </head>

    <body onload="startTime()">
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>

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
