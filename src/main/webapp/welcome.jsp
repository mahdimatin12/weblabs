<%-- 
    Document   : welcome
    Created on : 27 Nov. 2022, 4:56:51 pm
    Author     : 61426
--%>
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
    </head>

    <body onload="startTime()">
        <header>
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Welcome to SIUA</h1>
                <nav>
                    <ul class="nav">
                        <li><a class="button" href="main/main.jsp"> Main </a></li>
                        <li><a class="button" href="logout/logout.jsp"> Logout </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <main>
            <article>
                  <div class="content">  
                <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
                <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
                    <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/></jsp:useBean>
                <%
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String dob = request.getParameter("dob");

                    User user = new User(name, email, password, dob);
                    Users users = userDAO.getUsers();

                    User userXML = users.user(user.getEmail());

                    if (userXML != null) {
                        session.setAttribute("error", "User already exists");
                        response.sendRedirect("register.jsp");
                    } else {
                        users.add(user);
                        userDAO.save(users, filename);
                        session.setAttribute("user", user);
                        response.sendRedirect("main.jsp");
                    }

                %>               
                </div>
            </article>
        </main>
    </body>
    <footer>
        <p id="clock"></p>
    </footer>
</html>
