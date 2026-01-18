package com.exemple.methode;

import com.frame.annotation.Controller;
import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.annotation.RequestParam;
import com.frame.model.ModelView;
import com.frame.model.Session;

@Controller
public class SessionTest {
    
    public SessionTest(){
    }

    @GetMapping("/session/test")
    public ModelView sessionTestPage(Session session) {
        ModelView mv = new ModelView("/sessionTest.jsp");
        
        // Vérifier si un compteur existe déjà
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        if (visitCount == null) {
            visitCount = 0;
        }
        visitCount++;
        session.setAttribute("visitCount", visitCount);
        
        // Récupérer le nom d'utilisateur s'il existe
        String username = (String) session.getAttribute("username");
        
        mv.addAttribute("visitCount", visitCount);
        mv.addAttribute("username", username);
        mv.addAttribute("isLoggedIn", username != null);
        
        return mv;
    }

    @PostMapping("/session/login")
    public ModelView login(@RequestParam("username") String username, Session session) {
        ModelView mv = new ModelView("/sessionTest.jsp");
        
        // Sauvegarder le nom d'utilisateur dans la session
        session.setAttribute("username", username);
        session.setAttribute("loginTime", System.currentTimeMillis());
        
        // Incrémenter le compteur de visites
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        if (visitCount == null) {
            visitCount = 0;
        }
        visitCount++;
        session.setAttribute("visitCount", visitCount);
        
        mv.addAttribute("visitCount", visitCount);
        mv.addAttribute("username", username);
        mv.addAttribute("isLoggedIn", true);
        mv.addAttribute("message", "Connexion réussie !");
        
        return mv;
    }

    @GetMapping("/session/logout")
    public ModelView logout(Session session) {
        ModelView mv = new ModelView("/sessionTest.jsp");
        
        // Sauvegarder le compteur de visites avant de supprimer l'utilisateur
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        
        // Supprimer uniquement le nom d'utilisateur et le temps de connexion
        session.removeAttribute("username");
        session.removeAttribute("loginTime");
        
        mv.addAttribute("visitCount", visitCount != null ? visitCount : 0);
        mv.addAttribute("isLoggedIn", false);
        mv.addAttribute("message", "Déconnexion réussie !");
        
        return mv;
    }

    @GetMapping("/session/clear")
    public ModelView clearSession(Session session) {
        ModelView mv = new ModelView("/sessionTest.jsp");
        
        // Vider complètement la session
        session.clear();
        
        mv.addAttribute("visitCount", 0);
        mv.addAttribute("isLoggedIn", false);
        mv.addAttribute("message", "Session effacée !");
        
        return mv;
    }

    @PostMapping("/session/addData")
    public ModelView addData(@RequestParam("key") String key, @RequestParam("value") String value, Session session) {
        ModelView mv = new ModelView("/sessionTest.jsp");
        
        // Ajouter une donnée personnalisée à la session
        session.setAttribute(key, value);
        
        // Récupérer les infos de session
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        String username = (String) session.getAttribute("username");
        
        mv.addAttribute("visitCount", visitCount != null ? visitCount : 0);
        mv.addAttribute("username", username);
        mv.addAttribute("isLoggedIn", username != null);
        mv.addAttribute("message", "Donnée ajoutée : " + key + " = " + value);
        mv.addAttribute("sessionData", session.getAttributes());
        
        return mv;
    }
}

