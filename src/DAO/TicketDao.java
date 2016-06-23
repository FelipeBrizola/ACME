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
public class TicketDao {
    
    public Ticket getTicketView(String ticketId) throws DaoException {
        Ticket t = null;
        String sql = "select r.from, r.to, t.seat, t.status, f.departure from tickets t "
                + "inner join flights f on t.flight_id = f.id inner join routes r on r.id = f.route_id where f.id = ?";
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
                        t = new Ticket(from, to, seat, status, date);
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
        String sql = "	select * from tickets where flight_id = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
               command.setInt(1, flightId);
                try (ResultSet result = command.executeQuery()) {
                    while(result.next()) {
                        String seat = result.getString("SEAT");
                        String status = result.getString("STATUS");
                        TicketViewList.add(new Ticket(null, null, seat, status, null));
                    }
                }

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar passagen. ");
        }
        if(TicketViewList.isEmpty())
            throw new DaoException("Não há voo");
        
        return TicketViewList;
    }
}
