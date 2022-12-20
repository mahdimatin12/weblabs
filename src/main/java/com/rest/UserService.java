package com.rest;

import com.model.User;
import com.model.Users;
import com.model.dao.UserDAO;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBException;

/**
 *
 * @author George
 */
@Path("userapi")
public class UserService {

    @Context
    private ServletContext application;

    private UserDAO getUserDAO() throws JAXBException, FileNotFoundException {
        synchronized (application) {
            UserDAO userDAO = (UserDAO) application.getAttribute("userDAO");
            if (userDAO == null) {
                userDAO = new UserDAO();
                userDAO.setFileName(application.getRealPath("/WEB-INF/users.xml"));
                application.setAttribute("userDAO", userDAO);
            }
            return userDAO;
        }
    }

    @GET //http://localhost:8080/weblabs/rest/userapi
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello from User Rest Web Service";
    }

    @GET //http://localhost:8080/weblabs/rest/userapi/welcome
    @Path("welcome")
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Welcome to the User Rest Web Service";
    }

    @GET
    @Path("users") //http://localhost:8080/weblabs/rest/userapi/users
    @Produces(MediaType.APPLICATION_XML)
    public Users getUsers() throws JAXBException, FileNotFoundException {
        return getUserDAO().getUsers();
    }

    @GET
    @Path("user/ID/{ID}") //http://localhost:8080/weblabs/rest/userapi/user/ID/608493
    @Produces(MediaType.APPLICATION_XML)
    public User getUser(@PathParam("ID") int ID) throws JAXBException, FileNotFoundException {
        return getUserDAO().getUsers().user(ID);
    }

    @GET
    @Path("user") //http://localhost:8080/weblabs/rest/userapi/user?ID=834281
    @Produces(MediaType.APPLICATION_XML)
    public User user(@QueryParam("ID") int ID) throws JAXBException, FileNotFoundException {
        return getUserDAO().getUsers().user(ID);
    }

    @GET
    @Path("adduser")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Response addUser() throws JAXBException, FileNotFoundException {
        User user = new User("mahdi", "mahdi@example.com", "Newrest123", "2000-02-02");
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();
        users.add(user);
        userDAO.marshal(users);
        return Response.status(200).entity(user).build();
    }

    @POST
    @Path("newuser")
    @Consumes(MediaType.APPLICATION_XML)
    public Response newUser(User user) throws JAXBException, FileNotFoundException {
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();
        users.add(user);
        userDAO.marshal(users);
        return Response.status(200).entity(user).build();
    }

    @GET
    @Path("user/delete/{ID}")
    @Produces(MediaType.TEXT_PLAIN)
    public String deleteUser(@PathParam("ID") int ID) throws JAXBException, FileNotFoundException, IOException {
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();
        User user = users.user(ID);
        userDAO.delete(users, user);
        return "<success> user deleted successfully</success>";
    }

    @GET
    @Path("user/update/{ID},{P}")
    @Produces(MediaType.TEXT_PLAIN)
    public String updateUser(@PathParam("ID") int ID,@PathParam("P") String P) throws JAXBException, FileNotFoundException, IOException {
        UserDAO userDAO = getUserDAO();
        Users users = userDAO.getUsers();       
        User user = users.user(ID);
        user.setPassword(P);
        userDAO.update(users, user);
        return "<success> user data updated successfully</success>";
    }
    
    
    
    
    
//    @GET
//    @Path("updateuser/{ID}")
//    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
//    public Response updateUser(@Path) throws JAXBException, FileNotFoundException {
//        UserDAO userDAO = getUserDAO();
//        Users users = userDAO.getUsers();
//         User user = users.user();
//         
//        User user = new User("mahdi", "mahdi@example.com", "Newrest123", "2000-02-02");
//        
//        users.add(user);
//        userDAO.marshal(users);
//        return Response.status(200).entity(user).build();
//    }
    
    
}
