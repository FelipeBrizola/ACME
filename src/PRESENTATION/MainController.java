/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;
import BUSINESS.*;
import ENTITIES.Ticket;
import ENTITIES.Flight;
import ENTITIES.Promotion;
import java.util.ArrayList;
import javafx.util.Pair;
import javax.swing.JTable;
import javax.swing.JTextField;
/**
 *
 * @author felipebrizola
 */
public class MainController {
    
    private Window tlWin;
    private final TicketBusiness ticketFacade;
    private final FlightBusiness flightFacade;
    
    public MainController(){
        ticketFacade = new TicketBusiness();
        flightFacade =  new FlightBusiness();
    }
    
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
    void buildGridCheckin(JTable table, String tickedId) throws Exception {
        GridHelper bg = new GridHelper();
        bg.buildGridCheckin(table, ticketFacade.getTickets(tickedId));
    }
    
    void buildGridFlights(JTable table, String departure) throws Exception {
        GridHelper bg = new GridHelper();
        ArrayList<Flight> flights = new ArrayList<>();
        try {
            flights = flightFacade.getFlights(departure);
            bg.buildGridFlights(table, flights);
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
   }
    
    void confirmCheckin(String tickedId, String seat) throws Exception {
        try {
            ticketFacade.confirmCheckin(tickedId, seat, "checkin ok");
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }   
    }
    
    void getPromotion(String flightId, String originalPrice, JTextField discountValueTextField, JTextField descriptionTextField) throws Exception {
        Promotion p;
        try {
            p = flightFacade.getDiscount(flightId, originalPrice);
            
            descriptionTextField.setText(p.getDescription());
            discountValueTextField.setText( Double.toString(p.getDiscounted()) );
                        
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        
    }
    void buyTicket(String name, String doc, String flightId) throws Exception {
        try {
            ticketFacade.buyTicket(name, doc, flightId);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
