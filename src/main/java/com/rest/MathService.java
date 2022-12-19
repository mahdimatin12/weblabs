package com.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import com.model.Circle;
import com.model.Rectangle;
import com.model.Maths;

@Path("mathapi")
public class MathService {

    public MathService() {
    }

    @GET
    @Path("hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Welcome to Math Service";
    }

    @GET
    @Path("/circle/r/{R}")
    @Produces(MediaType.APPLICATION_XML)
    public Circle values(@PathParam("R") int R) {
        return new Circle(R);
    }

    @GET
    @Path("/rectangle/t/{H},{W}")
    @Produces(MediaType.APPLICATION_XML)
    public Rectangle recValues(@PathParam("H") double H, @PathParam("W") double W) {
        return new Rectangle(H, W);
    }

    @GET
    @Path("/maths/m/{N}")
    @Produces(MediaType.APPLICATION_XML)
    public Maths mathsValues(@PathParam("N") int N) {
        return new Maths(N);
    }

}
