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
    
    <body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">

        <!-- Header -->
        <header class="app-header navbar">
            <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#">
                <span class="logo"><b>PANEL ADMIN</b></span>
            </a>
            <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- CERRAR SESSION -->
            <ul class="nav navbar-nav ml-auto">        
                <li class="nav-item dropdown">
                    <a class="nav-link" href="index.html" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="dropdown-item" ><i class="fa fa-lock"></i> Cerrar Sesion</a></span>
                    </a>
                </li>
            </ul>

        </header>

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
                                    <div class="card-header">
                                        <strong>Productos</strong>
                                    </div>
                                    <div class="card-body">
                                        <form action="action" id="FrmProducto">
                                            <div class="row mt-1">
                                                <div class="form-group col-sm-9 col-12">
                                                    <input type="text" class="form-control" id="txtNombreProducto" name="txtNombreProducto" placeholder="BUSCAR">
                                                </div>
                                                <div class="col-sm-3 col-12">
                                                    <button type="submit" id="btnBuscarProducto" class="btn btn-primary mr-3"><i class="fa fa-search"></i> Buscar</button>
                                                    <button type="button" id="btnAbrirNProducto" class="btn btn-primary"><i class="fa fa-plus-square"></i></button>
                                                </div>
                                            </div>

                                        </form>

                                        <div class="row">
                                            <div class="col-12 mt-3">
                                                <table class="table table-responsive-sm table-bordered table-striped table-sm">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Nombre</th>
                                                            <th>Precio</th>
                                                            <th>Stock</th>
                                                            <th>Stock Min</th>
                                                            <th>Stock Max</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                        </tr>
                                                        <tr>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                        </tr>
                                                        <tr>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                        </tr>
                                                        <tr>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                        </tr>
                                                        <tr>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                        </tr>
                                                        <tr>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                            <td>xxxxxxx</td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                                <div class="row">
                                                    <div class="col-md-2 col-12">                                               
                                                        <select class="form-control" id="sizePageProducto" name="sizePageProducto">
                                                            <option value="10">10</option>
                                                            <option value="15">15</option>
                                                            <option value="20">20</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-10 col-12">
                                                        <nav>
                                                            <ul class="pagination pagination-sm justify-content-end" id="paginationProducto">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#">Prev</a>
                                                                </li>
                                                                <li class="page-item active">
                                                                    <a class="page-link" href="#">1</a>
                                                                </li>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#">2</a>
                                                                </li>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#">3</a>
                                                                </li>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#">4</a>
                                                                </li>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#">Next</a>
                                                                </li>
                                                            </ul>
                                                        </nav>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>

                                        <hr>

                                        <!--                                        <form action="action" id="FrmProducto">
                                                                                    <div class="form-group">
                                                                                        <input type="text" class="form-control" id="txtNombreProducto" name="txtNombreProducto">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label for="vat">VAT</label>
                                                                                        <input class="form-control" id="vat" type="text" placeholder="PL1234567890">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label for="street">Street</label>
                                                                                        <input class="form-control" id="street" type="text" placeholder="Enter street name">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label for="country">Country</label>
                                                                                        <input class="form-control" id="country" type="text" placeholder="Country name">
                                                                                    </div>
                                                                                </form>-->

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

    </body>
</html>
