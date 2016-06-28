/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BUSINESS;

import ENTITIES.User;

/**
 *
 * @author felipebrizola
 */
public interface IUserBusiness {
     User login(String email, String pass) throws Exception;
     boolean insertUser(String name, String doc) throws Exception;
}
