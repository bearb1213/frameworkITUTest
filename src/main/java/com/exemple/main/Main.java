package com.exemple.main;

import com.frame.annotation.Mapping;
import com.frame.annotation.AnnotationGetteur;
import com.frame.annotation.Mapping;

import java.lang.reflect.Method;
import java.util.List;

import com.exemple.methode.*;


public class Main {


    public static void main(String[] args) {
        try {
            // List<Mapping> mappings = AnnotationGetteur.getAllMapping("com.exemple");
            // for (Mapping mapping : mappings) {
            //     System.out.println("class : "+mapping.getClazz().getName() + " ; method : " + mapping.getMethod().getName() + " ; Path : " + mapping.getPath() + " ; Type annotation : "+mapping.getAnnotation());
            // }
         
            // for(Class<?> clazz : AnnotationGetteur.getAllClassesController("com.exemple" )){
            //     if (clazz.isAnnotationPresent(com.frame.annotation.Controller.class)) {
            //         System.out.println("misy ");
            //     }
            //     System.out.println(clazz.getName());
            // }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
