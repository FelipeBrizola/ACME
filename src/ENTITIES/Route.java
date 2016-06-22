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
public class Route {
    
    private final String from;
    private final String to;
    private final String equipment;
    
    public Route(String f, String t, String e) {
        from = f;
        to = t;
        equipment = e;
    }
    
    public String getFrom (){
        return from;
    }
    public String getTo (){
        return to;
    }
    public String getEquipment (){
        return equipment;
    }
    
    
}
