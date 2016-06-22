/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PRESENTATION;

import ENTITIES.FlightView;
import java.util.ArrayList;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author felipebrizola
 */
public class BuildGrid {
    
    public void buildGridFlights(JTable grid, ArrayList<FlightView> flights) {
        DefaultTableModel modeloTable = (DefaultTableModel)grid.getModel();
        
        for (FlightView f : flights) {
             modeloTable.addRow(new Object[] { f.getFrom(),
                    f.getTo(), f.getPrice() });
        }
        
    }
}
