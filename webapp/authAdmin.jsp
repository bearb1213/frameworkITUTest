<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page Administrateur</title>
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
            color: #dc3545;
            border-bottom: 2px solid #dc3545;
            padding-bottom: 10px;
        }
        .badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 10px;
            margin-right: 5px;
        }
        .badge-authorized {
            background-color: #ffc107;
            color: #000;
        }
        .badge-role {
            background-color: #dc3545;
            color: white;
        }
        .user-info {
            background-color: #f8d7da;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #f5c6cb;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }
        .admin-features {
            background-color: #e2e3e5;
            padding: 20px;
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
        <div>
            <span class="badge badge-authorized">@Authorized</span>
            <span class="badge badge-role">@Role("admin")</span>
        </div>
        <h1>Espace Administrateur</h1>
        
        <div class="success-message">
            <%= request.getAttribute("message") %>
        </div>
        
        <div class="user-info">
            <strong>Informations de l'administrateur :</strong><br>
            Nom d'utilisateur : <%= request.getAttribute("currentUser") %><br>
            Rôle : <%= request.getAttribute("currentRole") %>
        </div>
        
        <p>Cette page est protégée par les annotations <code>@Authorized</code> et <code>@Role("admin")</code>.</p>
        <p>Seuls les utilisateurs connectés avec le rôle <strong>admin</strong> peuvent y accéder.</p>
        
        <div class="admin-features">
            <h3>Fonctionnalités administrateur :</h3>
            <ul>
                <li>Gestion des utilisateurs</li>
                <li>Configuration du système</li>
                <li>Accès aux logs</li>
                <li>Gestion des permissions</li>
            </ul>
        </div>
        
        <div class="links">
            <a href="login">← Retour à la connexion</a>
            <a href="protected">Page protégée</a>
            <a href="user">Page User</a>
            <a href="moderator">Page Moderator</a>
            <a href="logout">Se déconnecter</a>
        </div>
    </div>
</body>
</html>
