
package com.model.dao;

import com.model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class AdminSqlDAO {
   
    private Statement st;
    private PreparedStatement updateSt;
    private String updateQuery = "UPDATE mydb.admins SET NAME=?, PASSWORD=?, DOB=? WHERE ID=?";
    private PreparedStatement deleteSt;
    private String deleteQuery = "DELETE FROM mydb.admins WHERE ID=?";

    public AdminSqlDAO(Connection connection) throws SQLException {
        this.st = connection.createStatement();
        this.updateSt = connection.prepareStatement(updateQuery);
        this.deleteSt = connection.prepareStatement(deleteQuery);
    }

    //Create Query
    public void create(String name, String email, String password, String dob) throws SQLException {
        String columns = "INSERT INTO mydb.admins(NAME,EMAIL,PASSWORD,DOB)";
        String values = "VALUES('" + name + "','" + email + "','" + password + "','" + dob + "')";
        st.executeUpdate(columns + values);
    }
    //Read Query - Read One
    public Admin getAdmin(int ID) throws SQLException {
        String query = "SELECT * FROM mydb.admins WHERE ID=" + ID;
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            int currentID = Integer.parseInt(rs.getString(1));

            if (ID == currentID) {
                String name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String dob = rs.getString(5);
                return new Admin(ID, name, email, password, dob);
            }
        }
        return null;
    }
    //Read Query - Read One by Email and Password
    public Admin login(String email, String password) throws SQLException {
        String query = "SELECT * FROM mydb.admins WHERE EMAIL='"+ email+"' AND PASSWORD='"+password+"'";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            String currentEmail = rs.getString(3);
            String currentPassword = rs.getString(4);

            if (email.equals(currentEmail)&&password.equals(currentPassword)) {
                int ID = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);               
                String dob = rs.getString(5);
                return new Admin(ID, name, email, password, dob);
            }
        }
        return null;
    }
       //Read Query - Read One
    public Admin getAdmin(String email) throws SQLException {
        String query = "SELECT * FROM mydb.admins WHERE EMAIL='" + email+"'";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            String currentEmail = rs.getString(3);

            if (email.equals(currentEmail)) {
                int ID = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                
                String password = rs.getString(4);
                String dob = rs.getString(5);
                return new Admin(ID, name, email, password, dob);
            }
        }
        return null;
    }
    //Update Query (Name, Password) by ID
    public void update(String name, String password, String dob, int ID) throws SQLException{
        updateSt.setString(1, name);
        updateSt.setString(2, password);
        updateSt.setString(3, dob);
        updateSt.setString(4, Integer.toString(ID));
        int row = updateSt.executeUpdate();
        System.out.println("Row "+row+" has been successflly updated");
    }
     //Delete Query - by ID
    public void delete(int ID) throws SQLException{
        deleteSt.setString(1, ""+ID);
        int row = deleteSt.executeUpdate();
        System.out.println("Row "+row+" has been successflly deleted");
    }
    
}
