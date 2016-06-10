/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 *
 * @author Júlio
 */
public class LoginController implements ActionListener{
    private LoginModel model;
    private LoginView view;
    
    public void associaModel(LoginModel m){
        model = m;
    }
    
    public void associaView(LoginView v) {
        view = v;
        model.addObserver(view);
    }
    
    public void initModel(String email, String pass) {
        model.setEmail(email);
        model.setPass(pass);
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        model.login();
    }
    
}
