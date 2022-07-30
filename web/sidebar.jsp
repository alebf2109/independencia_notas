<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-text mx-3">Aula Virtual</div>
    </a>

    <!-- Divider -->
    <!--<hr class="sidebar-divider my-0">-->

    <!-- Nav Item - Dashboard -->
    <!--<li class="nav-item">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>-->

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Administración
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <!-- Nav Item - Estudiantes -->
        <li class="nav-item <%= request.getAttribute("route").toString().equals("estudiantes") ? "active" : "" %>">
            <a class="nav-link" href="estudiantes">
                <i class="fas fa-fw fa-user"></i>
                <span>Estudiantes</span>
            </a>
        </li>
        
        <!-- Nav Item - Estudiantes -->
        <li class="nav-item <%= request.getAttribute("route").toString().equals("notas") ? "active" : "" %>">
            <a class="nav-link" href="notas">
                <i class="fas fa-fw fa-table"></i>
                <span>Registro de Notas</span>
            </a>
        </li>
    </li>
    
    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Reportes
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item <%= request.getAttribute("route").toString().equals("boletas") ? "active" : "" %>">
        <a class="nav-link" href="boletas">
            <i class="fas fa-fw fa-table"></i>
            <span>Boletas</span>
        </a>
    </li>
    
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->
