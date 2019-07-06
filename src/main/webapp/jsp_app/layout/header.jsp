<%-- 
    Document   : header
    Created on : 09-jun-2019, 19:16:59
    Author     : Akin Ramirez
--%>
<head>
  <base href="./">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <meta name="description" content="Panel de Administracion hecho con Java Web MVC">
  <meta name="author" content="Akin Ramirez">
  <meta name="keyword" content="Panel de Administracion hecho con Java Web MVC">
  <title>Panel Admin Java Web</title>
  <!-- Icons-->
  <link href="<%out.print(getServletContext().getContextPath());%>/assets/vendors/@coreui/icons/css/coreui-icons.min.css" rel="stylesheet">
<!--        <link href="<%out.print(getServletContext().getContextPath());%>/assets/vendors/flag-icon-css/css/flag-icon.min.css" rel="stylesheet">-->
  <link href="<%out.print(getServletContext().getContextPath());%>/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%out.print(getServletContext().getContextPath());%>/assets/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
  <!-- Main styles for this application-->  
  <link href="<%out.print(getServletContext().getContextPath());%>/assets/vendors/pace-progress/css/pace.min.css" rel="stylesheet">
  <link href="<%out.print(getServletContext().getContextPath());%>/css_app/view/estilos.css" rel="stylesheet">
  
  <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/style.css" rel="stylesheet">

  <link href="<%out.print(getServletContext().getContextPath());%>/css_app/view/sweetalert.css" rel="stylesheet">
  
  
    <!-- Global site tag (gtag.js) - Google Analytics-->
  <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
  
  <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
      dataLayer.push(arguments);
    }
    gtag('js', new Date());
    // Shared ID
    gtag('config', 'UA-118965717-3');
    // Bootstrap ID
    gtag('config', 'UA-118965717-5');
  </script>
</head>
<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">

  <!-- Header -->
  <header class="app-header navbar">
    <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <a class="navbar-brand logo" href="inicio">
      <span><b>PA</b></span>
    </a>

    <!-- CERRAR SESSION -->
    <ul class="nav navbar-nav ml-auto">        
      <li class="nav-item dropdown">
        <a class="nav-link" href="inicio" role="button" aria-haspopup="true" aria-expanded="false">
          <span class="dropdown-item" ><i class="fa fa-lock"></i> Cerrar Sesion</a></span>
        </a>
      </li>
    </ul>
  </header>