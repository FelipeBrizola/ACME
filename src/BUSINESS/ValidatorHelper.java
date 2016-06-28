/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;

/**
 *
 * @author felipebrizola
 */
public class  ValidatorHelper {
    private static ValidatorHelper validador = null;

    private ValidatorHelper() {}

    public static ValidatorHelper getInstance() {
        if (validador == null) {
            validador = new ValidatorHelper();
        }
        return (validador);
    }

    public boolean validateConfirmCheckin(String value) {
        return value.length() < 3 && value.length() > 0 ? true : false;
    }
    public boolean validateName(String value) {
        return value.length() < 5 || value.length() > 70 ? true : false;
    }
    public boolean validateDocument(String value) {
        return value.length() != 11 ? true : false;
    }
    public boolean validateDate (String date) {
        return date.matches("\\d{2}/\\d{2}/\\d{4}");
    }
}
