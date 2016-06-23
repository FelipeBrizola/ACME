/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;
import BUSINESS.*;
import ENTITIES.Ticket;
import ENTITIES.Flight;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.JTextField;
/**
 *
 * @author felipebrizola
 */
public class MainController {
    
    private Window tlWin;
    public Window getPrincipalWindow() {
        return tlWin;
    }
    public void init() {
        setPrincipalWindow(new Window());
    }
    
    private void setPrincipalWindow(Window win) {
        this.tlWin = win;
        tlWin.setPrincipal(this);
    }

    void getTickets(String tickedId, JTextField from, JTextField to, JTextField seat, JTextField status, JTextField date) throws Exception {
        TicketBusiness tb = new TicketBusiness();
        Ticket tv;
        try {
            tv = tb.getTicket(tickedId);
            from.setText(tv.getFrom());
            to.setText(tv.getTo());
            seat.setText(tv.getSeat());
            status.setText(tv.getStatus());
            date.setText(tv.getDate());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        
    }
    void buildGridCheckin(JTable table, ArrayList<Ticket> tickets) throws Exception {
        BuildGrid bg = new BuildGrid();
        bg.buildGridCheckin(table, tickets);
    }
    
    void buildGridFlights(JTable table, ArrayList<Flight> flights) {
        BuildGrid bg = new BuildGrid();
        bg.buildGridFlights(table, flights);
   }
}
