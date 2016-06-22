/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import ENTITIES.FlightView;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author felipebrizola
 */
public class FlightDao {
    
     public ArrayList<FlightView> getFlights(String departure) throws DaoException {
        ArrayList<FlightView> flightList = new ArrayList<>();
        String sql = "SELECT R.FROM, R.TO, F.PRICE FROM FLIGHTS F INNER JOIN ROUTES R ON R.ID = F.ID WHERE F.DEPARTURE = ?";
        Connection connection = dbFactory.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, departure);
                try (ResultSet result = command.executeQuery()) {
                    if (result.next()) {
                        String fFrom = result.getString("FROM");
                        String fTo = result.getString("TO");
                        double fPrice = result.getDouble("PRICE");
                        
                        flightList.add(new FlightView(fFrom, fTo, fPrice));
                    }
                }
           

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar passagens. ");
        }
        if(flightList.isEmpty())
            throw new DaoException("Nenhuma passagem disponivel");
        
        return flightList;
                   
    }
}
