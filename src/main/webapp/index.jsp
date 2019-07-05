<%-- 
    Document   : index
    Created on : 09-jun-2019, 15:36:21
    Author     : Akin Ramirez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <!-- Header -->
  <jsp:include page="jsp_app/layout/header.jsp"/>

  <!-- Body -->
  <div class="app-body">

    <!-- MENU -->
    <jsp:include page="jsp_app/layout/menu.jsp"/>

    <!-- MAIN -->
    <main class="main">
      <br>
      <div class="container-fluid">
        <div class="animated fadeIn">
          
          <!-- /.row-->
          <div class="row">

            <div class="col-md-4 col-sm-12">
              <div class="card">
                <div class="card-body p-4 d-flex align-items-center">
                  <i class="nav-icon icon-note bg-primary p-3 font-2xl mr-3"><a href="categorias"></i>
                  <div>
                    <div class="text-value-sm text-primary">Categorias</div>
                    <div class="text-muted text-uppercase font-weight-bold small">Mantenimiento</div>
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
<jsp:include page="jsp_app/layout/footer.jsp"/>

</body>
</html>
