package com.exemple.methode;

import com.frame.annotation.Authorized;
import com.frame.annotation.Controller;
import com.frame.annotation.GetMapping;
import com.frame.annotation.PostMapping;
import com.frame.annotation.RequestParam;
import com.frame.annotation.Role;
import com.frame.model.ModelView;
import com.frame.model.Session;

@Controller
public class AuthController {
    
    public AuthController(){
    }

    // Page de connexion
    @GetMapping("/auth/login")
    public ModelView loginPage(Session session) {
        ModelView mv = new ModelView("/authLogin.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        return mv;
    }

    // Traiter la connexion
    @PostMapping("/auth/login")
    public ModelView login(
            @RequestParam("username") String username, 
            @RequestParam("role") String role,
            Session session) {
        
        ModelView mv = new ModelView("/authLogin.jsp");
        
        // Simuler une connexion en stockant les infos dans la session
        session.setAttribute("username", username);
        session.setAttribute("role", role);
        
        mv.addAttribute("currentUser", username);
        mv.addAttribute("currentRole", role);
        mv.addAttribute("message", "Connexion réussie ! Vous êtes connecté en tant que " + username + " avec le rôle " + role);
        
        return mv;
    }

    // Page publique (sans authentification)
    @GetMapping("/auth/public")
    public ModelView publicPage(Session session) {
        ModelView mv = new ModelView("/authPublic.jsp");
        String currentUser = (String) session.getAttribute("username");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("message", "Ceci est une page publique accessible à tous");
        return mv;
    }

    // Page protégée (nécessite authentification avec @Authorized)
    @GetMapping("/auth/protected")
    @Authorized
    public ModelView protectedPage(Session session) {
        ModelView mv = new ModelView("/authProtected.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Bienvenue sur la page protégée ! Vous êtes authentifié.");
        return mv;
    }

    // Page pour administrateurs uniquement (@Role("admin"))
    @GetMapping("/auth/admin")
    @Authorized
    @Role("admin")
    public ModelView adminPage(Session session) {
        ModelView mv = new ModelView("/authAdmin.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Bienvenue dans l'espace administrateur !");
        return mv;
    }

    // Page pour utilisateurs avec rôle "user"
    @GetMapping("/auth/user")
    @Authorized
    @Role("user")
    public ModelView userPage(Session session) {
        ModelView mv = new ModelView("/authUser.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Bienvenue dans l'espace utilisateur !");
        return mv;
    }

    // Page pour modérateurs
    @GetMapping("/auth/moderator")
    @Authorized
    @Role("moderator")
    public ModelView moderatorPage(Session session) {
        ModelView mv = new ModelView("/authModerator.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Bienvenue dans l'espace modérateur !");
        return mv;
    }

    // Déconnexion
    @GetMapping("/auth/logout")
    public ModelView logout(Session session) {
        session.removeAttribute("username");
        session.removeAttribute("role");
        
        ModelView mv = new ModelView("/authLogin.jsp");
        mv.addAttribute("message", "Vous avez été déconnecté avec succès");
        return mv;
    }

    // Page de test pour visualiser toutes les fonctionnalités
    @GetMapping("/auth/test")
    public ModelView testPage(Session session) {
        ModelView mv = new ModelView("/authTest.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("isAuthenticated", currentUser != null);
        return mv;
    }

    // Page accessible par admin ET user (@Role("admin,user"))
    @GetMapping("/auth/adminOrUser")
    @Authorized
    @Role("admin,user")
    public ModelView adminOrUserPage(Session session) {
        ModelView mv = new ModelView("/authAdminOrUser.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Cette page est accessible aux admins ET aux users !");
        return mv;
    }

    // Page accessible par admin ET moderator
    @GetMapping("/auth/adminOrModerator")
    @Authorized
    @Role("admin,moderator")
    public ModelView adminOrModeratorPage(Session session) {
        ModelView mv = new ModelView("/authAdminOrModerator.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Cette page est accessible aux admins ET aux modérateurs !");
        return mv;
    }

    // Page accessible par user ET moderator
    @GetMapping("/auth/userOrModerator")
    @Authorized
    @Role("user,moderator")
    public ModelView userOrModeratorPage(Session session) {
        ModelView mv = new ModelView("/authUserOrModerator.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Cette page est accessible aux users ET aux modérateurs !");
        return mv;
    }

    // Page accessible par tous les rôles principaux
    @GetMapping("/auth/allRoles")
    @Authorized
    @Role("admin,user,moderator")
    public ModelView allRolesPage(Session session) {
        ModelView mv = new ModelView("/authAllRoles.jsp");
        String currentUser = (String) session.getAttribute("username");
        String currentRole = (String) session.getAttribute("role");
        mv.addAttribute("currentUser", currentUser);
        mv.addAttribute("currentRole", currentRole);
        mv.addAttribute("message", "Cette page est accessible à tous les rôles : admin, user et moderator !");
        return mv;
    }
}
