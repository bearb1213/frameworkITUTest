package com.exemple.model;

public class Employe {
    private String nom;
    private Integer age;
    private Double salaire;

    public Employe (){}

    public Employe (String nom,Integer age,Double salaire){
        this.nom=nom;
        this.age=age;
        this.salaire=salaire;
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

    public Double getSalaire(){
        return salaire;
    }
    public void setSalaire(Double salaire){
        this.salaire=salaire;
    }

}
