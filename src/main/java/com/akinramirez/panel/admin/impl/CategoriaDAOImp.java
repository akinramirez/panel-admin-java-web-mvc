/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akinramirez.panel.admin.impl;

import com.akinramirez.panel.admin.dao.CategoriaDAO;
import com.akinramirez.panel.admin.dao.SQLCloseable;
import com.akinramirez.panel.admin.model.Categoria;
import com.akinramirez.panel.admin.utilities.BEAN_CRUD;
import com.akinramirez.panel.admin.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;
//import javax.activation.DataSource;
import javax.sql.DataSource;

/**
 *
 * @author Akin Ramirez
 */
public class CategoriaDAOImp implements CategoriaDAO {

  private static final Logger LOG = Logger.getLogger(CategoriaDAOImp.class.getName());
  private final DataSource pool;

  public CategoriaDAOImp(DataSource pool) {
    this.pool = pool;
  }
  
  
  
  @Override
  public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
    BEAN_PAGINATION beanPagination = new BEAN_PAGINATION();
    List<Categoria> list = new ArrayList<>();
    PreparedStatement pst;
    ResultSet rs;
    try {
      pst = conn.prepareStatement("SELECT COUNT(IDCATEGORIA) AS COUNT FROM CATEGORIA WHERE "
              + "LOWER(NOMBRE) LIKE CONCAT('%',?,'%')");
      pst.setString(1, String.valueOf(parameters.get("FILTER")));
      LOG.info(pst.toString());
      rs = pst.executeQuery();
      while (rs.next()) {
        beanPagination.setCOUNT_FILTER(rs.getInt("COUNT"));
        if (rs.getInt("COUNT") > 0) {
          pst = conn.prepareStatement("SELECT * FROM CATEGORIA WHERE "
                  + "LOWER(NOMBRE) LIKE CONCAT('%',?,'%') "
                  + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("SQL_LIMIT"));
          pst.setString(1, String.valueOf(parameters.get("FILTER")));
          LOG.info(pst.toString());
          rs = pst.executeQuery();
          while (rs.next()) {
            Categoria categoria = new Categoria();
            categoria.setIdcategoria(rs.getInt("IDCATEGORIA"));
            categoria.setNombre(rs.getString("NOMBRE"));
            list.add(categoria);
          }
        }
      }
      beanPagination.setLIST(list);
      rs.close();
      pst.close();
    } catch (SQLException ex) {
      throw ex;
    }
    return beanPagination;
  }

  @Override
  public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters) throws SQLException {
    BEAN_PAGINATION beanPagination = null;
    try (Connection conn = pool.getConnection()) {
      beanPagination = getPagination(parameters, conn);
    } catch (SQLException e) {
      throw e;
    }
    return beanPagination;
  }

  @Override
  public BEAN_CRUD add(Categoria obj, HashMap<String, Object> Parameters) throws SQLException {
    BEAN_CRUD beanCrud = new BEAN_CRUD();
    PreparedStatement pst;
    ResultSet rs;
    try (Connection conn = this.pool.getConnection();
            SQLCloseable finish = conn::rollback;) {
      conn.setAutoCommit(false);
      pst = conn.prepareStatement("SELECT COUNT(IDCATEGORIA) AS COUNT FROM CATEGORIA WHERE NOMBRE = ?");
      pst.setString(1, obj.getNombre());
      LOG.info(pst.toString());
      rs = pst.executeQuery();
      while (rs.next()) {
        if (rs.getInt("COUNT") == 0) {
          //REALIZAMOS LA TRANSACCION
          pst = conn.prepareStatement("INSERT INTO CATEGORIA (NOMBRE) VALUES (?)");
          pst.setString(1, obj.getNombre());
          LOG.info(pst.toString());
          pst.executeUpdate();
          conn.commit();
          beanCrud.setMESSAGE_SERVER("ok");
          beanCrud.setBEAN_PAGINATION(getPagination(Parameters, conn));
        } else {
          //RECHAZAMOS EL REGISTRO
          beanCrud.setMESSAGE_SERVER("NO SE REGISTRO!, YA EXISTE UNA CATEGORIA CON EL NOMBRE INGRESADO");
        }
      }
      rs.close();
      pst.close();
    } catch (SQLException e) {

      throw e;
    }

    return beanCrud;
  }

  @Override
  public BEAN_CRUD update(Categoria obj, HashMap<String, Object> Parameters) throws SQLException {
    BEAN_CRUD beanCrud = new BEAN_CRUD();
    PreparedStatement pst;
    ResultSet rs;
    try (Connection conn = this.pool.getConnection();
            SQLCloseable finish = conn::rollback;) {
      conn.setAutoCommit(false);
      pst = conn.prepareStatement("SELECT COUNT(IDCATEGORIA) AS COUNT FROM CATEGORIA WHERE NOMBRE = ? AND IDCATEGORIA != ?");
      pst.setString(1, obj.getNombre());
      pst.setInt(2, obj.getIdcategoria());
      LOG.info(pst.toString());
      rs = pst.executeQuery();
      while (rs.next()) {
        if (rs.getInt("COUNT") == 0) {
          //REALIZAMOS LA TRANSACCION
          pst = conn.prepareStatement("UPDATE CATEGORIA SET NOMBRE = ? WHERE IDCATEGORIA = ?");
          pst.setString(1, obj.getNombre());
          pst.setInt(2, obj.getIdcategoria());
          LOG.info(pst.toString());
          pst.executeUpdate();
          conn.commit();
          beanCrud.setMESSAGE_SERVER("ok");
          beanCrud.setBEAN_PAGINATION(getPagination(Parameters, conn));
        } else {
          //RECHAZAMOS EL REGISTRO
          beanCrud.setMESSAGE_SERVER("NO SE ACTUALIZO!, YA EXISTE UNA CATEGORIA CON EL NOMBRE INGRESADO");
        }
      }
      rs.close();
      pst.close();
    } catch (SQLException e) {

      throw e;
    }

    return beanCrud;
  }

  @Override
  public BEAN_CRUD delete(Integer id, HashMap<String, Object> Parameters) throws SQLException {
    BEAN_CRUD beanCrud = new BEAN_CRUD();
    PreparedStatement pst;
    ResultSet rs;

    try (Connection conn = this.pool.getConnection(); SQLCloseable finish = conn::rollback;) {
      conn.setAutoCommit(false);
      pst = conn.prepareStatement("SELECT COUNT(IDCATEGORIA) AS COUNT FROM PRODUCTO WHERE IDCATEGORIA = ?");
      pst.setInt(1, id);
      rs = pst.executeQuery();
      while (rs.next()) {
        if (rs.getInt("COUNT") == 0) {
          pst = conn.prepareStatement("DELETE FROM CATEGORIA WHERE IDCATEGORIA = ?");
          pst.setInt(1, id);
          LOG.info(pst.toString());
          pst.executeUpdate();
          conn.commit();
          beanCrud.setMESSAGE_SERVER("ok");
          beanCrud.setBEAN_PAGINATION(getPagination(Parameters, conn));
        } else {
          beanCrud.setMESSAGE_SERVER("No se eliminó, existe un Producto asociado a esta Categoria");
        }
      }
      pst.close();
      rs.close();
    } catch (SQLException e) {
      throw e;
    }
    return beanCrud;
  }
}
