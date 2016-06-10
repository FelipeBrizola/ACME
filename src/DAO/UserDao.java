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
        String sql = "SELECT * FROM USERS WHERE EMAIL = ?";
        try (Connection connection = dbFactory.getConnection()) {
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, email);
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        user = new User();
                        user.setName(result.getString("NAME"));
                        user.setDocument(result.getString("DOCUMENT"));
                        user.setEmail(result.getString("EMAIL"));
                        user.setPassword(result.getString("PASSWORD"));
                    }
                    if(user.getPassword().equals(pass)) {
                        user.setPassword(null);
                        return user;
                    }
                    else
                        throw new DaoException("Senha incorreta");
                }
            }
        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar usuário. " + ex.getMessage());
        }
        
    }
    
}
