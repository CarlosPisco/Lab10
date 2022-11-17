package Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "misDatos" : request.getParameter("accion");
        RequestDispatcher view;
        switch (accion) {
            case "misDatos":
                view = request.getRequestDispatcher("/Usuario/MisDatos.jsp");
                view.forward(request, response);
                break;
            case "listarContratos":
                view = request.getRequestDispatcher("/Usuario/MisContratos.jsp");
                view.forward(request, response);
                break;
            case "contratosEstado":
                view = request.getRequestDispatcher("/Usuario/Estado.jsp");
                view.forward(request, response);
                break;
            case "contratosLoss":
                view = request.getRequestDispatcher("/Usuario/ExpectedLoss.jsp");
                view.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
