<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View</title>
        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>
    </head>
    <body> 
        <header>
             <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It <span>Up</span> Australia</h1>
                <nav>
                    <ul>
                        <li><a class="button" href="index.jsp"> Home </a></li>
                    </ul>
                </nav>
             </div>
        </header>

        <main>
            <article>
                <div class="content">

                    <%
                        request.setAttribute("email", null);
                        request.removeAttribute("email");
                    %>

                    <% String xslPath = application.getRealPath("/xsl/users.xsl");%>

                    <%
                        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
                    %>

                    <%
                        Users users = new Users();
                        users.addAll(userSqlDAO.getUsers());
                        XmlTransformer transformer = new XmlTransformer();
                        transformer.transform(xslPath, users, new StreamResult(out));
                    %>

                </div>
            </article>
        </main>

        <footer>

        </footer>
    </body>
</html>
