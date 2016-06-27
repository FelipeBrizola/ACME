/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;
import ENTITIES.Flight;
import DAO.FlightDao;
import ENTITIES.Promotion;
import java.util.ArrayList;
import javafx.util.Pair;
/**
 *
 * @author felipebrizola
 */
public class FlightBusiness implements IFlightBusiness{
    
    @Override
    public ArrayList<Flight> getFlights(String departure) throws Exception {
        ArrayList<Flight> flights = new ArrayList<>();
        try {
            FlightDao flightDao =  new FlightDao();
             flights = flightDao.getFlights(departure);
            return flights;
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    
    @Override
    public Promotion getDiscount(String flightId, String originalPrice) throws Exception {
        Pair<String, String> discountPair = null;
        Promotion promotion = null;
        FlightDao flightDao =  new FlightDao();
        double origPriceParsed = Double.parseDouble(originalPrice);
        try {
            discountPair = flightDao.getDiscount(Integer.parseInt(flightId));
            
            if (discountPair == null) {
                promotion = new Promotion(origPriceParsed, origPriceParsed, "n/a");
                return promotion;
            }
            
            double discontedPrice = origPriceParsed - (origPriceParsed * (Double.parseDouble(discountPair.getValue()) / 100));
            promotion = new Promotion(origPriceParsed, discontedPrice, discountPair.getKey());
            
             return promotion;
            
        }
        
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
