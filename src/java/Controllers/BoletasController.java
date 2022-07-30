/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Model.Bimestre;
import Model.CursoGrado;
import Model.Nota;
import Model.Estudiante;
import Model.Grado;
import Model.NotaBimestre;
import Model.NotaEstudiante;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoletasController extends HttpServlet {

  
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
        
        request.setAttribute("route", "boletas");
        
        String operation = request.getParameter("operation");
        String paramId = request.getParameter("id");
        
        String url = "/404.jsp"; // starts default not found url

        Boolean redirect =false; 
        request.removeAttribute("status");

        //handling the rerouting based on operation 
        if (operation == null){
            List<Grado> grados = Grado.getAll(); // all of the grados
            request.setAttribute("grados", grados);            
            int grado = Integer.parseInt(request.getParameter("grado") == null ? "1" : request.getParameter("grado"));
            
            List<CursoGrado> cursos_grados = CursoGrado.getAllByGrado(grado);
            request.setAttribute("cursos_grados", cursos_grados);
            int curso = Integer.parseInt(request.getParameter("curso") == null ? "1" : request.getParameter("curso"));
            
            List<Bimestre> bimestres = Bimestre.getAll(); // all of the bimestres
            request.setAttribute("bimestres", bimestres);
            int bimestre = Integer.parseInt(request.getParameter("bimestre") == null ? "1" : request.getParameter("bimestre"));
            
            List<Estudiante> estudiantes = Estudiante.getAllByGrado(grado); // all of the employees
            request.setAttribute("estudiantes", estudiantes);  // setting the attribute
            int estudiante = Integer.parseInt(request.getParameter("estudiante") == null ? "1" : request.getParameter("estudiante"));
            
            List<Nota> notas = Nota.getAllByEstudiante(grado, estudiante); // all of the employees
            List<NotaBimestre> notasByEstudiante = new ArrayList<>();
            for(int i=0; i<cursos_grados.size(); i++) {
                int notasBimestreAux[] = {0, 0, 0, 0};
                for(int l=1; l<=4; l++) {
                    int notasAux[] = {0, 0, 0, 0, 0, 0, 0};
                    for(int j=1; j<=7; j++) {
                        for(int k=0; k<notas.size(); k++) {
                            if (cursos_grados.get(i).getCurso_IdCurso() == notas.get(k).getIdCurso() 
                                    && notas.get(k).getIdBimestre() == l
                                    && notas.get(k).getPosNota() == j) {
                                notasAux[j - 1] = notas.get(k).getNumNota();
                            }
                        }
                    }
                    int sum = 0;
                    for (int m = 0; m < notasAux.length; m++) {
                        sum += notasAux[m];
                    }
                    notasBimestreAux[l - 1] = sum/4;
                }
                NotaBimestre notaBimestre = new NotaBimestre(cursos_grados.get(i).getCurso_IdCurso(), cursos_grados.get(i).getNombreCurso(),
                notasBimestreAux[0], notasBimestreAux[1], notasBimestreAux[2], notasBimestreAux[3]);
                notasByEstudiante.add(notaBimestre);
            }
            
            int sumaNotasBimestre[] = {0,0,0,0};
            for (int i=0;i<4; i++) {
                for (int j=0; j<cursos_grados.size(); j++) {
                    for (int k=0; k<notasByEstudiante.size(); k++) {
                        if (notasByEstudiante.get(k).getCurso_id() == cursos_grados.get(j).getCurso_IdCurso()) {
                            switch(i) {
                                case 1:
                                    sumaNotasBimestre[0] += notasByEstudiante.get(k).getN1();
                                    break;
                                case 2:
                                    sumaNotasBimestre[1] += notasByEstudiante.get(k).getN2();
                                    break;
                                case 3:
                                    sumaNotasBimestre[2] += notasByEstudiante.get(k).getN3();
                                    break;
                                case 4:
                                    sumaNotasBimestre[3] += notasByEstudiante.get(k).getN4();
                                    break;
                            }
                        }
                    }  
                }
            }
            NotaBimestre notaBimestre = new NotaBimestre(100000000, "PROMEDIO",
                    sumaNotasBimestre[0]/cursos_grados.size(), sumaNotasBimestre[1]/cursos_grados.size(),
                    sumaNotasBimestre[2]/cursos_grados.size(), sumaNotasBimestre[3]/cursos_grados.size());
            notasByEstudiante.add(notaBimestre);
            request.setAttribute("notas", notasByEstudiante);  // setting the attribute
            
            url = "/boletas.jsp";                         // url to redirect to
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
         
        Nota nota = createNota(request);
        boolean status = nota.save();
        
        System.out.println("status: " + status);
        response.sendRedirect("notas");
        
        /*Estudiante estudiante = createEstudiante(request); 
        estudiante.save();

        String url = "/estudiantes.jsp";
        response.sendRedirect("estudiantes");*/
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
    private Nota createNota(HttpServletRequest request)
    {
        int idGrado = Integer.parseInt(request.getParameter("gradoModal") != null ? request.getParameter("gradoModal") : "-1");
        int idCurso = Integer.parseInt(request.getParameter("cursoModal") != null ? request.getParameter("cursoModal") : "-1");
        int idBimestre = Integer.parseInt(request.getParameter("bimestreModal") != null ? request.getParameter("bimestreModal") : "-1");
        int idEstudiante = Integer.parseInt(request.getParameter("idestudiante") != null ? request.getParameter("idestudiante") : "-1");
        int posNota = Integer.parseInt(request.getParameter("posnota") != null ? request.getParameter("posnota") : "-1");
        int numNota = Integer.parseInt(request.getParameter("nota") != null ? request.getParameter("nota") : "0");        
        
        Nota nota = new Nota(-1, posNota, numNota, idBimestre, idEstudiante, idCurso, idGrado);
        
        return nota;         
    }

    
    /**
     * Deletes Employee, previousJobs and certificates from database.
     */
    private Boolean UpdateActiveEstudiante(Estudiante estudiante, Boolean active){
        return Estudiante.changeActiveById(estudiante.getEstudiante_id(), active);
    }
  
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
