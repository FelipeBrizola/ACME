/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import BUSINESS.UserBusiness;
import ENTITIES.User;


/**
 *
 * @author felipebrizola
 */
public class LoginModel{
    private String email, password;
    private UserBusiness userBusiness;
    
    public LoginModel(){
        email = password = null;
    }
    
    public User login(String e, String p) {
        // teste
       User user =  new UserBusiness().login(e, p);
       return user;
    }
}