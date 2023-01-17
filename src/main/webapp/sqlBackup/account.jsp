<%@page import="com.model.dao.UserSqlDAO"%>
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

        <style>
            table {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                width: 100%;
                margin-top: 25px;
                border-collapse: collapse;
            }
            caption {
                text-align: right;
                font-size: .85em;
                margin-bottom: 10px;
            }
            th, td {
                font-size: 1.1em;
                border: 1px solid #DDB575;
                padding: 3px 7px 2px 7px;
            }
            th {
                text-transform:uppercase;
                text-align: left;
                padding-top: 5px;
                padding-bottom: 4px;
                background: rgb(229,76,16);
                background: linear-gradient(to bottom, rgb(229,76,16), rgb(173,54,8));
                color: white;
            }
            tr:nth-of-type(even){
                background-color: rgba(255,255,255,.1);
            }
            tr:nth-of-type(odd){
                background-color: rgba(229,76,16,.1);
            }

        </style>
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
                        User userid;
                    %>

                    <%
                        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
                        String submitted = request.getParameter("submitted");
                        String emailView = request.getParameter("emailView");

                        if (emailView != null) {
                            user = userSqlDAO.getUser(emailView);
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
                                user = userSqlDAO.getUser(emailView);
                            }
                            user.update(ID, name, email, password, dob);
                            userSqlDAO.update(name, password, dob, ID);
                            session.setAttribute("user", user);
                        }
                    %>
                    <div style="margin: auto;">
                        <form style="width:100%" method="POST" action="account.jsp">
                            <table class="table" style="width: 70%;">
                                <caption>Edit User <span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></caption>
                                <tr><td>ID: </td><td><input type="text" name="ID" value="<%= user.getID()%>" readonly="true" /></td></tr>
                                <tr><td>Name: </td><td><input type="text" name="name" value="<%= user.getName()%>" /></td></tr>
                                <tr><td>Email: </td><td><input type="text" name="email" value="<%= user.getEmail()%>" readonly="true"/></td></tr>
                                <tr><td>Password: </td><td><input type="password" name="password" value="<%= user.getPassword()%>" /></td></tr>
                                <tr><td>DOB: </td><td><input type="date" name="dob" value="<%= user.getDob()%>"/></td></tr>
                                <tr><input type="hidden" name="submitted" value="submitted"></tr>
                                <tr>
                                    <td>
                                        <% if (emailView != null) { %>
                                        <a id="cancelbtn" href="adminView.jsp">Accounts</a> 
                                        <%} else { %>
                                        <a id="dashboardbtn" href="main.jsp">Dashboard</a>
                                        <%}%>
                                    </td>
                                    <td>
                                        <input 10px;" id="cancelbtn" type="submit" value="Update" /> 
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

