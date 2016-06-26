/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ENTITIES;

import java.util.ArrayList;

/**
 *
 * @author felipebrizola
 */
public class Promotion {
    
    private final double originalPrice;
    private final double discountedPrice;
    private final String description;
    
    
    public Promotion(double o, double disc, String desc) {
        originalPrice = o;
        discountedPrice = disc;
        description = desc;
    }
    
    public double getOriginalPrice() {
     return originalPrice;   
    }
    public double getDiscounted() {
     return discountedPrice;   
    }
    public String getDescription() {
     return description;   
    }

}
