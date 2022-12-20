<%-- 
    Document   : adminAction
    Created on : Dec 14, 2022, 1:50:21 PM
    Author     : George
--%>

<%@page import="com.model.Admin"%>
<%@page import="com.model.Admins"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <title>Admin Action Page</title>
    </head>
    <body>
        <% String filename = application.getRealPath("/WEB-INF/admin.xml");%>
        <jsp:useBean id="adminDAO" class="com.model.dao.AdminDAO" scope="application">
            <jsp:setProperty name="adminDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Admins admins = adminDAO.getAdmins();

            Admin admin = admins.admin(email, password);

            if (admin != null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("admin5.jsp");
            } else {
                session.setAttribute("error", "Admin does not exist");
                response.sendRedirect("admin.jsp");
            }

        %>
    </body>
</html>
