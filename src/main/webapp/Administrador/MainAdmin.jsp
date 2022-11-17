<%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 11/16/22
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel='stylesheet' href="../Background.css">
        <title>Crear Usuario</title>
    </head>
    <body class="gradient-custom">
        <div class='container'>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Crear Cliente</h1>
                    <form method="POST" action="">
                        <div class="form-group">
                            <label>Numero de Documento</label>
                            <select name="" class="form-control " required>

                            </select>
                        </div>
                        <div class="form-group">
                            <label>Contrasenia</label>
                            <input class="form-control" name="" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                        <a href="" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
        </body>
</html>
