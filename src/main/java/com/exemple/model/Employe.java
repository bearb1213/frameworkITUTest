package com.exemple.model;

import java.util.ArrayList;

public class Employe {
    private String nom;
    private Integer age;
    private ArrayList<Salaire> salaires;

    public Employe (){}

    public Employe (String nom,Integer age,ArrayList<Salaire> salaires){
        this.nom=nom;
        this.age=age;
        this.salaires=salaires;
    }

    public String getNom(){
        return nom;
    }
    public void setNom(String nom){
        this.nom=nom;
    }

    public Integer getAge(){
        return age;
    }
    public void setAge(Integer age){
        this.age=age;
    }

    public ArrayList<Salaire> getSalaires(){
        return salaires;
    }
    public void setSalaires(ArrayList<Salaire> salaires){
        this.salaires=salaires;
    }

}
