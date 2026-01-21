<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page User ou Moderator</title>
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
            color: #20c997;
            border-bottom: 2px solid #20c997;
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
        .badge-roles {
            background-color: #20c997;
            color: white;
        }
        .user-info {
            background-color: #d1f4ea;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #b3e8d6;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }
        .roles-info {
            background-color: #e8fcf5;
            padding: 20px;
            border-radius: 4px;
            margin: 20px 0;
        }
        .role-tag {
            display: inline-block;
            padding: 5px 12px;
            margin: 5px;
            border-radius: 20px;
            font-weight: bold;
        }
        .role-user {
            background-color: #007bff;
            color: white;
        }
        .role-moderator {
            background-color: #6f42c1;
            color: white;
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
        code {
            background-color: #f8f9fa;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: monospace;
        }
    </style>
</head>
<body>
    <div class="container">
        <div>
            <span class="badge badge-authorized">@Authorized</span>
            <span class="badge badge-roles">@Role("user,moderator")</span>
        </div>
        <h1>Page User OU Moderator</h1>
        
        <div class="success-message">
            <%= request.getAttribute("message") %>
        </div>
        
        <div class="user-info">
            <strong>Informations de l'utilisateur :</strong><br>
            Nom d'utilisateur : <%= request.getAttribute("currentUser") %><br>
            Rôle : <%= request.getAttribute("currentRole") %>
        </div>
        
        <div class="roles-info">
            <h3>Rôles autorisés :</h3>
            <span class="role-tag role-user">USER</span>
            <span class="role-tag role-moderator">MODERATOR</span>
            
            <p style="margin-top: 15px;">
                Cette page est protégée par l'annotation <code>@Role("user,moderator")</code>.<br>
                Elle est accessible aux utilisateurs ayant l'un des rôles suivants :
            </p>
            <ul>
                <li><strong>user</strong> - Utilisateurs standard</li>
                <li><strong>moderator</strong> - Modérateurs de contenu</li>
            </ul>
            <p>
                Les utilisateurs avec le rôle <strong>admin</strong> ou <strong>guest</strong> 
                ne peuvent PAS accéder à cette page (sauf si admin a aussi user ou moderator).
            </p>
        </div>
        
        <h3>Fonctionnalités collaboratives :</h3>
        <ul>
            <li>Création de contenu</li>
            <li>Participation aux discussions</li>
            <li>Signalement de problèmes</li>
            <li>Support communautaire</li>
        </ul>
        
        <div class="links">
            <a href="login">← Retour à la connexion</a>
            <a href="test">Page de test</a>
            <a href="allRoles">Tous les rôles →</a>
            <a href="logout">Se déconnecter</a>
        </div>
    </div>
</body>
</html>
