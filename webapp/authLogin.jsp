<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Authentification - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }
        .current-session {
            background-color: #fff3cd;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border: 1px solid #ffeaa7;
        }
        .links {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
        .links a {
            display: inline-block;
            margin-right: 15px;
            color: #007bff;
            text-decoration: none;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Page de Connexion - Test @Authorized et @Role</h1>
        
        <% if (request.getAttribute("message") != null) { %>
            <div class="message success">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
        
        <% if (request.getAttribute("currentUser") != null) { %>
            <div class="current-session">
                <strong>Session active :</strong><br>
                Utilisateur : <%= request.getAttribute("currentUser") %><br>
                Rôle : <%= request.getAttribute("currentRole") %>
                <br><br>
                <a href="logout" style="color: #dc3545;">Se déconnecter</a>
            </div>
        <% } else { %>
            <div class="message info">
                Vous n'êtes pas connecté. Veuillez vous connecter pour accéder aux pages protégées.
            </div>
        <% } %>
        
        <form method="POST" action="login">
            <div class="form-group">
                <label for="username">Nom d'utilisateur :</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Entrez votre nom d'utilisateur">
            </div>
            
            <div class="form-group">
                <label for="role">Rôle :</label>
                <select id="role" name="role" required>
                    <option value="">-- Sélectionnez un rôle --</option>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                    <option value="moderator">Moderator</option>
                    <option value="guest">Guest (pas de permissions)</option>
                </select>
            </div>
            
            <button type="submit">Se connecter</button>
        </form>
        
        <div class="links">
            <h3>Pages de test :</h3>
            <a href="public">Page publique (sans auth)</a> |
            <a href="protected">Page protégée (@Authorized)</a> |
            <a href="admin">Page Admin (@Role("admin"))</a> |
            <a href="user">Page User (@Role("user"))</a> |
            <a href="moderator">Page Moderator (@Role("moderator"))</a> |
            <a href="test">Page de test globale</a>
        </div>
    </div>
</body>
</html>
