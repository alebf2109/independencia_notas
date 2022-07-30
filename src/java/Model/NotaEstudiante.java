/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

public class NotaEstudiante {
    private int estudiante_id;
    private String dni;
    private String nombreCompleto;
    private int n1;
    private int n2;
    private int n3;
    private int n4;
    private int n5;
    private int n6;
    private int n7;
    private int promedio;

    public NotaEstudiante(int estudiante_id, String dni, String nombreCompleto, int n1, int n2, int n3, int n4, int n5, int n6, int n7) {
        this.estudiante_id = estudiante_id;
        this.dni = dni;
        this.nombreCompleto = nombreCompleto;
        this.n1 = n1;
        this.n2 = n2;
        this.n3 = n3;
        this.n4 = n4;
        this.n5 = n5;
        this.n6 = n6;
        this.n7 = n7;
        this.promedio = (n1 + n2 + n3 + n4 + n5 + n6 + n7)/7;
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

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getN1() {
        return n1;
    }

    public void setN1(int n1) {
        this.n1 = n1;
    }

    public int getN2() {
        return n2;
    }

    public void setN2(int n2) {
        this.n2 = n2;
    }

    public int getN3() {
        return n3;
    }

    public void setN3(int n3) {
        this.n3 = n3;
    }

    public int getN4() {
        return n4;
    }

    public void setN4(int n4) {
        this.n4 = n4;
    }

    public int getN5() {
        return n5;
    }

    public void setN5(int n5) {
        this.n5 = n5;
    }

    public int getN6() {
        return n6;
    }

    public void setN6(int n6) {
        this.n6 = n6;
    }

    public int getN7() {
        return n7;
    }

    public void setN7(int n7) {
        this.n7 = n7;
    }    

    public int getPromedio() {
        return promedio;
    }

    public void setPromedio(int promedio) {
        this.promedio = promedio;
    }
    
    
    
}
