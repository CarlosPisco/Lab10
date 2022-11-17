<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="navbarCollapse" >
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link <%=request.getParameter("page").equals("Mis Datos")? "active": "" %>" href="<%=request.getContextPath()%>/UsuarioServlet?accion=misDatos" style="font-size: 17px">Mis Datos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%=request.getParameter("page").equals("Mis Contratos")? "active": "" %>" href="<%=request.getContextPath()%>/UsuarioServlet?accion=listarContratos" style="font-size: 17px">Mis Contratos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%=request.getParameter("page").equals("Estado")? "active": "" %>" href="<%=request.getContextPath()%>/UsuarioServlet?accion=contratosEstado" style="font-size: 17px">Estado</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%=request.getParameter("page").equals("Expected Loss")? "active": "" %>" href="<%=request.getContextPath()%>/UsuarioServlet?accion=contratosLoss" style="font-size: 17px">Expected Loss</a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right me-auto mb-2 mb-md-0"><li>
        <a type="button" class="btn btn-success"
           href="<%=request.getContextPath()%>/Login?accion=logout">Cerrar sesión
        </a>
      </li></ul>
    </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>





