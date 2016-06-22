/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;
import ENTITIES.FlightView;
import DAO.FlightDao;
import java.util.ArrayList;
/**
 *
 * @author felipebrizola
 */
public class FlightBusiness {
    public ArrayList<FlightView> getFlights(String departure) throws Exception {
        ArrayList<FlightView> flights = new ArrayList<>();
        try {
            FlightDao flightDao =  new FlightDao();
             flights = flightDao.getFlights(departure);
            return flights;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
