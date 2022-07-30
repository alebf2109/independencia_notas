<%
if (request.getSession().getAttribute("loggedIn") == null) {
	response.sendRedirect("login.jsp");
}
%>
<header class="bg-light pt-0">
    <nav>
        <div class="wrapper row d-flex">
            <!--<h1>Human Capital System</h1>-->
            <ul class="nav">
                <li class="nav-item"><img src="img/logo-independencia-50.png" class="rounded" alt="..." style="width: 40px;"></li>
                <li class="nav-item d-flex align-items-end"><a class="nav-link" href="estudiantes">Estudiantes</a></li>
                <li class="nav-item d-flex align-items-end"><a class="nav-link" href="notas">Notas</a></li>
                <li class="nav-item d-flex align-items-end"><a class="nav-link" href="boletas">Boletas de Notas</a></li>
                <li class="nav-item right d-flex align-items-end"><a class="nav-link" href="LoginController?operation=logout">Cerrar Sesión</a></li>
            </ul>
        </div>
    </nav>
</header>