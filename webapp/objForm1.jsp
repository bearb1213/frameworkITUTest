<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.exemple.model.Employe" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Affichage de l'Employé</title>
</head>
<body>
    <h1>Informations de l'Employé</h1>
    
    <%
        // Récupération de l'objet Employe depuis le ModelView
        Employe emp = (Employe) request.getAttribute("emp");
        
        if (emp != null) {
    %>
        <table border="1" cellpadding="10">
            <tr>
                <th>Champ</th>
                <th>Valeur</th>
            </tr>
            <tr>
                <td><strong>Nom :</strong></td>
                <td><%= emp.getNom() %></td>
            </tr>
            <tr>
                <td><strong>Âge :</strong></td>
                <td><%= emp.getAge() %></td>
            </tr>
            <tr>
                <td><strong>Salaire :</strong></td>
                <td><%= String.format("%.2f", emp.getSalaire()) %></td>
            </tr>
        </table>
        
        <br>
        
        <h3>Détails supplémentaires :</h3>
        <ul>
            <li>Nom complet : <strong><%= emp.getNom() %></strong></li>
            <li>Âge : <strong><%= emp.getAge() %> ans</strong></li>
            <li>Salaire mensuel : <strong><%= String.format("%.2f €", emp.getSalaire()) %></strong></li>
            <li>Salaire annuel : <strong><%= String.format("%.2f €", emp.getSalaire() * 12) %></strong></li>
        </ul>
    <% 
        } else { 
    %>
        <p style="color: red;">Aucun employé à afficher !</p>
    <% 
        } 
    %>
    
    <br><br>
    
    <h2>Formulaire pour créer un nouvel employé</h2>
    <form method="POST" action="objetTest">
        <table>
            <tr>
                <td><label for="nom">Nom :</label></td>
                <td><input type="text" id="nom" name="emp.nom" required></td>
            </tr>
            <tr>
                <td><label for="age">Âge :</label></td>
                <td><input type="number" id="age" name="emp.age" min="18" max="100" required></td>
            </tr>
            <tr>
                <td><label for="salaire">Salaire :</label></td>
                <td><input type="number" id="salaire" name="emp.salaire" min="0" step="0.01" required></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">Soumettre</button>
                    <button type="reset">Réinitialiser</button>
                </td>
            </tr>
        </table>
    </form>
    
    <br>
    <hr>
    
    <h3>Instructions :</h3>
    <p>1. Remplissez le formulaire ci-dessus</p>
    <p>2. Cliquez sur "Soumettre" pour envoyer les données</p>
    <p>3. Les informations de l'employé seront affichées ci-dessus</p>
    
    <br>
    
    <a href="javascript:history.back()">Retour</a>
</body>
</html>