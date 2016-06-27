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
    public User getUser(String email, String pass) throws DaoException;
    public User getUserByDoc(String doc) throws DaoException;
     public boolean insertUser(String name, String doc) throws DaoException;
     public int exists(String name, String doc) throws DaoException;
}


