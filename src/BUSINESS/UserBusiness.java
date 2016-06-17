/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;

import DAO.UserDao;
import ENTITIES.User;

/**
 *
 * @author felipebrizola
 */
public class UserBusiness {
    
    public User login(String email, String pass) throws Exception {
        UserDao u =  new UserDao();
        try {
            return u.getUser(email, pass);
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }
}
