<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="css/style.css"/>
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
                        <li><a class="button" href="admin.jsp"> Admin </a></li>
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
                    <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
                    <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
                        <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
                    </jsp:useBean>
                    <%
                        String submitted = request.getParameter("submitted");
                        String emailView = request.getParameter("emailView");
                        Users users = userDAO.getUsers();

                        if (emailView != null) {
                            user = users.user(emailView);
                            session.setAttribute("emailView", emailView);
                        } else {
                            user = (User) session.getAttribute("user");
                        }

                        if (submitted != null && submitted.equals("submitted")) {
                            int ID = Integer.parseInt(request.getParameter("ID"));
                            String name = request.getParameter("name");
                            String email = request.getParameter("email");
                            String password = request.getParameter("password");
                            String dob = request.getParameter("dob");
                            emailView = (String) session.getAttribute("emailView");
                            if (emailView != null) {
                                user = users.user(emailView);
                            }
                            user.update(ID, name, email, password, dob);
                            userDAO.update(users, user);
                            session.setAttribute("user", user);
                        }
                    %>
                    <div style="margin: auto;">
                        <form method="POST" action="account.jsp">
                            <table class="table" style="width: 70%;">
                                <caption style="background-color:gray;border-radius:10px;padding:10px;color:white;">Edit User <span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></caption>
                                <tr><td>ID: </td><td><input style="width: 70%;" type="text" name="ID" value="<%= user.getID()%>" readonly="true" /></td></tr>
                                <tr><td>Name: </td><td><input style="width: 70%;" type="text" name="name" value="<%= user.getName()%>" /></td></tr>
                                <tr><td>Email: </td><td><input style="width: 70%;" type="text" name="email" value="<%= user.getEmail()%>" readonly="true"/></td></tr>
                                <tr><td>Password: </td><td><input style="width: 70%;" type="password" name="password" value="<%= user.getPassword()%>" /></td></tr>
                                <tr><td>DOB: </td><td><input style="width: 70%;" type="date" name="dob" value="<%= user.getDob()%>"/></td></tr>
                                <tr><input type="hidden" name="submitted" value="submitted"></tr>
                                <tr>
                                    <td>
                                        <% if (emailView != null) { %>
                                        <a id="cancelbtn" href="admin3.jsp">Accounts</a> 
                                        <%} else { %>
                                        <a class="button" href="main.jsp">Dashboard</a>
                                        <%}%>
                                    </td>
                                    <td>
                                        <input style="margin-right: 10px;" id="cancelbtn" type="submit" value="Update" /> 
                                        <a id="cancelbtn" href="delete.jsp">Delete</a>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div> 
                </div>
            </article>
        </main>
        <footer>
            <p id="clock"></p>
        </footer>
    </body>
</html>

