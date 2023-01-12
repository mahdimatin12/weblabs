<%-- 
    Document   : Home
    Created on : 27 Nov. 2022, 9:41:44 am
    Author     : 61426
--%>

<%@page import="com.model.dao.SQLConnector"%>
<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="java.util.Random"%>
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
        
           <%
            if (session.isNew()) {                             
                String userID = "" + (new Random().nextInt(999));
                session.setAttribute("userid", userID);
                Integer count = new Integer(0);
                session.setAttribute("counter", count);
            }

        %>

        <header>       
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It <span>Up</span> Australia</h1>
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
                   
                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
         <% 
            UserSqlDAO userSqlDAO = new UserSqlDAO(new SQLConnector().connection());
            AdminSqlDAO adminSqlDAO = new AdminSqlDAO(new SQLConnector().connection());        
            session.setAttribute("adminSqlDAO", adminSqlDAO);
            session.setAttribute("userSqlDAO", userSqlDAO);
        
        %>
    </body>
</html>