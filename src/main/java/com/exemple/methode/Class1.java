package com.exemple.methode;

import com.frame.annotation.GetMapping;
import com.frame.annotation.Controller;

@Controller
public class Class1 {

    public Class1(){}

    @GetMapping("/")
    public int getInt(){
        return 0;
    }

    @GetMapping("/double")
    public double getDouble(){
        return 0.;
    }
}
