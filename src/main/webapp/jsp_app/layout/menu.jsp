<%-- 
    Document   : menu
    Created on : 09-jun-2019, 18:49:49
    Author     : Akin Ramirez
--%>
<div class="sidebar">
  <nav class="sidebar-nav">
    <ul class="nav">
      <li class="nav-item">
          <!--<a class="nav-link" href="<%out.print(getServletContext().getContextPath());%>/index.jsp">-->
        <a class="nav-link" href="inicio">
          <i class="nav-icon icon-calculator"></i> Inicio</a>
      </li>
      <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#">
          <i class="nav-icon icon-note"></i> Mantenimientos</a>
        <ul class="nav-dropdown-items">
          <li class="nav-item">
            <a class="nav-link" href="categorias">
              <i class="nav-icon icon-note"></i> Categorias</a>
          </li>             
        </ul>
      </li>
    </ul>
  </nav>
</div>