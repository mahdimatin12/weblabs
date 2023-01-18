package com.controller;

import com.model.User;
import com.model.dao.UserSqlDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminSearchServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter(""+"id"));        
      
        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");

        User user = null;
        try {
            user = userSqlDAO.getUser(id);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (user != null) {
            session.setAttribute("user", user);
            request.getRequestDispatcher("admSearch.jsp").include(request, response);
        } else {
            session.setAttribute("error", "User does not exist");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
    }

}
