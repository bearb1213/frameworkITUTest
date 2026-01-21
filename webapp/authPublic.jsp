<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page Publique</title>
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
            color: #28a745;
            border-bottom: 2px solid #28a745;
            padding-bottom: 10px;
        }
        .badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .badge-public {
            background-color: #28a745;
            color: white;
        }
        .user-info {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }
        .links a {
            display: inline-block;
            margin-right: 15px;
            color: #007bff;
            text-decoration: none;
            padding: 5px 10px;
        }
        .links a:hover {
            background-color: #e7f3ff;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <span class="badge badge-public">PUBLIC - Pas d'authentification requise</span>
        <h1>Page Publique</h1>
        
        <p><%= request.getAttribute("message") %></p>
        
        <div class="user-info">
            <% if (request.getAttribute("currentUser") != null) { %>
                <strong>Vous êtes connecté en tant que :</strong> <%= request.getAttribute("currentUser") %>
            <% } else { %>
                <strong>Vous n'êtes pas connecté</strong> - Cette page est accessible à tous
            <% } %>
        </div>
        
        <div class="links">
            <a href="login">← Retour à la connexion</a>
            <a href="protected">Essayer page protégée →</a>
            <a href="test">Page de test</a>
        </div>
    </div>
</body>
</html>
