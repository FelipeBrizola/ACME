/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import ENTITIES.Flight;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javafx.util.Pair;

/**
 *
 * @author felipebrizola
 */
public class FlightDao implements IFlightDao {

     @Override
     public ArrayList<Flight> getFlights(String departure) throws DaoException {
        ArrayList<Flight> flightList = new ArrayList<>();
        String hour = null;
        String sql = "select * \n" +
                     "from \n" +
                     "(select R.FROM,\n" +
                        "R.TO,\n" +
                        "F.PRICE,\n" +
                        "F.ID,\n" +
                        "F.SALES_ID,\n" +
                        "to_timestamp(departure, 'dd/mm/yyyy - HH24:MI') as data_voo\n" +
                        "from FLIGHTS F\n" +
                        "inner join ROUTES R on R.ID = F.ROUTE_ID) as sub ";
        // pesquisa de voo no mesmo dia
        if (departure.length() > 10) {
            hour =  departure.substring(13);
            sql = sql + "where to_timestamp(date_part('day', data_voo)||'/'|| date_part('month', data_voo)||'/'||date_part('year', data_voo), 'DD/MM/YYYY') = to_timestamp(? , 'DD/MM/YYYY')\n" +
                        "and to_timestamp(date_part('hour', data_voo)||':'||date_part('minute', data_voo), 'HH24:MI') >= to_timestamp(? , 'HH24:MI')";
        }
        // voos futuros
        else
            sql = sql + "where to_timestamp(? , 'dd/mm/yyyy') = to_timestamp(date_part('day', data_voo)||'/'|| date_part('month', data_voo)||'/'||date_part('year', data_voo), 'DD/MM/YYYY')";
        
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setString(1, departure);
                if (departure.length() > 10)
                    command.setString(2, hour);
                    
                try (ResultSet result = command.executeQuery()) {
                    while(result.next()) {
                        String fFrom = result.getString("FROM");
                        String fTo = result.getString("TO");
                        double fPrice = result.getDouble("PRICE");
                        int fId = result.getInt("ID");
                        int fSalesId = result.getInt("SALES_ID");
                        
                        flightList.add(new Flight(fFrom, fTo, fPrice, fId, fSalesId));
                    }
                }
           

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar passagens. ");
        }
        if(flightList.isEmpty())
            throw new DaoException("Nenhuma passagem disponivel");
        
        return flightList;
                   
    }
     @Override
     public Pair<String, String> getDiscount(int flightId) throws DaoException {
         Pair<String, String> discountPair = null;
         
        String sql = "select s.description, s.discount from flights f\n" +
                     "inner join sales s\n" +
                     "on s.id = f.sales_id where f.id = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setInt(1, flightId);
                try (ResultSet result = command.executeQuery()) {
                    while(result.next()) {
                        discountPair = new Pair<>(result.getString("DESCRIPTION"), Integer.toString(result.getInt("DISCOUNT")));

                    }
                }   

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar descontos. ");
        }

        return discountPair;
     }
     
     @Override
     public String getFlight(int flightId) throws DaoException {
        String departure = null;
        String sql = "select departure from flights where id = ?";
        Connection connection = dbConnection.getConnection();
            try (PreparedStatement command = connection.prepareStatement(sql)) {
                command.setInt(1, flightId);
                try (ResultSet result = command.executeQuery()) {
                    while(result.next()) {
                        departure = result.getString("DEPARTURE");

                    }
                }   

        } catch (Exception ex) {
            throw new DaoException("Falha ao buscar voo ");
        }

        return departure;
     }
}
