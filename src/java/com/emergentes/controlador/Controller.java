package com.emergentes.controlador;

import com.emergentes.modelo.GestorDatos;
import com.emergentes.modelo.Dato;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Nek0
 */
@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        Dato objDato = new Dato();
        int id;
        int pos;
        String op = request.getParameter("op");
        if(op.equals("nuevo"))
        {
            HttpSession ses = request.getSession();
            GestorDatos agenda = (GestorDatos) ses.getAttribute("agenda");
            objDato.setId(agenda.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("miDato", objDato);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if(op.equals("modificar"))
        {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorDatos agenda = (GestorDatos) ses.getAttribute("agenda");
            pos = agenda.ubicarDato(id);
            objDato = agenda.getLista().get(pos);
            request.setAttribute("op", op);
            request.setAttribute("miDato", objDato);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if(op.equals("eliminar"))
        {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorDatos agenda = (GestorDatos) ses.getAttribute("agenda");
            pos = agenda.ubicarDato(id);
            agenda.eliminarDato(pos);
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        Dato objDato = new Dato();
        int pos;
        String op = request.getParameter("op");
        if(op.equals("grabar"))
        {
            objDato.setId(Integer.parseInt(request.getParameter("id")));
            objDato.setNombre(request.getParameter("nombre"));
            objDato.setPeso(request.getParameter("peso"));
            objDato.setTalla(request.getParameter("talla"));            
            objDato.setVacuna(request.getParameter("vacuna"));
            HttpSession ses = request.getSession();
            GestorDatos agenda = (GestorDatos) ses.getAttribute("agenda");
            String opg = request.getParameter("opg");
            if(opg.equals("nuevo"))
            {
                agenda.insertarDato(objDato);
            }
            else
            {
                pos = agenda.ubicarDato(objDato.getId());
                agenda.modificarDato(pos, objDato);
            }
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }   
    }
}
