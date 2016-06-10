/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ENTITIES;

/**
 *
 * @author felipebrizola
 */
public class User {
    
    String name;
    String document;
    String email;
    String password;
    
    public void setName(String n) {
        name =  n;
    }
    public void setDocument(String doc) {
        document =  doc;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPassword(String pass) {
        password = pass;
    }
    public String getName(){
        return name;
    }
    public String getDocument(){
        return document;
    }
    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    
}
