/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import ENTITIES.TicketView;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author felipebrizola
 */
public class TicketDao {
    
    public TicketView getTicketView(String ticketId) throws DaoException {
        TicketView t = null;
        String sql = "select r.from, r.to, t.seat, t.status, f.date from tickets t "
                + "inner join flights f on t.flight_id = f.id inner join routes r on r.id = f.route_id where f.id = ?";
        Connection connection = dbFactory.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setInt(1, Integer.parseInt(ticketId));
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        
                        String from = result.getString("FROM");
                        String to = result.getString("TO");
                        String seat = result.getString("SEAT");
                        String status = result.getString("STATUS");
                        String date = result.getString("DATE");
                        t = new TicketView(from, to, seat, status, date);
                    }
            }
        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar passagem. ");
        }
        if (t == null)
            throw new DaoException("Passagem nao encontrada");
        
        
        return t;
    }
}
