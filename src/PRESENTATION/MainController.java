/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;
import BUSINESS.*;
import ENTITIES.TicketView;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        TicketBusiness t = new TicketBusiness();
        TicketView tv;
        try {
            tv = t.getTicket(tickedId);
            from.setText(tv.getFrom());
            to.setText(tv.getTo());
            seat.setText(tv.getSeat());
            status.setText(tv.getStatus());
            date.setText(tv.getDate());
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
        
    }
    
}
