package com.emergentes.controlador;

import com.emergentes.modelos.Calificacion;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author l-alfredo
 */
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        Calificacion objcal = new Calificacion();

        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");

        switch (op) {
            case "nuevo":
                request.setAttribute("miobjcal", objcal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                objcal = lista.get(pos);
                request.setAttribute("miobjcal", objcal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                if (pos >= 0) {
                    lista.remove(pos);
                }
                request.setAttribute("listacal", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        Calificacion objcal = new Calificacion();
        objcal.setId(id);
        objcal.setNombre(request.getParameter("nombre"));
        objcal.setPrimerParcial(Double.parseDouble(request.getParameter("primerParcial")));
        objcal.setSegundoParcial(Double.parseDouble(request.getParameter("segundoParcial")));
        objcal.setExamenFinal(Double.parseDouble(request.getParameter("examenFinal")));
        objcal.setNota(objcal.getPrimerParcial()+objcal.getSegundoParcial()+objcal.getExamenFinal());
        if (id == 0) {
            int idnuevo = obtenerId(request);
            objcal.setId(idnuevo);
            lista.add(objcal);
        } else {
            int pos = buscarPorIndice(request, id);
            lista.set(pos, objcal);
        }
        request.setAttribute("listacal", lista);
        response.sendRedirect("index.jsp");
    }

    public int buscarPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");

        int pos = -1;
        if (lista != null) {
            for (Calificacion ele : lista) {
                ++pos;
                if (ele.getId() == id) {

                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        int idn = 0;
        for (Calificacion ele : lista) {
            idn = ele.getId();
        }
        return idn + 1;
    }
}
