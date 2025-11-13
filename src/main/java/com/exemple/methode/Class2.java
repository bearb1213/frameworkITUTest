package com.exemple.methode;

import com.frame.annotation.GetMapping;
import com.frame.annotation.Controller;


public class Class2 {

    public Class2(){
    }

    @GetMapping("/class/get1")
    public String testGet1(){
        return "testget1";
    }

    @GetMapping("/class/get2")
    public String testGet2(){
        return "testget1";
    }
    
}
