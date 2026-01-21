<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page Admin ou User</title>
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
            color: #17a2b8;
            border-bottom: 2px solid #17a2b8;
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
            background-color: #17a2b8;
            color: white;
        }
        .user-info {
            background-color: #d1ecf1;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #bee5eb;
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
            background-color: #e7f9fc;
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
            <span class="badge badge-roles">@Role("admin,user")</span>
        </div>
        <h1>Page Admin OU User</h1>
        
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
            <span class="role-tag role-admin">ADMIN</span>
            <span class="role-tag role-user">USER</span>
            
            <p style="margin-top: 15px;">
                Cette page est protégée par l'annotation <code>@Role("admin,user")</code>.<br>
                Elle est accessible aux utilisateurs ayant l'un des rôles suivants :
            </p>
            <ul>
                <li><strong>admin</strong> - Administrateurs du système</li>
                <li><strong>user</strong> - Utilisateurs standard</li>
            </ul>
            <p>
                Les utilisateurs avec le rôle <strong>moderator</strong> ou <strong>guest</strong> 
                ne peuvent PAS accéder à cette page.
            </p>
        </div>
        
        <h3>Fonctionnalités communes :</h3>
        <ul>
            <li>Consultation du tableau de bord</li>
            <li>Gestion du profil personnel</li>
            <li>Accès aux ressources partagées</li>
        </ul>
        
        <div class="links">
            <a href="login">← Retour à la connexion</a>
            <a href="test">Page de test</a>
            <a href="adminOrModerator">Admin/Moderator →</a>
            <a href="logout">Se déconnecter</a>
        </div>
    </div>
</body>
</html>
