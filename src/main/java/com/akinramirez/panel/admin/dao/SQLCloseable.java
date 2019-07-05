/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akinramirez.panel.admin.dao;

import java.sql.SQLException;

/**
 *
 * @author Akin Ramirez
 */
public interface SQLCloseable extends AutoCloseable{

    @Override
    public void close() throws SQLException;
    
}
