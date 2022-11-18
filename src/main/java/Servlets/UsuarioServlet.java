package Servlets;

import Beans.Clientes;

import Beans.Contratos;
import Beans.Credentials;
import DTOs.CantidadContratos;
import DTOs.ExpectedLoss;
import Daos.ContratosDao;
import Daos.ContratosDao;
import Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("credentials")==null){
            response.sendRedirect(request.getContextPath() + "/");
        }else{
            Credentials credentials = (Credentials) session.getAttribute("credentials");
            if (credentials.getTipoUsuario()==2){ //compara mayu y minu
                String accion = request.getParameter("accion") == null ? "misDatos" : request.getParameter("accion");
                UsuarioDao uDao = new UsuarioDao();
                ContratosDao cDao = new ContratosDao();
                RequestDispatcher view;
                switch (accion) {
                    case "misDatos":
                        Clientes cliente = uDao.buscarCliente(credentials.getNumeroDocumento());
                        request.setAttribute("cliente", cliente);
                        view = request.getRequestDispatcher("/Usuario/MisDatos.jsp");
                        view.forward(request, response);
                        break;
                    case "listarContratos":
                        ArrayList<Contratos> listaContratos = cDao.listarContratos(credentials.getNumeroDocumento());
                        request.setAttribute("listaContratos", listaContratos);
                        view = request.getRequestDispatcher("/Usuario/MisContratos.jsp");
                        view.forward(request, response);
                        break;
                    case "contratosEstado":

                        ArrayList<CantidadContratos> listaContratosNumeroEstado = cDao.mostarCantidadContratos(((Credentials) session.getAttribute("credentials")).getNumeroDocumento());
                        request.setAttribute("cantContratosEstado",listaContratosNumeroEstado);
                        view = request.getRequestDispatcher("/Usuario/Estado.jsp");
                        view.forward(request, response);

                        break;
                    case "contratosLoss":

                        ArrayList<ExpectedLoss> listaExpectedLoss = cDao.mostrarMaxExpectedLoss(((Credentials) session.getAttribute("credentials")).getNumeroDocumento());
                        request.setAttribute("listaExpectedLoss",listaExpectedLoss);
                        view = request.getRequestDispatcher("/Usuario/ExpectedLoss.jsp");
                        view.forward(request, response);
                        break;
                }
            } else if (credentials.getTipoUsuario()==1){
                response.sendRedirect(request.getContextPath() + "/AdminServlet");
                }
            }

        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
