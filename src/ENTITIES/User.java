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
    String rg;
    String cpf;
    String passport;
    String email;
    
    public void setName(String n) {
        name =  n;
    }
    public void setRg(String rg) {
        this.rg =  rg;
    }
    public void setCpf(String cpf) {
        this.cpf =  cpf;
    }
    public void setPassport(String pass) {
        passport =  pass;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getName(){
        return name;
    }
    public String getRg(){
        return rg;
    }
    public String getCpf(){
        return cpf;
    }
    public String getPassport(){
        return passport;
    }
    public String getEmail(){
        return email;
    }
    
}
