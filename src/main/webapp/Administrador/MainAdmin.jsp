<%@ page import="Beans.Clientes" %><%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 11/16/22
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean type="java.util.ArrayList<Beans.Clientes>" scope="request" id="clientesDisponibles"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <title>Crear Usuario</title>
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #6a11cb;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));
            }
        </style>
    </head>
    <body class="gradient-custom">
        <div class='container'>
            <div class="row mb-4">
                <div class="col"></div>
                <div class="col-md-6">
                    <h1 class='mb-3'>Crear Cliente</h1>
                    <form method="post" action="<%=request.getContextPath()%>/AdminServlet?accion=guardar">
                        <div class="form-group">
                            <label>Numero de Documento</label>
                            <select name="clienteDoc" class="form-control " required>
                                <% for (Clientes cliente : clientesDisponibles) { %>
                                <option value="<%=cliente.getNumeroDocumento()%>"><%=cliente.getNombreCliente() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Contrasenia</label>
                            <input class="form-control" name="clienteCon" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                        <a type="button" class="btn btn-success"
                           href="<%=request.getContextPath()%>/Login?accion=logout">Cerrar sesión
                        </a>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
        </body>
</html>
