
package com.model.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author 236370
 */
public class SQLConnector extends SqlDB{
    
     private Connection connection;
    public SQLConnector() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, IOException{
        //Class.forName(driver);
        this.connection = super.openConnection();
    }
    
    public Connection connection(){
        return this.connection;
    }
    
    public void closeConnection() throws SQLException{
        this.connection.close();
    }
    
}
