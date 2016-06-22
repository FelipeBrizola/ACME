/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import ENTITIES.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author felipebrizola
 */
public class UserDao {
    
    public User getUser(String email, String pass) throws DaoException {
        User user = null;
        String sql = "SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, email);
                command.setString(2, pass);
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        String uName = result.getString("NAME");
                        String uDocument = result.getString("DOCUMENT");
                        String uEmail = result.getString("EMAIL");
                        
                        user = new User(uName, uDocument, uEmail);
                    }
                }
           

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar usuário. ");
        }
        if(user == null)
            throw new DaoException("Usuario ou senha incorreta");
        
        return user;
                   
    }
    
}
