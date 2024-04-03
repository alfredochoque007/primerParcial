
package com.emergentes.modelos;

/**
 *
 * @author l-alfredo
 */

public class Calificacion {
    private int id;
    private String nombre;
    private double primerParcial;
    private double segundoParcial;
    private double examenFinal;
    private double nota;

    public Calificacion() {
    }

    public Calificacion(int id, String nombre, double primerParcial, double segundoParcial, double examenFinal, double nota) {
        this.id = id;
        this.nombre = nombre;
        this.primerParcial = primerParcial;
        this.segundoParcial = segundoParcial;
        this.examenFinal = examenFinal;
        this.nota = nota;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrimerParcial() {
        return primerParcial;
    }

    public void setPrimerParcial(double primerParcial) {
        this.primerParcial = primerParcial;
    }

    public double getSegundoParcial() {
        return segundoParcial;
    }

    public void setSegundoParcial(double segundoParcial) {
        this.segundoParcial = segundoParcial;
    }

    public double getExamenFinal() {
        return examenFinal;
    }

    public void setExamenFinal(double examenFinal) {
        this.examenFinal = examenFinal;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

}
