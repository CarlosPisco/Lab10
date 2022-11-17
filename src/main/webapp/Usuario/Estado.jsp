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
<% Credentials credentials = (Credentials) session.getAttribute("credentials");%>
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
    <div class="container-fluid gradient-custom" style="min-height: 60vh; align-content: center;">

      <div class="pt-4 titlecolor">
        <div class="col-lg-6">
          <h1 class='text-dark' class='text-dark' style="color: white !important;font-weight: bold ">Lista de cantidad de contratos por estado del usuario <%=credentials.getNumeroDocumento()%></h1>
        </div>
      </div>


      <div class="tabla " style="background-color: #332d2d"> <!-- #f8f9fa -->
        <table class="table table-dark table-transparent table-hover">
          <thead style="color: white">
          <tr>
            <!--<th>ID Heroe</th>-->
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

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



    </div>
  </body>
</html>
