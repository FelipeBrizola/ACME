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
     Ticket getTicket(String ticketId) throws Exception;
     ArrayList<Ticket> getTickets(String ticketId) throws Exception;
     boolean confirmCheckin(String ticketId, String seat, String status) throws Exception;
     boolean buyTicket(String name, String doc, String flightId) throws Exception;
}



