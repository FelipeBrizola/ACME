/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;

import ENTITIES.Flight;
import ENTITIES.Promotion;
import java.util.ArrayList;

/**
 *
 * @author felipebrizola
 */
public interface IFlightBusiness {
    ArrayList<Flight> getFlights(String departure) throws Exception; 
    Promotion getDiscount(String flightId, String originalPrice) throws Exception;
}

