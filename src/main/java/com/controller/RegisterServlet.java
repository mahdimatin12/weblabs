
package com.controller;


import javax.servlet.http.HttpServlet;

import com.model.User;
import com.model.dao.UserSqlDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegisterServlet extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            
            User userSql = userSqlDAO.getUser(email);
            
            if(userSql != null){
                session.setAttribute("error", "User already exists");
                request.getRequestDispatcher("register.jsp").include(request, response);

            }else{
                userSqlDAO.create(name, email, password, dob);
                User user = userSqlDAO.getUser(email);
                session.setAttribute("user", user);
                request.getRequestDispatcher("main.jsp").include(request, response);
            }  
            
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
