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
public class TicketView {
    
    private final String from;
    private final String to;
    private final String seat;
    private final String status;
    private final String date;
 
    public TicketView(String f, String t, String s, String st, String d){
        from = f;
        to = t;
        seat = s;
        status = st;
        date = d;
    }
    
    public String getFrom() {
        return from;
    }
    
    public String getTo() {
        return to;
    }
    
    public String getSeat() {
        return seat;
    }
    
    public String getStatus() {
        return status;
    }
    
    public String getDate() {
        return date;
    }
    
}
