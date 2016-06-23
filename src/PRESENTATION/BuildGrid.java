/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import ENTITIES.Flight;
import ENTITIES.Ticket;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author felipebrizola
 */
public class BuildGrid {
    
    public void buildGridFlights(JTable grid, ArrayList<Flight> flights) {
        DefaultTableModel modelTable = (DefaultTableModel)grid.getModel();
        
        for (Flight f : flights) {
             modelTable.addRow(new Object[] { f.getFrom(),
                    f.getTo(), f.getPrice() });
        }
        
    }
    
    public void buildGridCheckin(JTable grid, ArrayList<Ticket> tickets) {
        DefaultTableModel modelTable = (DefaultTableModel)grid.getModel();
        for (Ticket t : tickets) {
            modelTable.addRow(new Object[] { true,
                    true, true });
            
        }
    }
}
