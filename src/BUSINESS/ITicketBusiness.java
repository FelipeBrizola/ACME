/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;

import ENTITIES.Ticket;
import java.util.ArrayList;

/**
 *
 * @author felipebrizola
 */
public interface ITicketBusiness {
    public Ticket getTicket(String ticketId) throws Exception;
    public ArrayList<Ticket> getTickets(String ticketId) throws Exception;
    public boolean confirmCheckin(String ticketId, String seat, String status) throws Exception;
    public boolean buyTicket(String name, String doc, String flightId) throws Exception;
}



