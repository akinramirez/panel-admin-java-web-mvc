/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akinramirez.panel.admin.api;

import com.akinramirez.panel.admin.dao.CategoriaDAO;
import com.akinramirez.panel.admin.impl.CategoriaDAOImp;
import com.akinramirez.panel.admin.model.Categoria;
import com.akinramirez.panel.admin.utilities.BEAN_CRUD;
import com.akinramirez.panel.admin.utilities.BEAN_PAGINATION;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
//import java.io.PrintWriter;
import java.util.HashMap;
import java.util.function.Supplier;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Akin Ramirez
 */
@WebServlet(name = "CategoriaApi", urlPatterns = {"/categorias"})
public class CategoriaApi extends HttpServlet {

  private static final Logger LOG = Logger.getLogger(CategoriaApi.class.getName());
  @Resource(name = "jdbc/paneladmin")
 
  private DataSource pool;
  private Gson jsonParse;
  private String jsonResponse;
  private HashMap<String, Object> parameters;
  private String action;

  private CategoriaDAO categoriaDAO;

  @Override
  public void init() throws ServletException {
    super.init(); //To change body of generated methods, choose Tools | Templates.
    this.parameters = new HashMap<>();
    this.jsonParse = new Gson();

    this.categoriaDAO = new CategoriaDAOImp(this.pool);
  }

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    /*
    // PRUEBA DE CONEXION A BD CON EL ARCHIVO context.xml
    //*******************************************************************
    try {
      if (this.pool.getConnection() != null) {
//        Connection prueba = this.pool.getConnection();
        LOG.info("CONEXION EXITOSA!");
//        LOG.info((Supplier<String>) prueba);
      } else {
        LOG.info("CONEXION FALLIDA!");
      }
    } catch (SQLException ex) {
      Logger.getLogger(CategoriaApi.class.getName()).log(Level.SEVERE, null, ex);
    }
    //*******************************************************************
    */
    try {
      this.action = request.getParameter("action") == null ? "" : request.getParameter("action");

      switch (this.action) {
        case "paginarCategoria":
          /*
          BEAN_PAGINATION beanPagination = this.categoriaDAO.getPagination(getParameters(request));
          BEAN_CRUD beanCrud = new BEAN_CRUD(beanPagination);
          processCategoria(beanCrud, response);
           */
          processCategoria(new BEAN_CRUD(this.categoriaDAO.getPagination(getParameters(request))), response);
          break;
        case "addCategoria":
          processCategoria(this.categoriaDAO.add(getCategoria(request), parameters), response);
          break;
        case "updateCategoria":
          processCategoria(this.categoriaDAO.update(getCategoria(request), parameters), response);
          break;
        case "deleteCategoria":
          processCategoria(this.categoriaDAO.delete(Integer.parseInt(request.getParameter("txtIdCategoriaER")), parameters), response);
          break;
        default:
          request.getRequestDispatcher("/jsp_app/mantenimiento/categoria.jsp").forward(request, response);
          break;
      }
    } catch (SQLException ex) {
      Logger.getLogger(CategoriaApi.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  private Categoria getCategoria(HttpServletRequest request) {
    Categoria categoria = new Categoria();
    if (request.getParameter("action").equals("updateCategoria")) {
      categoria.setIdcategoria(Integer.parseInt(request.getParameter("txtIdCategoriaER")));
    }
    categoria.setNombre(request.getParameter("txtNombreCategoriaER"));
    return categoria;
  }

  public HashMap<String, Object> getParameters(HttpServletRequest request) {
    this.parameters.clear();
    this.parameters.put("FILTER", (request.getParameter("txtNombreCategoria")).toLowerCase());
    this.parameters.put("SQL_ORDERS", "IDCATEGORIA DESC");
    if (request.getParameter("sizePageCategoria").equals("ALL")) {
      this.parameters.put("SQL_LIMIT", "");
    } else {
      this.parameters.put("SQL_LIMIT", " LIMIT " + request.getParameter("sizePageCategoria") + " OFFSET "
              + (Integer.parseInt(request.getParameter("numberPageCategoria")) - 1) 
              * Integer.parseInt(request.getParameter("sizePageCategoria")));
    }
    return this.parameters;
  }
//
//  private void processCategoria(BEAN_CRUD beanCrud, HttpServletResponse response) {
//    try {
//      this.jsonResponse = this.jsonParse.toJson(beanCrud);
//      LOG.info(this.jsonResponse);
//      response.setContentType("application/json");
//      response.getWriter().write(this.jsonResponse);
//    } catch (IOException ex) {
//      Logger.getLogger(CategoriaApi.class.getName()).log(Level.SEVERE, null, ex);
//    }
//  }

  private void processCategoria(BEAN_CRUD beanCrud, HttpServletResponse response) {
    try {
      this.jsonResponse = this.jsonParse.toJson(beanCrud);
      LOG.info(this.jsonResponse);
      response.setContentType("application/json");
      response.getWriter().write(this.jsonResponse);
    } catch (IOException ex) {
      Logger.getLogger(CategoriaApi.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>
}
