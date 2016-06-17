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
public class Airline {
    String id;
    String name;
    
    public void setName(String n) {
        name = n;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName(){
        return name;
    }
    public String getId(){
        return id;
    }
}
