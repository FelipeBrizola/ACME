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
    private String from;
    private String to;
    private double price;
    
    public Flight(String f, String t, double p) {
        price = p;
        from = f;
        to = t;
    }
    
    public double getPrice() {
        return price;
    }
    public String getFrom() {
        return from;
    }
    public String getTo() {
        return to;
    }
}
