package com.exemple.methode;

import com.frame.annotation.Controller;
import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.model.ModelView;
import com.exemple.model.Salaire;
import java.util.ArrayList;

@Controller
public class SalaireController {

    public SalaireController() {}

    @GetMapping("/salaires")
    public ModelView salaireForm() {
        ModelView mv = new ModelView("/salaireForm.jsp");
        return mv;
    }

    @PostMapping("/salaires")
    public ModelView createSalairesArray(Salaire[] salaires) {
        ModelView mv = new ModelView("/salaireResult.jsp");
        
        if (salaires != null && salaires.length > 0) {
            mv.addAttribute("success", true);
            mv.addAttribute("salaires", salaires);
            mv.addAttribute("count", salaires.length);
            mv.addAttribute("type", "Array");
            
            // Calculer le total
            double total = 0.0;
            for (Salaire salaire : salaires) {
                if (salaire != null && salaire.getMontant() != null) {
                    total += salaire.getMontant();
                }
            }
            mv.addAttribute("total", total);
        } else {
            mv.addAttribute("success", false);
            mv.addAttribute("error", "Aucun salaire créé");
        }
        
        return mv;
    }

    @GetMapping("/salaireslist")
    public ModelView salaireListForm() {
        ModelView mv = new ModelView("/salaireListForm.jsp");
        return mv;
    }

    @PostMapping("/salaireslist")
    public ModelView createSalairesList(ArrayList<Salaire> salaires) {
        ModelView mv = new ModelView("/salaireListResult.jsp");
        
        if (salaires != null && !salaires.isEmpty()) {
            mv.addAttribute("success", true);
            mv.addAttribute("salaires", salaires);
            mv.addAttribute("count", salaires.size());
            mv.addAttribute("type", "ArrayList");
            
            // Calculer le total
            double total = 0.0;
            for (Salaire salaire : salaires) {
                if (salaire != null && salaire.getMontant() != null) {
                    total += salaire.getMontant();
                }
            }
            mv.addAttribute("total", total);
        } else {
            mv.addAttribute("success", false);
            mv.addAttribute("error", "Aucun salaire créé");
        }
        
        return mv;
    }

    

}
