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

public class Curso {
    private int IdCurso = -1;
    private String nombreCurso;
    
    public Curso(int IdCurso, String nombreCurso) {
        super();
        this.IdCurso = IdCurso;
        this.nombreCurso = nombreCurso;
    }

    /**
     * getAll
     * 
     * Method to retrieve all the Curso from the database.
     * @return a list of type List<Curso>, empty list if there are none in DB.
     */
    public static List<Curso> getAll(){
        List<Curso> cursos = new ArrayList<>();
   
        try {
            String query = "SELECT * FROM grado where activo = true";
            ResultSet rs = Database.query(query);
            while(rs.next()) {
                Curso curso = new Curso(
                        rs.getInt("IdCurso"),
                        rs.getString("nombreCurso")
                );
                cursos.add(curso);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Curso.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return cursos;
    }

    public int getIdCurso() {
        return IdCurso;
    }

    public void setIdCurso(int IdCurso) {
        this.IdCurso = IdCurso;
    }

    public String getNombreCurso() {
        return nombreCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }

    
    
}
