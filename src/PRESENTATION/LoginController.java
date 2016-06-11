/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import ENTITIES.User;

/**
 *
 * @author felipebrizola
 */
public class LoginController {
    private LoginModel model = new LoginModel();
    
    public User login(String e, String p) {
        return model.login(e, p);
    }
    
}
