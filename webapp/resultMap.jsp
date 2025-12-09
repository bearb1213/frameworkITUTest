<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire avec Map et Résultats</title>
</head>
<body>
    <h1>Formulaire avec Paramètres Dynamiques</h1>
    
    <!-- Formulaire -->
    <form action="testmap" method="POST">
        <h2>Ajouter des paramètres</h2>
        
        <!-- Champs fixes -->
        <div>
            <label for="nom">Nom:</label>
            <input type="text" id="nom" name="nom">
        </div>
        
        <div>
            <label for="age">Âge:</label>
            <input type="text" id="age" name="age">
        </div>
        
        <div>
            <label for="email">Email:</label>
            <input type="text" id="email" name="email">
        </div>
        
        <div>
            <label for="salaire">Salaire:</label>
            <input type="text" id="salaire" name="salaire">
        </div>
        
        <!-- Champs dynamiques (vous pouvez en ajouter plus dans le navigateur) -->
        <div>
            <label for="valeur1">Valeur supplémentaire 1:</label>
            <input type="text" id="valeur1" name="valeur1">
        </div>
        
        <div>
            <label for="valeur2">Valeur supplémentaire 2:</label>
            <input type="text" id="valeur2" name="valeur2">
        </div>
        
        <br>
        <button type="submit">Soumettre</button>
    </form>
    
    <!-- Affichage des résultats -->
    <% 
        Map<String, Object> map = (Map<String, Object>) request.getAttribute("map");
        if (map != null && !map.isEmpty()) {
    %>
        <h2>Résultats reçus</h2>
        <table border="1">
            <tr>
                <th>Clé</th>
                <th>Valeur</th>
                <th>Type</th>
            </tr>
            <% 
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    String type = value != null ? value.getClass().getSimpleName() : "null";
                    String displayValue = value != null ? value.toString() : "null";
            %>
                <tr>
                    <td><%= key %></td>
                    <td><%= displayValue %></td>
                    <td><%= type %></td>
                </tr>
            <% 
                }
            %>
        </table>
        
        <h3>Résumé</h3>
        <p>Nombre total de paramètres: <%= map.size() %></p>
        
        <!-- Affichage formaté -->
        <h3>Valeurs formatées</h3>
        <ul>
        <% 
            for (Map.Entry<String, Object> entry : map.entrySet()) {
        %>
            <li><strong><%= entry.getKey() %>:</strong> <%= entry.getValue() %></li>
        <% 
            }
        %>
        </ul>
    <% 
        } else if (request.getMethod().equals("POST")) {
    %>
        <p>Aucune donnée reçue ou la map est vide.</p>
    <% 
        }
    %>
    
    <hr>
    <h3>Instructions:</h3>
    <ul>
        <li>Remplissez quelques champs du formulaire</li>
        <li>Les champs vides ne seront pas ajoutés à la map</li>
        <li>Le serveur tentera de convertir les nombres automatiquement</li>
        <li>Vous pouvez ajouter plus de paramètres en modifiant le formulaire HTML</li>
    </ul>
</body>
</html>