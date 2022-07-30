<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
	<!--<link rel="stylesheet" type="text/css" href="css/login.css">-->
	
	<title>Aula Virtual</title>
</head>

<body class="bg-gradient-primary">
    
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-12 col-lg-12 col-md-12 my-5">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-8 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-4">
                                <div class="px-4 py-5 bg-gray-100">
                                    <div class="text-center mb-5">
                                        <h1 class="h1 text-gray-900 mb-2">IEP Independencia</h1>
                                        <h1 class="h5 text-gray-900">¡Bienvenidos de Nuevo!</h1>
                                        <!--<img src="img/logo-independencia.png" class="img-fluid" alt="...">-->
                                    </div>
                                    <form method="post" action="LoginController">
                                        <input type="hidden" name="operation" value="login"/>
                                        <div class="form-group">
                                            <label class="control-label">DNI</label>
                                            <input type="text" name="user" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="usuario"
                                                placeholder="Ingrese su DNI" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Contraseña</label>
                                            <input type="password" name="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Contraseña">
                                        </div>
                                        <% if (request.getParameter("error") != null) { %>
                                            <p class="text-danger text-center">¡DNI o contraseña incorrectos!</p>
                                        <% } %>
                                        <input type="submit" class="btn btn-primary btn-user btn-block mt-4" value="Login">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
