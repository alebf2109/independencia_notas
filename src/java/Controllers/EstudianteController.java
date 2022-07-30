/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Model.Estudiante;
import Model.Grado;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EstudianteController extends HttpServlet {

  
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throaws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("route", "estudiantes");
        
        String operation = request.getParameter("operation");
        String paramId = request.getParameter("id");
        
        String url = "/404.jsp"; // starts default not found url

        Boolean redirect =false; 
        request.removeAttribute("status");

        //handling the rerouting based on operation 
        if (operation == null){
            List<Estudiante> estudiantes = Estudiante.getAll(); // all of the employees
            request.setAttribute("estudiantes", estudiantes);  // setting the attribute
            url = "/estudiantes.jsp";                         // url to redirect to
        }
        else {
            Estudiante estudiante = new Estudiante();
            if (paramId != null && paramId.matches("\\d+")){ //if operation is only digits??
                int id = Integer.parseInt(paramId);
                estudiante = Estudiante.getById(id);
                if (estudiante != null){                                                  // else, set route to candidate view
                    request.setAttribute("estudiante", estudiante);   // and init the req parameter
                }
            }
            if (operation.equals("create") || operation.equals("show") || operation.equals("edit")) {
                List<Grado> grados = Grado.getAll(); // all of the grados
                request.setAttribute("grados", grados);
            }
            Boolean status = false;
            switch (operation) {
                case "create":                    
                    url = "/form_estudiante.jsp";
                    break;
                case "show":
                    url = "/form_estudiante.jsp";
                    break;
                case "edit":
                    url = "/form_estudiante.jsp";
                    break;
                case "desactivate":
                    status = UpdateActiveEstudiante(estudiante, false);
                    request.getSession().setAttribute("status", status);
                    response.sendRedirect("estudiantes");
                    redirect = true;
                    break;
                case "activate":
                    status = UpdateActiveEstudiante(estudiante, true);
                    request.getSession().setAttribute("status", status);
                    response.sendRedirect("estudiantes");
                    redirect = true;
                    break;
            }
        }

        if (!redirect)
        {
        // redirect after analyzing options above
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        
    }
        

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         //figure out if trying to modify or create
         
        request.setAttribute("route", "estudiantes");

        Estudiante estudiante = createEstudiante(request); 
        estudiante.save();

        String url = "/estudiantes.jsp";
        response.sendRedirect("estudiantes");
//        RequestDispatcher dispatcher = context.getRequestDispatcher(url);
//        
//        dispatcher.forward(request, response); 
    }
    
    
    /**
     * Creates or updates new estudiante object and adds it to database.
     * @param creating if creating or not
     * @param df dateformat
     * @return Employee created.
     */
    private Estudiante createEstudiante(HttpServletRequest request)
    {        
        String id = request.getParameter("id"); 
        
        // get parameters from the request
        String nombre = request.getParameter("nombre");
        String dni = request.getParameter("dni");
        String apellidoPaterno = request.getParameter("apellidoPaterno");
        String apellidoMaterno = request.getParameter("apellidoMaterno");
        String correo = request.getParameter("correo");
        int grado = Integer.parseInt(request.getParameter("grado"));
        
        
        Estudiante estudiante = null;
        if (id.isEmpty())
        {
            estudiante = new Estudiante(0, dni, nombre, apellidoPaterno, apellidoMaterno, correo, grado, "", true);     
        }
        else 
        {
            int idEstudiante = Integer.parseInt(id);
            estudiante = new Estudiante(idEstudiante, dni, nombre, apellidoPaterno, apellidoMaterno, correo, grado, "", true);
        }
        
        return estudiante; 
        
    }

    
    /**
     * Deletes Employee, previousJobs and certificates from database.
     */
    private Boolean UpdateActiveEstudiante(Estudiante estudiante, Boolean active){
        return Estudiante.changeActiveById(estudiante.getEstudiante_id(), active);
    }

}
