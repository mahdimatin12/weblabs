<%-- 
    Document   : delete
    Created on : Dec 7, 2022, 10:57:56 AM
    Author     : George
--%>

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
    </head>
    <body>
        <%!
            User user;
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            Users users = userDAO.getUsers();
            String emailView = (String) session.getAttribute("emailView");
            if (emailView != null) {
                user = users.user(emailView);
            }else{
                user = (User) session.getAttribute("user");
            }

            if (user != null) {
                userDAO.delete(users, user);
        %>
                <h2><%= user.getName()%> record has been deleted!</h2>
            <%}%>
        <% session.invalidate();%>
        <p class="message">You have been logged out click <a href="admin.jsp">here </a> to go back home</p>   
    </body>
</html>
