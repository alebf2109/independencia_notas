/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.Database;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Estudiante {
    private int estudiante_id = -1;
    private String dni;
    private String nombre;
    private String apellidoMaterno;
    private String apellidoPaterno;
    private String correo;
    private int Grado_IdGrado;
    private String grado;
    private Boolean activo;

    public Estudiante() {
        this.dni = "";
        this.nombre = "";
        this.apellidoMaterno = "";
        this.apellidoPaterno = "";
        this.correo = "";
        this.Grado_IdGrado = -1;
        this.grado = "";
        this.activo = null;
    }    
    
    public Estudiante(int estudiante_id, String dni, String nombre, String apellidoPaterno, String apellidoMaterno, String correo, int Grado_IdGrado, String grado, Boolean activo) {
        super();
        this.estudiante_id = estudiante_id;
        this.dni = dni;
        this.nombre = nombre;
        this.apellidoMaterno = apellidoMaterno;
        this.apellidoPaterno = apellidoPaterno;
        this.correo = correo;
        this.Grado_IdGrado = Grado_IdGrado;
        this.grado = grado;
        this.activo = activo;
    }

    /**
     * save
     * 
     * Handles both INSERT and UPDATE actions to the Database
     * @return true if the insert / update was successful, false otherwise
     */
    public boolean save(){
        /*if (!this.isValid()){
            return false;
        }*/
        
        String query;
        Boolean exists = this.existsInDB(); 
        if (!exists) {
            query = "INSERT INTO estudiante (estudiante_id, dni, nombre, apellidoMaterno, apellidoPaterno, correo, Grado_IdGrado)" +
                    "VALUES (0, '%s', '%s', '%s', '%s', '%s', %d)";   
        } else {
            query = "UPDATE estudiante SET dni='%s',nombre='%s', apellidoMaterno='%s', apellidoPaterno='%s', correo='%s', Grado_IdGrado=%d " +
                    "WHERE estudiante_id = " + this.estudiante_id;
        }
        
        try {
            Database.update(query, this.dni, this.nombre, this.apellidoMaterno, this.apellidoPaterno, this.correo, this.Grado_IdGrado);
        } catch (SQLException ex) {
            System.out.println("ex: " + ex);
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
    
    /**
     * exists
     * 
     * Method to check if the object exists in the Database.
     * @return true if the estudiante exists in database, false otherwise.
     */
    public boolean existsInDB(){
        return (getById(this.estudiante_id) != null);
    }
    
    /**
     * Update
     * Updates all the fields
     * @param estudiante_id
     * @param dni
     * @param nombre
     * @param apellidoMaterno
     * @param apellidoPaterno
     * @param correo
     * @param Grado_IdGrado
     */
    public void Update(int estudiante_id, String dni, String nombre, String apellidoMaterno, String apellidoPaterno, String correo, int Grado_IdGrado) {
        this.estudiante_id = estudiante_id;
        this.dni = dni;
        this.nombre = nombre;
        this.apellidoMaterno = apellidoMaterno;
        this.apellidoPaterno = apellidoPaterno;
        this.correo = correo;
        this.Grado_IdGrado = Grado_IdGrado;
    }
    
    /**
     * getCertificates
     * 
     * Retrieves all the certificates for a given employee
     * @return a list of type List<Certificate>, empty if none present in DB
     */
    /*public List<Certificate> getCertificates(){
        List<Certificate> certificates = new ArrayList<>();
        
        try {
            String query = "SELECT T.id, T.personId, T.type, T.name, T.organization, T.dateAquired " +
                           "FROM Certificate AS T " +
                           "WHERE T.personId = " + Integer.toString(this.id);
            ResultSet rs = Database.query(query, this.getId());
            while (rs.next()){
                Certificate certificate = new Certificate(
                        rs.getInt("id"),
                        rs.getInt("personId"),
                        rs.getString("type"),
                        rs.getString("name"),
                        rs.getString("organization"),
                        rs.getDate("dateAquired")
                );
                certificates.add(certificate);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        return certificates;
    }*/
    
    /**
     * getPreviousJobs
     * 
     * Retrieves all the previous jobs for a given employee
     * @return a list of type List<PreviousJob>, empty if none present in DB
     */
    /*public List<PreviousJob> getPreviousJobs(){
        List<PreviousJob> previousJobs = new ArrayList<>();
        
        try {
            String query = "SELECT P.id, P.personId, P.jobTitle, P.company, P.jobDescription, P.salary, P.startDate, P.endDate " +
                           "FROM PreviousJob AS P " +
                           "WHERE P.personId = " + Integer.toString(this.id);
            ResultSet rs = Database.query(query, this.getId());
            while (rs.next()){
                PreviousJob pj = new PreviousJob(
                        rs.getInt("id"),
                        rs.getInt("personId"),
                        rs.getString("company"),
                        rs.getString("jobTitle"),
                        rs.getString("jobDescription"),
                        rs.getDouble("salary"),
                        rs.getDate("startDate"),
                        rs.getDate("endDate")
                );
                previousJobs.add(pj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return previousJobs;
    }*/
    
    /**
     * getById
     * 
     * Method to retrieve a Employee from the database by its ID.
     * @param id
     * @return a Employee object if found, null if not present in DB.
     */
    public static Estudiante getById(int id){
        Estudiante estudiante = null;
        
        try {
            String query = "SELECT e.estudiante_id, e.dni, e.nombre, e.apellidoPaterno, e.apellidoMaterno, e.correo, e.Grado_IdGrado, g.numGrado, e.activo FROM estudiante e, grado g where e.estudiante_id = %d and e.Grado_IdGrado = g.IdGrado";
            ResultSet rs = Database.query(query, id);
            if (rs.next()){
                estudiante = new Estudiante(
                        rs.getInt("estudiante_id"),
                        rs.getString("dni"),
                        rs.getString("nombre"),
                        rs.getString("apellidoPaterno"),
                        rs.getString("apellidoMaterno"),
                        rs.getString("correo"),
                        rs.getInt("Grado_IdGrado"),
                        rs.getString("numGrado"),
                        rs.getBoolean("activo")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return estudiante;
    }
   
    /**
     * getAll
     * 
     * Method to retrieve all the Estudiante from the database.
     * @return a list of type List<Estudiante>, empty list if there are none in DB.
     */
    public static List<Estudiante> getAll(){
        List<Estudiante> estudiantes = new ArrayList<>();
   
        try {
            String query = "SELECT e.estudiante_id, e.dni, e.nombre, e.apellidoPaterno, e.apellidoMaterno, e.correo, e.Grado_IdGrado, g.numGrado, e.activo FROM estudiante e, grado g where e.Grado_IdGrado = g.IdGrado";
            ResultSet rs = Database.query(query);
            while(rs.next()) {
    
                Estudiante estudiante = new Estudiante(
                        rs.getInt("estudiante_id"),
                        rs.getString("dni"),
                        rs.getString("nombre"),
                        rs.getString("apellidoPaterno"),
                        rs.getString("apellidoMaterno"),
                        rs.getString("correo"),
                        rs.getInt("Grado_IdGrado"),
                        rs.getString("numGrado"),
                        rs.getBoolean("activo")
                );
                estudiantes.add(estudiante);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return estudiantes;
    }
    
    /**
     * getAll
     * 
     * Method to retrieve all the Estudiante from the database.
     * @param grado
     * @return a list of type List<Estudiante>, empty list if there are none in DB.
     */
    public static List<Estudiante> getAllByGrado(int grado){
        List<Estudiante> estudiantes = new ArrayList<>();
   
        try {
            String query = "SELECT e.estudiante_id, e.dni, e.nombre, e.apellidoPaterno, e.apellidoMaterno, e.correo, e.Grado_IdGrado, g.numGrado, e.activo " + 
                    " FROM estudiante e, grado g where e.Grado_IdGrado = g.IdGrado and g.IdGrado = %d";
            ResultSet rs = Database.query(query, grado);
            while(rs.next()) {
    
                Estudiante estudiante = new Estudiante(
                        rs.getInt("estudiante_id"),
                        rs.getString("dni"),
                        rs.getString("nombre"),
                        rs.getString("apellidoPaterno"),
                        rs.getString("apellidoMaterno"),
                        rs.getString("correo"),
                        rs.getInt("Grado_IdGrado"),
                        rs.getString("numGrado"),
                        rs.getBoolean("activo")
                );
                estudiantes.add(estudiante);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return estudiantes;
    }

    /**
     * exists
     * 
     * Method to check if the object exists in the Database.
     * @return true if the employee exists in database, false otherwise.
     */
//    public boolean existsInDB(){
//        return (getById(this.id) != null);
//    }
    
    /**
     * isValid
     * 
     * @return true if the fields are filled
     */
//    @Override
//    public boolean isValid(){ // TODO: Careful with these
//        boolean x = super.isValid();
//        Field[] attrs = getClass().getDeclaredFields();
//        for (Field attr : attrs){
//            try {
//                if (attr.get(this) == null || attr.get(this).equals("")){
//                    return false;
//                }
//            } catch (IllegalArgumentException | IllegalAccessException ex) {
//                Logger.getLogger(Person.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return x;
//    }
    
    /**
     * deleteById
     * 
     * Method to delete a Employee record from the database by its ID
     * @param id
     * @param active
     * @return true if the fields are filled correctly
     */
    public static boolean changeActiveById(int id, boolean active){
        int res = 0;
        try {
            String query = "UPDATE estudiante SET activo = %d WHERE estudiante_id = %d;";
            res = Database.update(query, active ? 1 : 0, id);
        } catch (SQLException ex) {
            Logger.getLogger(Estudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res == 1;
    }

    public int getEstudiante_id() {
        return estudiante_id;
    }

    public void setEstudiante_id(int estudiante_id) {
        this.estudiante_id = estudiante_id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getGrado_IdGrado() {
        return Grado_IdGrado;
    }

    public void setGrado_IdGrado(int Grado_IdGrado) {
        this.Grado_IdGrado = Grado_IdGrado;
    }
    
    public String getFullName() {
        return this.apellidoPaterno + " " + this.apellidoMaterno + " " + this.nombre;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
    
    
    
}
