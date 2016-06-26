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
                        int uId = result.getInt("ID");
                        
                        user = new User(uId, uName, uDocument, uEmail);
                    }
                }
           

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar usuário. ");
        }
        if(user == null)
            throw new DaoException("Usuario ou senha incorreta");
        
        return user;
                   
    }
    
    public User getUserByDoc(String doc) throws DaoException {
         User user = null;
        String sql = "SELECT * FROM USERS WHERE DOCUMENT = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                
                command.setString(1, doc);
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        String uName = result.getString("NAME");
                        String uDocument = result.getString("DOCUMENT");
                        String uEmail = result.getString("EMAIL");
                        int uId = result.getInt("ID");
                        
                        user = new User(uId, uName, uDocument, uEmail);
                    }
                }
           
        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar usuário. ");
        }
        
        return user;
    }
    
    public boolean insertUser(String name, String doc) throws DaoException {
        int rows = 0;
        String sql = "INSERT INTO USERS(NAME, DOCUMENT) VALUES(?, ?)";
         Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, name);
                command.setString(2, doc);
                rows = command.executeUpdate();
            
        } catch (Exception ex) {
            throw new DaoException("Falha ao inserir passageiro");
        }
            if (rows > 0)
                return true;
            return false;
    }
    
    public int exists(String name, String doc) throws DaoException {
        int rows = 0;
            String sql = "select count (*) from users where name = ? and document = ?";
             Connection connection = dbConnection.getConnection();
                try (PreparedStatement command = connection.prepareStatement(sql)) {
                    command.setString(1, name);
                    command.setString(2, doc);
                    rows = command.executeUpdate();

            } catch (Exception ex) {
                throw new DaoException("Falha ao verificar existencia de usuario");
            }
                return rows;
        }    
    
}
