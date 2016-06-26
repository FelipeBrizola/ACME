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
    private final int salesId;
    
    
    public Flight(String f, String t, double p, int id, int s) {
        price = p;
        from = f;
        to = t;
        this.id = id;
        salesId = s;
    }
    
    public double getPrice() {
        return price;
    }
    public int getId() {
        return id;
    }
    public int getSalesId() {
        return salesId;
    }
    public String getFrom() {
        return from;
    }
    public String getTo() {
        return to;
    }
}
