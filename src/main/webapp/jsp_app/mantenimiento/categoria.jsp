<%-- 
    Document   : index
    Created on : 09-jun-2019, 15:36:21
    Author     : Akin Ramirez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <!-- Header -->
  <jsp:include page="../layout/header.jsp"/>
  
    <!-- Body -->
    <div class="app-body">

      <!-- MENU -->
      <jsp:include page="../layout/menu.jsp"/>

      <!-- MAIN -->
      <main class="main">
        <br>
        <div class="container-fluid">
          <div class="animated fadeIn">
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header"><strong id="nameCrudCategorias">Categorias</strong></div>
                  <div class="card-body">

                    <input type="hidden" id="nameFormCategoria" value="FrmCategoria">
                    <input type="hidden" id="actionCategoria" name="action" value="paginarCategoria">
                    <input type="hidden" id="numberPageCategoria" name="numberPageCategoria" value="1">

                    <!--Formulario Buscar-->
                    <form action="action" id="FrmCategoria">

                      <div class="row mt-1">
                        <div class="form-group col-sm-9 col-12">
                          <input type="text" class="form-control" id="txtNombreCategoria" name="txtNombreCategoria" placeholder="BUSCAR" autocomplete="off">
                        </div>
                        <div class="col-sm-3 col-12">
                          <button type="submit" id="btnBuscarCategoria" class="btn btn-primary mr-3"><i class="fa fa-search"></i> Buscar</button>
                          <button type="button" class="btn btn-primary btn-xs" id="btnAbrirNCategoria" data-target="#ventanaModalManCategoria" data-toggle="tooltip" title="Agregar Categoria"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                        </div>
                      </div>

                    </form>

                    <!--Table-->
                    <div class="row">
                      <div class="col-12 mt-3">
                        <table class="table table-responsive-sm table-bordered table-striped table-sm">
                          <thead>
                            <tr>
                              <th class="text-center" style="width: 100px;">#</th>
                              <th class="text-center">Nombre</th>
                              <th class="text-center" style="width: 120px;">Acciones</th>
                            </tr>
                          </thead>
                          <tbody id="tbodyCategoria">

                          </tbody>
                        </table>

                        <div class="row">
                          <div class="col-md-2 col-sm-3 col-4">                        
                            <select class="form-control form-control-sm combo-paginar" id="sizePageCategoria" name="sizePageCategoria" idBtnBuscar="btnBuscarCategoria">
                              <option value="10">10</option>
                              <option value="15">15</option>
                              <option value="20">20</option>
                            </select>
                          </div>
                          <div class="col-md-10 col-sm-9 col-8">
                            <nav>
                              <ul id="paginationCategoria" class="pagination pagination-sm justify-content-end" >
                              </ul>
                            </nav>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </main>

    </div>   

    <!-- Footer -->
    <jsp:include page="../layout/footer.jsp"/>    
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/app/categoria.js"></script>
  </body>
</html>

<!--Modal Agregar-->
<div id="ventanaModalManCategoria" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form id="FrmCategoriaModal">
        <div class="modal-header">
          <h6 class="modal-title" id="tituloModalManCategoria"></h6>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="col-12">
            <div class="form-group">
              <label for="txtNombreCategoriaER">NOMBRE</label>
              <input type="text" id="txtNombreCategoriaER" name="txtNombreCategoriaER" class="form-control form-control-sm" placeholder="" autocomplete="off">
              <div class="error-validation" id="validarNombreCategoriaER">Ingrese Categoria</div>
            </div>
          </div>
          <input type="hidden" id="txtIdCategoriaER" name="txtIdCategoriaER" value="">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary btn-xs" data-dismiss="modal">CERRAR</button>
          <button type="submit" class="btn btn-primary btn-xs">GUARDAR</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!--Modal Cargando-->
<div class="modal" id="modalCargandoCategoria" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
        <div class="progress" style="margin-bottom: 0px;">
          <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
            Cargando...
          </div>
        </div>
      </div>
    </div>
  </div>
</div>