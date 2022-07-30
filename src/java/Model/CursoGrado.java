/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CursoGrado {
    private int Curso_IdCurso;
    private int Grado_IdGrado;
    private String nombreCurso;
    private String numGrado;

    public CursoGrado(int Curso_IdCurso, int Grado_IdGrado, String nombreCurso, String numGrado) {
        this.Curso_IdCurso = Curso_IdCurso;
        this.Grado_IdGrado = Grado_IdGrado;
        this.nombreCurso = nombreCurso;
        this.numGrado = numGrado;
    }

    /**
     * getAllByGrado
     * 
     * Method to retrieve all the CursoGrado from the database.
     * @param idGrado
     * @return a list of type List<CursoGrado>, empty list if there are none in DB.
     */
    public static List<CursoGrado> getAllByGrado(int idGrado){
        List<CursoGrado> cursosGrado = new ArrayList<>();
   
        try {
            String query = "SELECT c.IdCurso, g.IdGrado, c.nombreCurso, g.numGrado " + 
                    "FROM curso_has_grado cg, grado g, curso c " +
                    "where cg.activo = true and g.activo = true and c.activo = true " + 
                    "and cg.Curso_IdCurso = c.IdCurso and cg.Grado_IdGrado = g.IdGrado " + 
                    "and cg.Grado_IdGrado = %d ";
            ResultSet rs = Database.query(query, idGrado);
            while(rs.next()) {
                CursoGrado cursoGrado = new CursoGrado(
                        rs.getInt("IdCurso"),
                        rs.getInt("IdGrado"),
                        rs.getString("nombreCurso"),
                        rs.getString("numGrado")
                );
                cursosGrado.add(cursoGrado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CursoGrado.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cursosGrado;
    }
    
    /**
     * getAllByCurso
     * 
     * Method to retrieve all the CursoGrado from the database.
     * @param idCurso
     * @return a list of type List<CursoGrado>, empty list if there are none in DB.
     */
    public static List<CursoGrado> getAllByCurso(int idCurso){
        List<CursoGrado> cursosGrado = new ArrayList<>();
   
        try {
            String query = "SELECT c.IdCurso, g.IdGrado, c.nombreCurso, g.numGrado " + 
                    "FROM curso_has_grado cg, grado g, curso c " +
                    "where cg.activo = true and g.activo = true and c.activo = true " + 
                    "and cg.Curso_IdCurso = c.IdCurso and cg.Grado_IdGrado = g.IdGrado " + 
                    "and cg.Curso_IdCurso = %d ";
            ResultSet rs = Database.query(query, idCurso);
            while(rs.next()) {
                CursoGrado cursoGrado = new CursoGrado(
                        rs.getInt("IdCurso"),
                        rs.getInt("IdGrado"),
                        rs.getString("nombreCurso"),
                        rs.getString("numGrado")
                );
                cursosGrado.add(cursoGrado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CursoGrado.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cursosGrado;
    }

    public int getCurso_IdCurso() {
        return Curso_IdCurso;
    }

    public void setCurso_IdCurso(int Curso_IdCurso) {
        this.Curso_IdCurso = Curso_IdCurso;
    }

    public int getGrado_IdGrado() {
        return Grado_IdGrado;
    }

    public void setGrado_IdGrado(int Grado_IdGrado) {
        this.Grado_IdGrado = Grado_IdGrado;
    }

    public String getNombreCurso() {
        return nombreCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }

    public String getNumGrado() {
        return numGrado;
    }

    public void setNumGrado(String numGrado) {
        this.numGrado = numGrado;
    }    
    
}
