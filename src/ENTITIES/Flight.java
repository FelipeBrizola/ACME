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
public class Flight {
    private final String from;
    private final String to;
    private final double price;
    private final int id;
    
    
    public Flight(String f, String t, double p, int id) {
        price = p;
        from = f;
        to = t;
        this.id = id;
    }
    
    public double getPrice() {
        return price;
    }
    public int getId() {
        return id;
    }
    public String getFrom() {
        return from;
    }
    public String getTo() {
        return to;
    }
}
