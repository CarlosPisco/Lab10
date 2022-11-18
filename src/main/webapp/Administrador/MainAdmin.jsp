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
        <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        />
        <link rel="stylesheet" href="../mdb.min.css" />
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
                    <div class="pb-5 pt-4 titlecolor">
                        <div class="col-lg-6">
                            <h1 class='text-dark' style="color: white !important;font-weight: bold ">Mis Datos</h1>
                        </div>
                    </div>
                    <form method="post" action="<%=request.getContextPath()%>/AdminServlet?accion=guardar">
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label style="color: white !important;font-weight: bold ">Numero de Documento</label>
                            <select name="clienteDoc" class="form-control " required>
                                <% for (Clientes cliente : clientesDisponibles) { %>
                                <option value="<%=cliente.getNumeroDocumento()%>"><%=cliente.getNombreCliente() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group" style="margin-bottom: 5px;">
                            <label style="color: white !important;font-weight: bold ">Contraseña</label>
                            <input class="form-control" name="clienteCon" required>
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-bottom: 5px;">Guardar</button>
                        <a type="button" class="btn btn-success" style="margin-bottom: 5px;"
                           href="<%=request.getContextPath()%>/Login?accion=logout">Cerrar sesión
                        </a>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
        </body>
</html>
