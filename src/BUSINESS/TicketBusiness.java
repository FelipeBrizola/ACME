/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;
import ENTITIES.TicketView;
import DAO.TicketDao;
/**
 *
 * @author felipebrizola
 */
public class TicketBusiness {
    
    public TicketView getTicket(String ticketId) throws Exception {
        try {
            TicketDao ticketDao =  new TicketDao();
            TicketView t = ticketDao.getTicketView(ticketId);
            return t;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
