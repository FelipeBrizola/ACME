/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author felipebrizola
 */

import DAO.AirlinesDao;
import Entities.Airline;
import java.time.Clock;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        AirlinesDao dao =  new AirlinesDao();
        try {
            Airline airline = dao.getAirlineById("2B");
            System.out.println(airline.getAirlineId());
            System.out.println(airline.getAirlineName());
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
