/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import ENTITIES.Ticket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author felipebrizola
 */
public class TicketDao implements ITIcketDao {
    
    public Ticket getTicket(String ticketId) throws DaoException {
        Ticket t = null;
        String sql = "select r.from, r.to, t.seat, t.status, f.departure, f.id from tickets t "
                + "inner join flights f on t.flight_id = f.id inner join routes r on r.id = f.route_id where t.id = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setInt(1, Integer.parseInt(ticketId));
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        
                        String from = result.getString("FROM");
                        String to = result.getString("TO");
                        String seat = result.getString("SEAT");
                        String status = result.getString("STATUS");
                        String date = result.getString("DEPARTURE");
                        int flightId =  result.getInt("ID");
                        t = new Ticket(from, to, seat, status, date, flightId);
                    }
            }
        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar passagem. ");
        }
        if (t == null)
            throw new DaoException("Passagem nao encontrada");       

        return t;
    }
    
    public ArrayList<Ticket> getTickets(int flightId) throws DaoException {
        ArrayList<Ticket> TicketViewList = new ArrayList<>();
        String sql = "SELECT * FROM tickets WHERE flight_id = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
               command.setInt(1, flightId);
                try (ResultSet result = command.executeQuery()) {
                    while(result.next()) {
                        String seat = result.getString("SEAT");
                        String status = result.getString("STATUS");
                        TicketViewList.add(new Ticket(null, null, seat, status, null, 0));
                    }
                }

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar passagen. ");
        }
        if(TicketViewList.isEmpty())
            throw new DaoException("Não há voo");
        
        return TicketViewList;
    }

    public boolean confirmCheckin(String seat, int ticketId, String status) throws DaoException {
        int rows = 0;
        String sql = "UPDATE tickets SET seat = ?, status = ? WHERE id = ?";
         Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, seat);
                command.setString(2, status);
                command.setInt(3, ticketId);
                rows = command.executeUpdate();
            
        } catch (Exception ex) {
            throw new DaoException("Falha ao confirmar checkin");
        }
            if(rows > 0)
                return true;
            return false;
    }
    
    public boolean insertTicket(String flightId, int userId, String status) throws DaoException {
        int rows = 0;
        String sql = "INSERT INTO TICKETS(FLIGHT_ID, USER_ID, STATUS) VALUES(?, ?, ?)";
         Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setInt(1, Integer.parseInt(flightId));
                command.setInt(2, userId);
                command.setString(3, status);
                rows = command.executeUpdate();
            
        } catch (Exception ex) {
            throw new DaoException("Falha ao criar passagem");
        }
            if(rows > 0)
                return true;
            return false;
    }
    
    public int accentsBusy(String flightId) throws DaoException {
        int rows = 0;
        String sql = "select  count(*) from flights f\n" +
                     "inner join tickets t\n" +
                     "on t.flight_id = f.id\n" +
                     "where f.id = ?";
         Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setInt(1, Integer.parseInt(flightId));
                try (ResultSet result = command.executeQuery()) {
                    if (result.next())
                        rows = result.getInt(1);
                }
            
        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar acentos disponiveis.");
        }
            return rows;
    }
    
}
