package Servlets;

import Beans.Clientes;
import Beans.Credentials;
import Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("credentials")==null){
            response.sendRedirect(request.getContextPath() + "/");
        }else{
            Credentials credentials = (Credentials) session.getAttribute("credentials");
            if (credentials.getTipoUsuario()==2){ //compara mayu y minu
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
            } else if (credentials.getTipoUsuario()==1){
                String accion = request.getParameter("accion") == null ? "principal" : request.getParameter("accion");
                RequestDispatcher view;
                UsuarioDao uDao = new UsuarioDao();
                switch (accion) {
                    case "principal":
                        ArrayList<Clientes> clientesDisponibles = uDao.listarClientes();
                        request.setAttribute("clientesDisponibles", clientesDisponibles);
                        view = request.getRequestDispatcher("/Administrador/MainAdmin.jsp");
                        view.forward(request, response);
                    default:
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                        break;
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion") == null ? "guardar" : request.getParameter("accion");
        UsuarioDao uDao = new UsuarioDao();
        switch (accion){
            case "guardar":
                String numeroDocumento = request.getParameter("clienteDoc");
                String password = request.getParameter("clienteCon");
                uDao.createCredentialCliente(numeroDocumento,password);
                response.sendRedirect("/AdminServlet");
                break;
        }
    }
}
