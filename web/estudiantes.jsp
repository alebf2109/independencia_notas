<%@page import="java.util.List"%>
<%@page import="Model.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
                            <div class="card-header py-3 d-flex">
                                <h3 class="m-0 mt-1 font-weight-bold text-primary">Estudiantes</h3>
                                
                                <div class="ml-auto"><a class="btn btn-primary" id="new" href="estudiantes?operation=create">Nuevo</a></div>
                            </div>
             
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>DNI</th>
                                                <th>Nombre</th>
                                                <th>Correo</th>
                                                <th>Grado</th>
                                                <th class="text-center">Activo</th>
                                                <th class="text-center">Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  List<Estudiante> estudiantes = (List<Estudiante>)request.getAttribute("estudiantes");
                                                int size = (estudiantes != null) ? estudiantes.size() : 0;
                                                for (int i=0; i<size; i++) { %>
                                                    <tr>
                                                        <td><%= estudiantes.get(i).getDni() %></td>
                                                        <td><%= estudiantes.get(i).getFullName() %></td>
                                                        <td><%= estudiantes.get(i).getCorreo() %></td>
                                                        <td><%= estudiantes.get(i).getGrado() %></td>
                                                        <td class="text-center <%= estudiantes.get(i).getActivo() ? "text-success" : "text-danger" %>">
                                                            <%= estudiantes.get(i).getActivo() ? "✓" : "X" %>
                                                        </td>
                                                        <td class="text-center">
                                                            <a class="btn btn-warning btn-sm" href=<%= "estudiantes?operation=edit&id="+estudiantes.get(i).getEstudiante_id() %> 
                                                               data-toggle="tooltip" data-placement="top" title="Editar">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <a class="btn <%= estudiantes.get(i).getActivo() ? "btn-danger" : "btn-success" %> btn-sm" 
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= estudiantes.get(i).getEstudiante_id() %>, <%= estudiantes.get(i).getActivo() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="<%= estudiantes.get(i).getActivo() ? "Dar de Baja" : "Activar" %>"
                                                            >
                                                                <i class="fas <%= estudiantes.get(i).getActivo() ? "fa-trash" : "fa-check" %>"></i>

                                                            </a>
                                                            <a class="btn btn-info btn-sm" href=<%= "estudiantes?operation=show&id="+estudiantes.get(i).getEstudiante_id() %>
                                                               data-toggle="tooltip" data-placement="top" title="Ver">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                            <%  } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
        
        <!-- Confirm Modal-->
        <div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="titleModal"></h5>
                        <input type="hidden" name="hiddenIdSelected" id="hiddenIdSelected" value="" >
                        <input type="hidden" name="hiddenActivo" id="hiddenActivo" value="" >
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body" id="messageModal"></div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <a class="btn btn-primary" onclick="cambiarEstado();">Aceptar</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!--<div class="modal fade show" id="confirm" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: block;" aria-modal="true" role="dialog">
        </div>
        
        
        <div class="modal fade" id="confirm" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
        </div>-->
        
        
        
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        
        <%
            String status = request.getSession().getAttribute("status") != null ? request.getSession().getAttribute("status").toString() : "";
            request.getSession().removeAttribute("status");
        %>
        
        <span><%= status %></span>
        
        <script type="text/javascript">
            var status = "<%= status %>";
            if (status === "true") {
                Swal.fire({
                    title: 'Operación Correcta',
                    icon: 'success',
                    confirmButtonColor: '#4e73df',
                });
            } else if (status === "false") {
                Swal.fire({
                    title: 'Operación Incorrecta',
                    icon: 'error',
                    confirmButtonColor: '#4e73df',
                });
            }
            
            function mostrarModal(id, activo){
                if (activo) {
                    document.getElementById("titleModal").innerText = "Desactivar estudiante";
                    document.getElementById("messageModal").innerText = "¿Está seguro de desactivar el estudiante?";
                } else {
                    document.getElementById("titleModal").innerText = "Activar estudiante";
                    document.getElementById("messageModal").innerText = "¿Está seguro de activar el estudiante?";
                }
                document.getElementById("hiddenIdSelected").value = id;
                document.getElementById("hiddenActivo").value = activo;
            }
            
            function cambiarEstado(){
                var id = document.getElementById("hiddenIdSelected").value;
                var activo = document.getElementById("hiddenActivo").value;
                location.href = location.href + '?operation=' + (activo == 'true' ? 'desactivate' : 'activate') + '&id=' + id;
            }
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