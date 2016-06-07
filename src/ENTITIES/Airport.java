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
public class Airport {
    String airportId;
    String name;
    String longitude;
    String latitude;
    
    public void setName(String n) {
        name = n;
    }
    public void setAirportId(String id) {
        airportId = id;
    }
    public void setLongitude(String lon) {
        longitude = lon;
    }
    public void setLatitude(String lat) {
        latitude = lat;
    }
    public String getName(){
        return name;
    }
    public String getAirportId(){
        return airportId;
    }
    public String getLatitude(){
        return latitude;
    }
    public String getLongitude(){
        return longitude;
    }
}
