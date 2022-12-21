<%@page import="com.rest.client.UserServiceClient"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">       
        <title>Admin Search</title>

        <link rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/time.js"></script>
        <style>
            input[type="text"]{
                margin-left:-100px; 
            }
        </style>
    </head>

    <body onload="startTime()">
        <header>       
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It <span>Up</span> Australia</h1>
                <h2>ADMIN</h2>
                <nav>
                    <ul>
                        <li><a class="button" href="admin5.jsp"> Admin</a></li>
                    </ul>
                </nav>

            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));

                    %>


                    <%                       
                        String xslPath = application.getRealPath("/xsl/users.xsl");
                        XmlTransformer transformer = new XmlTransformer();                      
                        transformer.transform(xslPath, UserServiceClient.fetchUser(id), new StreamResult(out));
                    %>
                   

                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>
