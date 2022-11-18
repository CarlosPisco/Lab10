<%@ page import="DTOs.CantidadContratos" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Credentials" %><%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 11/16/22
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<CantidadContratos> listaCantidadContratos = (ArrayList<CantidadContratos>) request.getAttribute("cantContratosEstado"); %>
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
    <title>Estado</title>
  </head>
  <body class="gradient-custom">
    <div class = "container-fluid">
      <div class="container">
        <jsp:include page="/includes/navbar.jsp">
          <jsp:param name="page" value="Estado"/>
        </jsp:include>
      </div>>
    </div>
    <div class="container" style="margin-top: 30px;">
      <div class="pb-5 pt-4 titlecolor">
        <div class="col-lg-6">
          <h1 class='text-dark' style="color: white !important;font-weight: bold ">Cantidad de Contratos por Estado</h1>
        </div>
      </div>

      <div class="tabla " style="background-color: #332d2d">
        <table class="table table-dark table-transparent table-hover">
          <thead style="color: white">
          <tr>
            <th>Estado Contrato</th>
            <th>Cantidad</th>
          </tr>
          </thead>

          <tbody style="color: white">
          <% for (CantidadContratos cc : listaCantidadContratos) { %>
          <tr>
            <td><%=cc.getStatus()%></td>
            <td><%=cc.getCantidad()%></td>
          </tr>
          <%}%>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
