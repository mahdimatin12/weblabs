/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Beans/Bean.java to edit this template
 */
package com.model;

import com.sun.org.apache.xerces.internal.impl.dv.xs.IDDV;
import java.beans.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 61426
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "user")
public class User implements Serializable {

    private int ID;
    private String name;
    private String email;
    private String password;
    private String dob;

    public User() {

    }

    public User(String name, String email, String password, String dob) {
        this.ID = (new Random()).nextInt(999999);
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;

    }

    public boolean login(String email, String password) {
        return this.email.equals(email) && this.password.equals(password);
    }

    public void update(int ID, String name, String email, String password, String dob) {
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
    }

    public boolean match(int ID) {
        return this.ID == ID;
    }

    public boolean match(User other) {
        return this.ID == other.ID;
    }

    public boolean match(String email) {
        return this.email.equals(email);
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getDob() {
        return dob;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        return ID + "\t" + name + "\t" + email + "\t" + dob;
    }

}
