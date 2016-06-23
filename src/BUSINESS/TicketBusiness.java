/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;
import ENTITIES.Ticket;
import DAO.TicketDao;
import java.util.ArrayList;
/**
 *
 * @author felipebrizola
 */
public class TicketBusiness {
    
    public Ticket getTicket(String ticketId) throws Exception {
        try {
            TicketDao ticketDao =  new TicketDao();
            Ticket t = ticketDao.getTicketView(ticketId);
            return t;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    public ArrayList<Ticket> getTickets(String flightId) throws Exception {
        ArrayList<Ticket> t = new ArrayList<>();
        TicketDao ticketDao =  new TicketDao();
         try {
             // dever ser no validador
            int flId = Integer.parseInt(flightId);     
            
            t = ticketDao.getTickets(flId);
            return t;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
