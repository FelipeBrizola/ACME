/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import ENTITIES.User;

/**
 *
 * @author felipebrizola
 */
public interface IUserDao {
     User getUser(String email, String pass) throws DaoException;
     User getUserByDoc(String doc) throws DaoException;
     boolean insertUser(String name, String doc) throws DaoException;
     int exists(String name, String doc) throws DaoException;
}


