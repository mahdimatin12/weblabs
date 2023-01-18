

<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="com.model.Admin"%>
<%@page import="com.model.Admins"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <title>Admin Action Page</title>
         <script type="text/javascript" src="js/time.js"></script>
    </head>

    <body onload="startTime()">

        <%
            Admin admin = null;
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            AdminSqlDAO adminSqlDAO = (AdminSqlDAO) session.getAttribute("adminSqlDAO");

            if (email != null) {
                admin = adminSqlDAO.login(email, password);
            } else {
                admin = (Admin) session.getAttribute("admin");
            }

            if (admin == null) {
                session.setAttribute("error", "Admin does not exist");
                response.sendRedirect("admin.jsp");
            } else {
                session.setAttribute("admin", admin);
            }

        %>

        <header>
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It <span>Up</span> Australia</h1>
                <nav><ul><li><a class="button" href="admin1.jsp"> View Users </a></li></ul></nav>
            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <h2>Admin: <span style="color: darkorange"><%=admin.getName()%></span></h2>
                </div>
            </article>


        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>
