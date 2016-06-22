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
   // select * from flights where to_date(departure, 'DD/MM/YYYY')> '2016-07-10'; 
     public ArrayList<FlightView> getFlights(String departure) throws DaoException {
        ArrayList<FlightView> flightList = new ArrayList<>();
        String sql = "SELECT R.FROM, R.TO, F.PRICE \n" +
                     "FROM FLIGHTS F \n" +
                     "INNER JOIN ROUTES R \n" +
                     "ON R.ID = F.ID \n" +
                     "WHERE to_date(F.DEPARTURE, 'DD/MM/YYYY') > '2016-07-10'";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
               // command.setString(1, departure);
                try (ResultSet result = command.executeQuery()) {
                    while(result.next()) {
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
