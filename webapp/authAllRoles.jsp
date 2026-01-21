<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page Tous les Rôles</title>
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
            color: #fd7e14;
            border-bottom: 2px solid #fd7e14;
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
            background-color: #fd7e14;
            color: white;
        }
        .user-info {
            background-color: #ffe5d0;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #ffd1a8;
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
            background-color: #fff5eb;
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
        .role-admin {
            background-color: #dc3545;
            color: white;
        }
        .role-user {
            background-color: #007bff;
            color: white;
        }
        .role-moderator {
            background-color: #6f42c1;
            color: white;
        }
        .welcome-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: center;
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
            <span class="badge badge-roles">@Role("admin,user,moderator")</span>
        </div>
        <h1>Page Accessible à Tous les Rôles</h1>
        
        <div class="success-message">
            <%= request.getAttribute("message") %>
        </div>
        
        <div class="welcome-box">
            <h2 style="margin-top: 0;">Bienvenue dans l'espace commun !</h2>
            <p>Cette page est accessible à tous les utilisateurs authentifiés avec un rôle valide.</p>
        </div>
        
        <div class="user-info">
            <strong>Informations de l'utilisateur :</strong><br>
            Nom d'utilisateur : <%= request.getAttribute("currentUser") %><br>
            Rôle : <%= request.getAttribute("currentRole") %>
        </div>
        
        <div class="roles-info">
            <h3>Rôles autorisés :</h3>
            <span class="role-tag role-admin">ADMIN</span>
            <span class="role-tag role-user">USER</span>
            <span class="role-tag role-moderator">MODERATOR</span>
            
            <p style="margin-top: 15px;">
                Cette page est protégée par l'annotation <code>@Role("admin,user,moderator")</code>.<br>
                Elle est accessible aux utilisateurs ayant l'un des rôles suivants :
            </p>
            <ul>
                <li><strong>admin</strong> - Administrateurs du système</li>
                <li><strong>user</strong> - Utilisateurs standard</li>
                <li><strong>moderator</strong> - Modérateurs de contenu</li>
            </ul>
            <p>
                Seuls les utilisateurs avec le rôle <strong>guest</strong> ou sans rôle 
                ne peuvent PAS accéder à cette page.
            </p>
        </div>
        
        <h3>Fonctionnalités communes à tous :</h3>
        <ul>
            <li>Accès au tableau de bord général</li>
            <li>Consultation des annonces</li>
            <li>Participation aux événements</li>
            <li>Accès aux ressources partagées</li>
            <li>Support et assistance</li>
        </ul>
        
        <div class="links">
            <a href="login">← Retour à la connexion</a>
            <a href="test">Page de test</a>
            <a href="adminOrUser">Admin/User</a>
            <a href="logout">Se déconnecter</a>
        </div>
    </div>
</body>
</html>
