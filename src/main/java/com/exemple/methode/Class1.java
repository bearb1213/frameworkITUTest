package com.exemple.methode;

import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.model.ModelView;
import com.frame.annotation.Controller;

@Controller
public class Class1 {

    public Class1(){}

    @GetMapping("/")
    public int getInt(){
        return 0;
    }

    @PostMapping("/double")
    public double getDouble(){
        return 0.;
    }

    @GetMapping("/test")
    public String test(){
        return "test reussi";
    }

    @GetMapping("/model")
    public ModelView essaie(){
        ModelView mv = new ModelView("aa.jsp");
        mv.addAttribute("test", "hahaha");
        
        return mv;
    }
    @GetMapping("/essaie/{id}/{exemple}")
    public ModelView essai(){
        ModelView mv = new ModelView("aa.jsp");
        mv.addAttribute("test", "hahaha");
        
        return mv;
    }

}
