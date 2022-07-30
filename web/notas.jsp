<%@page import="Model.NotaEstudiante"%>
<%@page import="Model.Nota"%>
<%@page import="Model.CursoGrado"%>
<%@page import="Model.Bimestre"%>
<%@page import="Model.Grado"%>
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

        <title>Notas</title>

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
                                <h3 class="m-0 mt-1 font-weight-bold text-primary">Notas</h3>
                                
                                <div class="ml-auto mr-3">
                                    <div class="form-group row mb-0">
                                        <form action="notas" method="GET" class="d-flex">
                                            <div class="col-sm-4 mb-sm-0 d-flex">
                                                <!--<input type="hidden" name="gradoSelected" id="gradoSelected" value="">-->
                                                <select class="custom-select form-control" name="grado" id="grado" required>
                                                <%	List<Grado> grados = (List<Grado>)request.getAttribute("grados");
                                                            int size = (grados != null) ? grados.size() : 0;
                                                            for (int i=0; i<size; i++) { %>
                                                            <option value="<%=  grados.get(i).getIdGrado() %>"><%= grados.get(i).getNumGrado() %></option>
                                                <% } %>
                                                </select>
                                                <button type="submit" class="btn btn-light btn-icon-split ml-1">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-arrow-right"></i>
                                                    </span>
                                                </button>
                                            </div>
                                            <div class="col-sm-4 mb-sm-0">
                                                <select class="custom-select form-control" name="curso" id="curso" required>
                                                <%	List<CursoGrado> cursosGrado = (List<CursoGrado>)request.getAttribute("cursos_grados");
                                                            size = (cursosGrado != null) ? cursosGrado.size() : 0;
                                                            for (int i=0; i<size; i++) { %>
                                                            <option value="<%=  cursosGrado.get(i).getCurso_IdCurso() %>"><%= cursosGrado.get(i).getNombreCurso() %></option>
                                                <% } %>
                                                </select>
                                            </div>
                                            <div class="col-sm-3 mb-sm-0">
                                                <select class="custom-select form-control" name="bimestre" id="bimestre" required>
                                                <%	List<Bimestre> bimestres = (List<Bimestre>)request.getAttribute("bimestres");
                                                            size = (bimestres != null) ? bimestres.size() : 0;
                                                            for (int i=0; i<size; i++) { %>
                                                            <option value="<%=  bimestres.get(i).getIdBimestre() %>"><%= bimestres.get(i).getNombreBimestre() %></option>
                                                <% } %>
                                                </select>
                                            </div>
                                            <div class="col-sm-1 mb-sm-0">
                                                <button type="submit" class="btn btn-primary btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-sync"></i>
                                                    </span>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                        
                                <!--<div class="ml-auto">
                                    <a type="button" href="estudiantes" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-edit"></i>
                                        </span>
                                        <span class="text">Nota</span>
                                    </a>
                                </div>-->
                            </div>
             
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>DNI</th>
                                                <th>Nombre</th>
                                                <th>N1</th>
                                                <th>N2</th>
                                                <th>N3</th>
                                                <th>N4</th>
                                                <th>N5</th>
                                                <th>N6</th>
                                                <th>N7</th>
                                                <th>Promedio</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  List<NotaEstudiante> notasEstudiante = (List<NotaEstudiante>)request.getAttribute("notas");
                                                size = (notasEstudiante != null) ? notasEstudiante.size() : 0;
                                                for (int i=0; i<size; i++) { %>
                                                    <tr>
                                                        <td><%= notasEstudiante.get(i).getDni() %></td>
                                                        <td><%= notasEstudiante.get(i).getNombreCompleto() %></td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN1() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 1, <%= notasEstudiante.get(i).getN1() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN2() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 2, <%= notasEstudiante.get(i).getN2() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN3() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 3, <%= notasEstudiante.get(i).getN3() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN4() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 4, <%= notasEstudiante.get(i).getN4() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN5() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 5, <%= notasEstudiante.get(i).getN5() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN6() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 6, <%= notasEstudiante.get(i).getN6() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td class="text-right">
                                                            <%= notasEstudiante.get(i).getN7() %>
                                                            <a  class="btn-sm btn-light btn-icon-split p-0 ml-2"
                                                                data-toggle="modal" data-target="#confirm"
                                                                onclick="mostrarModal(<%= notasEstudiante.get(i).getEstudiante_id() %>, '<%= notasEstudiante.get(i).getNombreCompleto() %>', 7, <%= notasEstudiante.get(i).getN7() %>);"
                                                                data-toggle="tooltip" data-placement="top" title="Editar Nota"
                                                            >
                                                                <span class="icon text-white-50 p-0 px-1">
                                                                    <i class="fas fa-edit"></i>
                                                                </span>
                                                            </a>
                                                        </td>
                                                        <td><%= notasEstudiante.get(i).getPromedio() %></td>
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
                        <h5 class="modal-title">
                            Nota
                        </h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <form action="notas" id="guardarnota" method="post">
                        <div class="modal-body">
                            <div class="form-group row">
                                <input type="hidden" name="gradoModal" id="gradoModal" value="" >
                                <input type="hidden" name="cursoModal" id="cursoModal" value="" >
                                <input type="hidden" name="bimestreModal" id="bimestreModal" value="" >
                                <input type="hidden" name="idestudiante" id="idestudiante" value="" >
                                <input type="hidden" name="posnota" id="posnota" value="" >
                                <div class="col-sm-12 mb-3 mb-sm-0 mt-2">
                                    <input type="text" name="estudiante" id="estudiante" value="" class="form-control form-control-user" disabled>
                                </div>
                                <div class="col-sm-12 mb-3 mb-sm-0 mt-3">
                                    <label class="control-label" id="labelNota"></label>
                                    <input type="text" name="nota" id="nota" class="form-control form-control-user">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Cancelar</button>
                            <button type ="submit" class="btn btn-primary btn-icon-split btn-sm">
                                <span class="icon text-white-50">
                                    <i class="fas fa-save"></i>
                                </span>
                                <span class="text">Guardar</span>
                            </button>
                        </div>
                    </form>
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
        
        <script>
            var status = "<%= status %>";
            var grado = "<%= request.getParameter("grado") == null ? "1" : request.getParameter("grado").toString() %>";
            var curso = "<%= request.getParameter("curso") == null ? "1" : request.getParameter("curso").toString() %>";
            var bimestre = "<%= request.getParameter("bimestre") == null ? "1" : request.getParameter("bimestre").toString() %>";
            console.log(grado, curso, bimestre);
            if (document.getElementById('grado'))       document.getElementById('grado').value = grado;
            if (document.getElementById('curso'))       document.getElementById('curso').value = curso;
            if (document.getElementById('bimestre'))    document.getElementById('bimestre').value = bimestre;
            
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
            
            /*document.getElementById('grado').onchange = function() {
                var index = this.selectedIndex;
                console.log(this.children[index].value, ' value ');
                var inputText = this.children[index].innerHTML.trim();
                document.getElementById("gradoSelected").value = this.children[index].value;
            }*/
            
            $('#guardarnota').submit(function (e, params) { 
                var localParams = params || {};

                if (!localParams.send) {
                    e.preventDefault();
                }
                
                var nota = document.getElementById("nota").value;
                if (nota < 8 || nota > 20) {
                    Swal.fire({
                        title: 'Nota Inválida',
                        text: "Nota fuera del intervalo permitido (8-20)",
                        icon: 'error',
                        confirmButtonColor: '#4e73df',
                    });
                } else {
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
                }
            });
            
            function mostrarModal(idEstudiante, estudiante, posNota, nota){
                console.log(estudiante);
                document.getElementById("gradoModal").value = grado;
                document.getElementById("cursoModal").value = curso;
                document.getElementById("bimestreModal").value = bimestre;
                document.getElementById("idestudiante").value = idEstudiante;
                document.getElementById("estudiante").value = estudiante;
                document.getElementById("posnota").value = posNota;
                document.getElementById("nota").value = nota;
                document.getElementById("labelNota").innerText = "Nota - N" + posNota + ": ";
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