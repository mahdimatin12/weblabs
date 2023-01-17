<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
        <link rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="js/index.js"></script>
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
                      
                    </ul>
                </nav>
            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <%!
                        User user;
                    %>

                    <%
                        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");

                        String emailView = (String) session.getAttribute("emailView");
                        if (emailView != null) {
                            user = userSqlDAO.getUser(emailView);
                        } else {
                            user = (User) session.getAttribute("user");
                        }

                        if (user != null) {
                            userSqlDAO.delete(user.getID());
                    %>
                    <h2><%= user.getName()%> record has been deleted!</h2>
                    <%}%>

                    <p class="message">Click <a href="admin1.jsp">here </a> to view user list</p>   
                </div>
            </article>
        </main>
                    <footer>
                         <p id="clock"></p>
                    </footer>
    </body>
</html>
