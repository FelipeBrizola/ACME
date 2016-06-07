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
    
    public User getUser(String email, String pass) throws Exception {
        User user = null;
        String sql = "SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?";
        try (Connection connection = dbFactory.getConnection()) {
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, email);
                command.setString(2, pass);
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        user = new User();
                        user.setName(result.getString("NAME"));
                        user.setRg(result.getString("RG"));
                        user.setCpf(result.getString("CPF"));
                        user.setPassport(result.getString("PASSPORT"));
                        user.setEmail(result.getString("EMAIL"));
                    }
                    return user;
                }
            }
        } catch (Exception ex) {
            throw new Exception("Falha na busca. " + ex.getMessage());
        }
        
    }
    
}
