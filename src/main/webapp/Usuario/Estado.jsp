<%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 11/16/22
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Estado</title>
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
    <div class = "container-fluid">
      <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value="Estado"/>
      </jsp:include>
    </div>
    <div class="container-fluid gradient-custom" style="min-height: 60vh; align-content: center;">
    </div>
  </body>
</html>
