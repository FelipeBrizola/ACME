/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ENTITIES.Flight;
import java.util.ArrayList;
import javafx.util.Pair;

/**
 *
 * @author felipebrizola
 */
public interface IFlightDao {
     ArrayList<Flight> getFlights(String departure) throws DaoException;
     Pair<String, String> getDiscount(int flightId) throws DaoException;
     String getFlight(int flightId) throws DaoException;
}


