/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ENTITIES;

/**
 *
 * @author felipebrizola
 */
public class Airline {
    private String AirlineId;
    private String AirlineName;
    
    public String getAirlineId() {
        return AirlineId;
    }
    public String getAirlineName() {
        return AirlineName;
    }
    public void setAirlineId(String id) {
        AirlineId = id;
    }
    public void setAirlineName(String name) {
        AirlineName = name;
    }
    
}
