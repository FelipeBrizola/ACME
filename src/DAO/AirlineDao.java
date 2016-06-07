/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import ENTITIES.Airline;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author felipebrizola
 */
public class AirlineDao {
    
        public Airline getAirlineById(String id) throws DaoException {
        Airline airline = null;
        String sql = "SELECT * FROM AIRLINES WHERE AIRLINE_ID = ?";
        try (Connection connection = dbFactory.getConnection()) {
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, id);
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        airline = new Airline();
                        airline.setAirlineId(result.getString("AIRLINE_ID"));
                        airline.setAirlineName(result.getString("AIRLINE_NAME"));
                    }
                    return airline;
                }
            }
        } catch (Exception ex) {
            throw new DaoException("Falha na busca. " + ex.getMessage());
        }
    }
}
