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
            Ticket t = ticketDao.getTicket(ticketId);
            return t;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    public ArrayList<Ticket> getTickets(String ticketId) throws Exception {
        int flightId = 0;
        ArrayList<Ticket> t = new ArrayList<>();
        TicketDao ticketDao =  new TicketDao();
         try {
            flightId = this.getTicket(ticketId).getFlightId();
            t = ticketDao.getTickets(flightId);
            return t;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    
    public boolean confirmCheckin(String ticketId, String seat, String status) throws Exception {
        int flightId = 0;
        ArrayList<Ticket> tickets = new ArrayList<>();
        TicketDao ticketDao =  new TicketDao();
         try {
            flightId = this.getTicket(ticketId).getFlightId();
            tickets = ticketDao.getTickets(flightId);
            if (isReadyToCheckin(seat, tickets)) {
                ticketDao.confirmCheckin(seat, Integer.parseInt(ticketId), status);
                return true;
            }                            
        }
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }

         return false;
    }
    
    private boolean isReadyToCheckin(String seat, ArrayList<Ticket> tickets) throws Exception {
        for(int i = 0; i < tickets.size(); i++) {
            if (tickets.get(i).getSeat() != null && tickets.get(i).getSeat().equals(seat))
                throw new Exception("O assento já foi escolhido por outro passageiro. Escolha outro");
            
        }
        return true;
    }

}
