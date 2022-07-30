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

public class Grado {
    private int IdGrado = -1;
    private String numGrado;
    
    public Grado(int IdGrado, String numGrado) {
        super();
        this.IdGrado = IdGrado;
        this.numGrado = numGrado;
    }

    /**
     * getAll
     * 
     * Method to retrieve all the Employee from the database.
     * @return a list of type List<Employee>, empty list if there are none in DB.
     */
    public static List<Grado> getAll(){
        List<Grado> grados = new ArrayList<>();
   
        try {
            String query = "SELECT * FROM grado where activo = true";
            ResultSet rs = Database.query(query);
            while(rs.next()) {
                Grado grado = new Grado(
                        rs.getInt("IdGrado"),
                        rs.getString("numGrado")
                );
                grados.add(grado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Grado.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return grados;
    }

    public int getIdGrado() {
        return IdGrado;
    }

    public void setIdGrado(int IdGrado) {
        this.IdGrado = IdGrado;
    }

    public String getNumGrado() {
        return numGrado;
    }

    public void setNumGrado(String numGrado) {
        this.numGrado = numGrado;
    }
    
    
    
}
