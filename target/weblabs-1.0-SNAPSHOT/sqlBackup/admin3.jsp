<%@page import="com.model.Admin"%>
<%@page import="com.model.Admins"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html lang="en">
    <head>
        <meta charset="utf-8">       
        <title>SIUA</title>

        <link rel="stylesheet" href="css/style.css">
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
                        <li><a class="button" href="index.jsp"> Home </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        
        <main>
            <article>
                <div class="content">
                    <%
                        request.setAttribute("emailView", null);
                        request.removeAttribute("emailView");
                    %>
                    <c:import url="/WEB-INF/users.xml" var="xml"/>
                    <c:import url="/xsl/users.xsl" var="xsl"/>
                    <x:transform xml="${xml}" xslt="${xsl}"></x:transform>
                </div>
            </article>
        </main>
                
        <footer>
            <p id="clock"></p>
        </footer>
                
    </body>
</html>
