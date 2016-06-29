/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;
import DAO.DaoException;
import ENTITIES.Ticket;
import DAO.TicketDao;
import DAO.UserDao;
import DAO.FlightDao;
import ENTITIES.User;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
/**
 *
 * @author felipebrizola
 */
public class TicketBusiness implements ITicketBusiness{
    
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
        Ticket myTicket;
        ArrayList<Ticket> tickets = new ArrayList<>();
        TicketDao ticketDao =  new TicketDao();
         try {
            myTicket = this.getTicket(ticketId);
            flightId = myTicket.getFlightId();
            tickets = ticketDao.getTickets(flightId);
            
            if (isReadyToCheckin(seat, tickets, myTicket)) {
                ticketDao.confirmCheckin(seat, Integer.parseInt(ticketId), status);
                return true;
            }                            
        }
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }

         return false;
    }
    
    public boolean buyTicket(String name, String doc, String flightId) throws Exception {
        UserDao userDao = new UserDao();
        User user;
        TicketDao ticketDao =  new TicketDao();
        try {
            if (ticketDao.accentsBusy(flightId) > 40)
                throw new Exception("Não há lugares disponiveis nesse voo. Pf selecione outro");
            
            if (userDao.exists(name, doc) == 0) 
                userDao.insertUser(name, doc);
            
            user = userDao.getUserByDoc(doc);
            
            String status = getStatus(flightId);
            
            ticketDao.insertTicket(flightId, user.getId(), status);
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        return true;
    }
    
    private boolean isReadyToCheckin(String seat, ArrayList<Ticket> tickets, Ticket myTicket) throws Exception {
        for(int i = 0; i < tickets.size(); i++) {
            if (tickets.get(i).getSeat() != null && tickets.get(i).getSeat().equals(seat))
                throw new Exception("O assento já foi escolhido por outro passageiro. Escolha outro");
            if (!myTicket.getStatus().equals("check-in aberto"))
                throw new Exception("Check-in indisponível");
        }
        return true;
    }

    private String getStatus(String flightId) throws Exception {
        FlightDao flightDao = new FlightDao();
        String status = null;
        try {
            String departure = flightDao.getFlight(Integer.parseInt(flightId));
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy - HH:mm");
            Calendar c = Calendar.getInstance();
            c.setTime(new Date()); 
            c.add(Calendar.DATE, 3); 
            
            if(c.getTime().compareTo(sdf.parse(departure)) < 0)
                status = "pendente";
            else
                status = "check-in aberto";
                                
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
            
       return status;
    }

}
