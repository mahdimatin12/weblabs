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
        
        <style>
            .searchForm {
                position: absolute;
                display: inline;
                float: left;
                left: 0;
                margin-right: 0;
                margin-left: 100px;
            }

            #searchbtn {
                margin-left: 0;
                background-color: gray;

            }
            #searchbtn:hover {
                color: darkorange;
            }

            #id {
                border: 1px solid black;
              
                              

            }

        </style>
    </head>
    <body onload="startTime()"> 
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
                    <form class="searchForm" action="/weblabs/AdminSearchServlet" method="POST">
                        <input name="id" type="text" id="id" placeholder="search...">
                        <input id="searchbtn" type="submit" value="search">

                    </form> 

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
            <p id="clock"></p>
        </footer>
    </body>
</html>
