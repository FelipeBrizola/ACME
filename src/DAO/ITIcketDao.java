/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ENTITIES.Ticket;
import java.util.ArrayList;

/**
 *
 * @author felipebrizola
 */
public interface ITIcketDao {
     Ticket getTicket(String ticketId) throws DaoException;
     ArrayList<Ticket> getTickets(int flightId) throws DaoException;
     boolean confirmCheckin(String seat, int ticketId, String status) throws DaoException;
     boolean insertTicket(String flightId, int userId, String status) throws DaoException;
     int accentsBusy(String flightId) throws DaoException;
}


