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

public class Bimestre {
    private int IdBimestre = -1;
    private String nombreBimestre;
    
    public Bimestre(int IdBimestre, String nombreBimestre) {
        super();
        this.IdBimestre = IdBimestre;
        this.nombreBimestre = nombreBimestre;
    }

    /**
     * getAll
     * 
     * Method to retrieve all the Bimestre from the database.
     * @return a list of type List<Bimestre>, empty list if there are none in DB.
     */
    public static List<Bimestre> getAll(){
        List<Bimestre> bimestres = new ArrayList<>();
   
        try {
            String query = "SELECT * FROM bimestre where activo = true";
            ResultSet rs = Database.query(query);
            while(rs.next()) {
                Bimestre bimestre = new Bimestre(
                        rs.getInt("IdBimestre"),
                        rs.getString("nombreBimestre")
                );
                bimestres.add(bimestre);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Bimestre.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return bimestres;
    }

    public int getIdBimestre() {
        return IdBimestre;
    }

    public void setIdBimestre(int IdBimestre) {
        this.IdBimestre = IdBimestre;
    }

    public String getNombreBimestre() {
        return nombreBimestre;
    }

    public void setNombreBimestre(String nombreBimestre) {
        this.nombreBimestre = nombreBimestre;
    }
    
}
