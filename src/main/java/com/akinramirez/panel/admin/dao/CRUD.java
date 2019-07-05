/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akinramirez.panel.admin.dao;

import com.akinramirez.panel.admin.utilities.BEAN_CRUD;
import com.akinramirez.panel.admin.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Akin Ramirez
 * @param <T>
 */
public interface CRUD<T> {
    
    BEAN_PAGINATION getPagination(HashMap<String, Object> Parameters, Connection conn) throws SQLException;
    
    BEAN_PAGINATION getPagination(HashMap<String, Object> Parameters) throws SQLException;
    
    BEAN_CRUD add(T obj, HashMap<String, Object> Parameters) throws SQLException;
    
    BEAN_CRUD update(T obj, HashMap<String, Object> Parameters) throws SQLException;
    
    BEAN_CRUD delete(Integer id, HashMap<String, Object> Parameters) throws SQLException;
    
}
