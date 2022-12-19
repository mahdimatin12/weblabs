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
                    <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
                    <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
                        <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
                    </jsp:useBean>
                    <%
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        
                        
                        Users users = userDAO.getUsers();
                        
                        User user = users.user(email, password);

                        if (user != null) {
                            session.setAttribute("user", user);
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


