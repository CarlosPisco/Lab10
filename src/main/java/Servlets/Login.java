package Servlets;

import Beans.Credentials;
import Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Login", value = "/")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion") == null ? "login" : request.getParameter("accion");
        RequestDispatcher view;
        switch (accion) {
            case "login":
                session = request.getSession();
                if (session.getAttribute("credentials") == null) {
                    view = request.getRequestDispatcher("/Login.jsp");
                    view.forward(request, response);
                } else {
                    Credentials credentials = (Credentials) session.getAttribute("credentials");
                    if (credentials.getTipoUsuario()==2){ //compara mayu y minu
                        response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                    } else if (credentials.getTipoUsuario()==1){
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                    }
                }
                break;
            case ("logout"):
                session.removeAttribute("credentials");
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/Login");
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("usuario");
        String password = request.getParameter("contrasenia");

        System.out.println(username);
        System.out.println(password);


        UsuarioDao uDao = new UsuarioDao();
        Credentials credentials = uDao.buscarUsuario(username,password); //recibo usuario y password

        if (credentials!=null){
            session.setAttribute("credentials",credentials);
            session.setMaxInactiveInterval(10*60);//10 minutos de inactividad
            //ingresa

            if (credentials.getTipoUsuario()==2){ //compara mayu y minu
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
            } else if (credentials.getTipoUsuario()==1){
                response.sendRedirect(request.getContextPath() + "/AdminServlet");
            }
        } else {
            //rechaza
            session.setAttribute("msg", "Usuario o contraseña incorrectos");
            RequestDispatcher view = request.getRequestDispatcher("/Login.jsp");
            view.forward(request, response);
        }
    }
}
