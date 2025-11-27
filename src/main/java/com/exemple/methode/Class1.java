package com.exemple.methode;

import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.annotation.RequestParam;
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
    public ModelView s(){
        ModelView mv = new ModelView("/post.jsp");
        mv.addAttribute("methode","Post");
        return mv;
    }
    @GetMapping("/double")
    public ModelView getString(){
        ModelView mv = new ModelView("/post.jsp");
        mv.addAttribute("methode","Get");
        return mv;
    }

    @GetMapping("/test")
    public String test(){
        return "test reussi";
    }

    @GetMapping("/model")
    public ModelView essaie(){
        ModelView mv = new ModelView("/aa.jsp");
        mv.addAttribute("test", "hahaha");
        
        return mv;
    }
    @GetMapping("/try/{model}")
    public ModelView testArg(String model){
        ModelView mv = new ModelView("/aa.jsp");
        mv.addAttribute("test", model);
        
        return mv;
    }
    @GetMapping("/essaie/{id}/{exemple}")
    public ModelView essai(){
        ModelView mv = new ModelView("/aa.jsp");
        mv.addAttribute("test", "hahaha");
        
        return mv;
    }
    @GetMapping("/action/{id}")
    public ModelView action(Integer id , String name , @RequestParam("valeur") String val){
        ModelView mv = new ModelView("/result.jsp");
        mv.addAttribute("id", id);
        mv.addAttribute("name", name);
        mv.addAttribute("valeur", val);
        
        return mv;
    }

}
