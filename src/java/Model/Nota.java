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
import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class Nota {
    private int IdNota;
    private int posNota;
    private int numNota;
    private int IdBimestre;
    private int estudiante_id;
    private int IdCurso;
    private int IdGrado;

    public Nota(int IdNota, int posNota, int numNota, int IdBimestre, int estudiante_id, int IdCurso, int IdGrado) {
        this.IdNota = IdNota;
        this.posNota = posNota;
        this.numNota = numNota;
        this.IdBimestre = IdBimestre;
        this.estudiante_id = estudiante_id;
        this.IdCurso = IdCurso;
        this.IdGrado = IdGrado;
    }

    /**
     * getAllByGrado
     * 
     * Method to retrieve all the Nota from the database.
     * @param idGrado
     * @param idCurso
     * @param idBimestre
     * @return a list of type List<Nota>, empty list if there are none in DB.
     */
    public static List<Nota> getAll(int idGrado, int idCurso, int idBimestre){
        List<Nota> notas = new ArrayList<>();
   
        try {
            String query = "SELECT n.IdNota, n.posNota, n.numNota, n.IdBimestre, n.estudiante_id, n.IdCurso, n.IdGrado " + 
                    "FROM nota n " +
                    "where n.activo = true " + 
                    "and n.IdGrado = %d and n.idCurso = %d and n.IdBimestre = %d ";
            ResultSet rs = Database.query(query, idGrado, idCurso, idBimestre);
            while(rs.next()) {
                Nota nota = new Nota(
                        rs.getInt("IdNota"),
                        rs.getInt("posNota"),
                        rs.getInt("numNota"),
                        rs.getInt("IdBimestre"),
                        rs.getInt("estudiante_id"),
                        rs.getInt("IdCurso"),
                        rs.getInt("IdGrado")
                        
                );
                notas.add(nota);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Nota.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return notas;
    }
    
    /**
     * getAllByGrado
     * 
     * Method to retrieve all the Nota from the database.
     * @param idGrado
     * @param idCurso
     * @param idBimestre
     * @param idEstudiante
     * @return a list of type List<Nota>, empty list if there are none in DB.
     */
    public static List<Nota> getAllByEstudiante(int idGrado, int idEstudiante){
        List<Nota> notas = new ArrayList<>();
   
        try {
            String query = "SELECT n.IdNota, n.posNota, n.numNota, n.IdBimestre, n.estudiante_id, n.IdCurso, n.IdGrado " + 
                    "FROM nota n " +
                    "where n.activo = true " + 
                    "and n.IdGrado = %d and n.estudiante_id = %d";
            ResultSet rs = Database.query(query, idGrado, idEstudiante);
            while(rs.next()) {
                Nota nota = new Nota(
                        rs.getInt("IdNota"),
                        rs.getInt("posNota"),
                        rs.getInt("numNota"),
                        rs.getInt("IdBimestre"),
                        rs.getInt("estudiante_id"),
                        rs.getInt("IdCurso"),
                        rs.getInt("IdGrado")
                        
                );
                notas.add(nota);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Nota.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return notas;
    }
    
    /**
     * exists
     * 
     * Method to check if the object exists in the Database.
     * @return true if the estudiante exists in database, false otherwise.
     */
    public boolean existsInDB(){
        return (getByIds(this.IdNota, this.IdCurso, this.IdBimestre, this.estudiante_id, this.posNota) != null);
    }
    
    /**
     * getAllByGrado
     * 
     * Method to retrieve all the Nota from the database.
     * @param idGrado
     * @param idCurso
     * @param idEstudiante
     * @param posNota
     * @param idBimestre
     * @return a list of type List<Nota>, empty list if there are none in DB.
     */
    public static Nota getByIds(int idGrado, int idCurso, int idBimestre, int idEstudiante, int posNota){
        Nota nota = null;
   
        try {
            String query = "SELECT n.IdNota, n.posNota, n.numNota, n.IdBimestre, n.estudiante_id, n.IdCurso, n.IdGrado " + 
                    "FROM nota n " +
                    "where n.activo = true " + 
                    "and n.IdGrado = %d and n.idCurso = %d and n.IdBimestre = %d and n.estudiante_id = %d and posNota = %d and activo = 1";
            ResultSet rs = Database.query(query, idGrado, idCurso, idBimestre, idEstudiante, posNota);
            while(rs.next()) {
                nota = new Nota(
                        rs.getInt("IdNota"),
                        rs.getInt("posNota"),
                        rs.getInt("numNota"),
                        rs.getInt("IdBimestre"),
                        rs.getInt("estudiante_id"),
                        rs.getInt("IdCurso"),
                        rs.getInt("IdGrado")
                        
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(Nota.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return nota;
    }

    public int getIdNota() {
        return IdNota;
    }

    public void setIdNota(int IdNota) {
        this.IdNota = IdNota;
    }

    public int getPosNota() {
        return posNota;
    }

    public void setPosNota(int posNota) {
        this.posNota = posNota;
    }

    public int getNumNota() {
        return numNota;
    }

    public void setNumNota(int numNota) {
        this.numNota = numNota;
    }

    public int getIdBimestre() {
        return IdBimestre;
    }

    public void setIdBimestre(int IdBimestre) {
        this.IdBimestre = IdBimestre;
    }

    public int getEstudiante_id() {
        return estudiante_id;
    }

    public void setEstudiante_id(int estudiante_id) {
        this.estudiante_id = estudiante_id;
    }

    public int getIdCurso() {
        return IdCurso;
    }

    public void setIdCurso(int IdCurso) {
        this.IdCurso = IdCurso;
    }

    public int getIdGrado() {
        return IdGrado;
    }

    public void setIdGrado(int IdGrado) {
        this.IdGrado = IdGrado;
    }

    public boolean save() {
        String query;
        Boolean exists = this.existsInDB();
        
        if (!exists) {
            query = "INSERT INTO nota (IdNota, numNota, IdBimestre, estudiante_id, IdCurso, IdGrado, posNota)" +
                    "VALUES (0, %d, %d, %d, %d, %d, %d)";
        } else {
            query = " UPDATE nota SET numNota=%d " +
                    " WHERE IdBimestre = %d and estudiante_id = %d and IdCurso = %d and IdGrado = %d and posNota = %d and activo = true";
        }
        
        try {
            Database.update(query, this.numNota, this.IdBimestre, this.estudiante_id, this.IdCurso, this.IdGrado, this.posNota);
        } catch (SQLException ex) {
            System.out.println("ex: " + ex);
            Logger.getLogger(Nota.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
    
    
    
}
