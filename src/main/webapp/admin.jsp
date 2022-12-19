<%-- 
    Document   : login
    Created on : Nov 22, 2022, 2:46:16 PM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <script type="text/javascript" src="js/time.js"></script>
        <title>Login</title>
    </head>
    <body onload="startTime()"> 
        <header>
            <div class="Navbar">
                <p class="logo">SI<span id="square">&squarf;</span></p><br>
                <p class="logo">UA</p>
                <h1>Step It Up Australia<br><span style="color: #ff932d;" >Admin Login</span></h1>
                
            </div>
        </header>
        <main>
            <article>
                <div class="content">
                    <%
                        String exist = (String) session.getAttribute("error");
                    %>
                    <div style="margin: auto;">
                        <form method="POST" action="adminView.jsp">
                            <table class="table" style="width: 75%;">
                                <caption style="background-color:black;border-radius:10px;padding:10px;color:white;">Sign In <span class="message"><%= (exist != null) ? exist : ""%></span></caption>
                                <tr><td>Email </td><td><input style="width: 80%;" type="text" name="email" placeholder="Enter your email" /></td></tr>
                                <tr><td>Password </td><td><input style="width: 80%;" type="password" name="password" placeholder="Enter your password" /></td></tr>
                                <tr style="background-color: transparent;">
                                    <td colspan="2" style="text-align: center;">
                                        <a style="margin: 0;" id="cancelbtn" href="index.jsp">Cancel</a>
                                        <input style="margin-left: 0;" type="submit" value="Sign In"/>                                        
                                    <td>                                   
                                                      
                                </tr>
                            </table>
                        </form>
                    </div>
                    <% exist = "";%>

                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>
