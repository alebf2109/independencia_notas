<%@page import="Model.Grado"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Estudiantes</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <script src="js/filter.js" type="text/javascript"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="sidebar.jsp" %>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="topbar.jsp" %>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <!--<h1 class="h3 mb-2 text-gray-800">Estudiantes</h1>-->

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <!--<form action="estudiantes" id="createform" method="post">-->
                            <form action="estudiantes" id="createform" method="post">
                                <%  Estudiante estudiante = (Estudiante)request.getAttribute("estudiante");
                                    String operation = request.getParameter("operation") != null ? request.getParameter("operation").toString() : "";
                                    Boolean isView = operation.equals("show");                                
                                %>
                                <input type="hidden" name="operation" value="<%=  request.getParameter("operation").toString() %>">
                                <%  if(!operation.equals("create")) { %>
                                <input type="hidden" name="id" value="<%= estudiante.getEstudiante_id() %>">
                                <%  } %>
                                <div class="card-header py-3 d-flex">
                                    <h4 class="m-0 font-weight-bold text-primary">
                                        <%= request.getParameter("operation").toString().equals("create") ? "Nuevo" : 
                                            (request.getParameter("operation").toString().equals("edit") ? "Editar" : "Datos de") %> Estudiante
                                    </h4>
                                    <div class="ml-auto">
                                        <a type="button" href="estudiantes" class="btn btn-secondary btn-icon-split btn-sm mr-2">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-arrow-left"></i>
                                            </span>
                                            <span class="text">Regresar</span>
                                        </a>
                                        <%  if(!operation.equals("show")) { %>
                                        <button type ="submit" class="btn btn-primary btn-icon-split btn-sm">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-save"></i>
                                            </span>
                                            <span class="text">Guardar</span>
                                        </button>
                                        <%  } %>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="m-3 mb-4">
                                        <div class="form-group row">
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <label class="control-label">DNI</label>
                                                <input type="text" name="dni" value="${estudiante.getDni()}" class="form-control form-control-user" 
                                                       <%= (isView) ? "disabled" : "" %> required>
                                            </div>
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <label class="control-label">Nombre</label>
                                                <input type="text" name="nombre" value="${estudiante.getNombre()}" class="form-control form-control-user" 
                                                       <%= (isView) ? "disabled" : "" %> required>
                                            </div>
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <label class="control-label">Apellido Paterno</label>
                                                <input type="text" name="apellidoPaterno" value="${estudiante.getApellidoPaterno()}" 
                                                       class="form-control form-control-user" <%= (isView) ? "disabled" : "" %> required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <label class="control-label">Apellido Materno</label>
                                                <input type="text" name="apellidoMaterno" value="${estudiante.getApellidoMaterno()}" 
                                                       class="form-control form-control-user" <%= (isView) ? "disabled" : "" %> required>
                                            </div>
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <label class="control-label">Correo</label>
                                                <input type="text" name="correo" value="${estudiante.getCorreo()}" 
                                                       class="form-control form-control-user" <%= (isView) ? "disabled" : "" %> required>
                                            </div>
                                            <div class="col-sm-4 mb-3 mb-sm-0">
                                                <label class="control-label">Grado </label>
                                                <select class="custom-select form-control" name = "grado" <%= (isView) ? "disabled" : "" %> required>
                                                <%	List<Grado> grados = (List<Grado>)request.getAttribute("grados");
                                                            int size = (grados != null) ? grados.size() : 0;
                                                            for (int i=0; i<size; i++) { %>
                                                            <option value="<%=  grados.get(i).getIdGrado() %>"><%= grados.get(i).getNumGrado() %></option>
                                                <% } %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <%@include file="footer.jsp" %>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        
        <script>
            $('#createform').submit(function (e, params) {
                var localParams = params || {};

                if (!localParams.send) {
                    e.preventDefault();
                }

                       //additional input validations can be done hear

                Swal.fire({
                    title: 'Confirmar Operación',
                    text: "¿Está seguro de guardar los cambios?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor:'#4e73df',
                    cancelButtonColor: '#e74a3b',
                    confirmButtonText: 'Aceptar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $(e.currentTarget).trigger(e.type, { 'send': true });
                    }
                });
            });
            
        </script>
        
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>
    
    
</html>