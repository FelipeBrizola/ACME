/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author felipebrizola
 */
class dbConnection {
    
    private static Connection connection = null;
    private final static String ADRESS   = "jdbc:postgresql://localhost";
    private final static String DATABASE = "acme";
    private final static String USER     = "acmeuser";
    private final static String PASSWORD = "admin";
    private final static String PORT     = "5432";
    private final static String DRIVER   = "org.postgresql.Driver";
    
    private dbConnection() {}
    
    private static void loadDriver() {
        try {
            Class.forName(DRIVER);
        }
        catch (Exception e) {
            errorHandler("Failed to load the driver " + DRIVER, e);
        }
    }
    
    private static void errorHandler(String message, Exception e) {
        System.out.println(message);  
        if (e != null) System.out.println(e.getMessage());   
    }

    
    private static void loadConnection() {
        try {
            connection = DriverManager.getConnection(getFormatedUrl(), USER, PASSWORD);
        }
        catch (SQLException e) {
            errorHandler("Failed to connect to the database " + getFormatedUrl(), e);         
        }
    }
    
     private static String getFormatedUrl() {
        return ADRESS + ":" + PORT + "/" + DATABASE;
    }
     
    public static Connection getConnection() {
        if (connection == null) {
            loadDriver();
            loadConnection();
        }
        return connection;
    }
   
}

