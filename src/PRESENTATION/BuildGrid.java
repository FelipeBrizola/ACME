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
             modelTable.addRow(new Object[] {f.getId(), f.getFrom(),
                    f.getTo(), f.getPrice(), f.getSalesId() });
        }
        
    }
    
    public void buildGridCheckin(JTable grid, ArrayList<Ticket> tickets) {
        DefaultTableModel modelTable = (DefaultTableModel)grid.getModel();
        
        resetGrid(modelTable);
        
        for (Ticket t : tickets) {
            if (t.getSeat() != null) {
                int i = Integer.parseInt(t.getSeat().substring(0,1));
                int j = Integer.parseInt(t.getSeat().substring(1,2));
                modelTable.setValueAt(true, i, j);
            }
            
        }
    }
    
    private void resetGrid(DefaultTableModel modelTable) {
        int rows = modelTable.getRowCount();
        int columns = modelTable.getColumnCount();
        
        for (int i = 0; i < rows; i ++ )
            for (int j = 0; j < columns; j ++ )
                modelTable.setValueAt(false, i, j);
            
        
    }
    
}
