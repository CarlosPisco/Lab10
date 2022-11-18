<%@ page import="Beans.Clientes" %><%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 11/16/22
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Clientes cliente = (Clientes) request.getAttribute("cliente");%>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        />
        <link rel="stylesheet" href="../mdb.min.css" />
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
      <title>Mis Datos</title>
    </head>
    <body class="gradient-custom">
        <div class="container">
            <jsp:include page="/includes/navbar.jsp">
                <jsp:param name="page" value="Mis Datos"/>
            </jsp:include>
        </div>>
        <div class="container" style="margin-top: 30px;">
            <div class="pb-5 pt-4 titlecolor">
                <div class="col-lg-6">
                    <h1 class='text-dark' style="color: white !important;font-weight: bold ">Mis Datos</h1>
                </div>
            </div>

            <div class="col-md-6" style="margin: 0 auto">
                <div class="ibox" style="align-content: center">
                    <div class="ibox-body">
                        <form>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid1" placeholder="Nombre" value="<%=cliente.getNombreCliente()%>" disabled>
                                        <label for="floatingInputGrid1">Nombre</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid2" placeholder="Edad" value="<%=cliente.getEdad()%>" disabled>
                                        <label for="floatingInputGrid2">Edad</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid3" placeholder="Tipo de Persona" value="<%=cliente.getTipoCliente()%>" disabled>
                                        <label for="floatingInputGrid3">Tipo de Persona</label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 5px;">
                                        <input type="text" class="form-control" id="floatingInputGrid4" placeholder="Numero de Documento" value="<%=cliente.getNumeroDocumento()%>" disabled>
                                        <label for="floatingInputGrid4">Numero de Documento</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>





