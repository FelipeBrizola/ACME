/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import java.util.Observable;

/**
 *
 * @author Júlio
 */
public class LoginModel extends Observable{
    private String pass, email;
    
    public LoginModel(){
        pass = email = null;
    }
    
    public void setEmail(String m){
        email = m;
        setChanged();
        notifyObservers();
    }
    public void setPass(String p){
        pass = p;
        setChanged();
        notifyObservers();
    }

    public String getPass() {
        return pass;
    }
     public String getEmail() {
        return email;
    }
    
    public void login() {
        email = pass;
        // chamr business de login?
        setChanged();
        notifyObservers();
    }
}
