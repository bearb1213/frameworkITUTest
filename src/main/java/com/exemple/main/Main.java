package com.exemple.main;

import com.frame.annotation.GetMapping;
import com.frame.annotation.AnnotationGetteur;

import java.lang.reflect.Method;
import java.util.List;

import com.exemple.methode.*;


public class Main {


    public static void main(String[] args) {
        try {
            List<GetMapping> gets = AnnotationGetteur.getAllGetMapping("com.exemple.methode");
            System.out.println("\n\n\n\nGet Mapping : ");
            for (GetMapping get : gets) {
                System.out.println("url : "+get.value());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
