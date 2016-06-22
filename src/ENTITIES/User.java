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
    
   public User(String n, String d, String e) {
       name = n;
       document = d;
       email = e;
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
