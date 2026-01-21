<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page Protégée</title>
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
            color: #ffc107;
            border-bottom: 2px solid #ffc107;
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
        .badge-protected {
            background-color: #ffc107;
            color: #000;
        }
        .user-info {
            background-color: #fff3cd;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #ffeaa7;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
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
        <span class="badge badge-protected">@Authorized - Authentification requise</span>
        <h1>Page Protégée</h1>
        
        <div class="success-message">
            <%= request.getAttribute("message") %>
        </div>
        
        <div class="user-info">
            <strong>Informations de l'utilisateur connecté :</strong><br>
            Nom d'utilisateur : <%= request.getAttribute("currentUser") %><br>
            Rôle : <%= request.getAttribute("currentRole") %>
        </div>
        
        <p>Cette page est protégée par l'annotation <code>@Authorized</code>. Seuls les utilisateurs authentifiés peuvent y accéder.</p>
        
        <div class="links">
            <a href="login">← Retour à la connexion</a>
            <a href="public">Page publique</a>
            <a href="admin">Essayer page Admin →</a>
            <a href="logout">Se déconnecter</a>
        </div>
    </div>
</body>
</html>
