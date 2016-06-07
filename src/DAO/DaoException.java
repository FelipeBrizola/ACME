/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author felipebrizola
 */
public class DaoException extends Exception {

    public DaoException(String message) {
        super(message);
    }
    public DaoException(String message, Exception ex) {
        super(message, ex);
    }

}
