package com.exemple.model;

public class Salaire {
    private Double montant;
    private String devise;

    public Salaire (){}

    public Salaire (Double montant,String devise){
        this.montant=montant;
        this.devise=devise;
    }

    public Double getMontant(){
        return montant;
    }
    public void setMontant(Double montant){
        this.montant=montant;
    }

    public String getDevise(){
        return devise;
    }
    public void setDevise(String devise){
        this.devise=devise;
    }   
}
