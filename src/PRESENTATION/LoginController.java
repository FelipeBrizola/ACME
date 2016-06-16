/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import ENTITIES.User;
import BUSINESS.UserBusiness;

/**
 *
 * @author felipebrizola
 */
public class LoginController {
    private UserBusiness user =  new UserBusiness();
    
    public User login(String e, String p) {
        return user.login(e, p);
    }
    
}
