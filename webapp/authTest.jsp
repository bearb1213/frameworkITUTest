<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Page de Test - @Authorized et @Role</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1000px;
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
        h2 {
            color: #555;
            margin-top: 30px;
        }
        .current-session {
            background-color: #fff3cd;
            padding: 20px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #ffeaa7;
        }
        .status-box {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 4px;
            font-weight: bold;
            margin-left: 10px;
        }
        .status-connected {
            background-color: #28a745;
            color: white;
        }
        .status-disconnected {
            background-color: #dc3545;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        table tr:hover {
            background-color: #f5f5f5;
        }
        .badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 11px;
            font-weight: bold;
            margin-right: 5px;
        }
        .badge-public {
            background-color: #28a745;
            color: white;
        }
        .badge-authorized {
            background-color: #ffc107;
            color: #000;
        }
        .badge-role {
            background-color: #dc3545;
            color: white;
        }
        .test-link {
            color: #007bff;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #007bff;
            border-radius: 4px;
            display: inline-block;
            margin: 2px;
        }
        .test-link:hover {
            background-color: #007bff;
            color: white;
        }
        .info-box {
            background-color: #d1ecf1;
            color: #0c5460;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            border: 1px solid #bee5eb;
        }
        .login-shortcut {
            background-color: #e2e3e5;
            padding: 20px;
            border-radius: 4px;
            margin: 20px 0;
        }
        .quick-login {
            display: inline-block;
            margin: 5px;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .quick-login:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Page de Test Complète - @Authorized et @Role</h1>
        
        <div class="current-session">
            <h2 style="margin-top: 0;">État de la Session
                <% if (request.getAttribute("isAuthenticated") != null && (Boolean)request.getAttribute("isAuthenticated")) { %>
                    <span class="status-box status-connected">CONNECTÉ</span>
                <% } else { %>
                    <span class="status-box status-disconnected">DÉCONNECTÉ</span>
                <% } %>
            </h2>
            
            <% if (request.getAttribute("isAuthenticated") != null && (Boolean)request.getAttribute("isAuthenticated")) { %>
                <strong>Utilisateur :</strong> <%= request.getAttribute("currentUser") %><br>
                <strong>Rôle :</strong> <%= request.getAttribute("currentRole") %><br><br>
                <a href="logout" style="color: #dc3545; font-weight: bold;">Se déconnecter</a>
            <% } else { %>
                <p>Vous n'êtes pas connecté. <a href="login" style="color: #007bff; font-weight: bold;">Se connecter</a></p>
            <% } %>
        </div>
        
        <div class="info-box">
            <strong>Information :</strong> Cette page récapitule toutes les fonctionnalités de test pour les annotations @Authorized et @Role.
            Utilisez le tableau ci-dessous pour tester différentes pages avec différents rôles.
        </div>
        
        <h2>Pages Disponibles</h2>
        
        <h3>Pages avec rôle unique</h3>
        <table>
            <thead>
                <tr>
                    <th>Page</th>
                    <th>Annotations</th>
                    <th>Accès Requis</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Page de connexion</td>
                    <td><span class="badge badge-public">PUBLIC</span></td>
                    <td>Aucun</td>
                    <td><a href="login" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Page publique</td>
                    <td><span class="badge badge-public">PUBLIC</span></td>
                    <td>Aucun</td>
                    <td><a href="public" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Page protégée</td>
                    <td><span class="badge badge-authorized">@Authorized</span></td>
                    <td>Utilisateur authentifié (n'importe quel rôle)</td>
                    <td><a href="protected" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Espace Administrateur</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("admin")</span>
                    </td>
                    <td>Utilisateur avec rôle <strong>admin</strong></td>
                    <td><a href="admin" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Espace Utilisateur</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("user")</span>
                    </td>
                    <td>Utilisateur avec rôle <strong>user</strong></td>
                    <td><a href="user" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Espace Modérateur</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("moderator")</span>
                    </td>
                    <td>Utilisateur avec rôle <strong>moderator</strong></td>
                    <td><a href="moderator" class="test-link">Accéder</a></td>
                </tr>
            </tbody>
        </table>
        
        <h3>Pages avec plusieurs rôles autorisés</h3>
        <table>
            <thead>
                <tr>
                    <th>Page</th>
                    <th>Annotations</th>
                    <th>Accès Requis</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Admin OU User</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("admin,user")</span>
                    </td>
                    <td>Rôle <strong>admin</strong> OU <strong>user</strong></td>
                    <td><a href="adminOrUser" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Admin OU Moderator</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("admin,moderator")</span>
                    </td>
                    <td>Rôle <strong>admin</strong> OU <strong>moderator</strong></td>
                    <td><a href="adminOrModerator" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>User OU Moderator</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("user,moderator")</span>
                    </td>
                    <td>Rôle <strong>user</strong> OU <strong>moderator</strong></td>
                    <td><a href="userOrModerator" class="test-link">Accéder</a></td>
                </tr>
                <tr>
                    <td>Tous les rôles</td>
                    <td>
                        <span class="badge badge-authorized">@Authorized</span>
                        <span class="badge badge-role">@Role("admin,user,moderator")</span>
                    </td>
                    <td>Rôle <strong>admin</strong> OU <strong>user</strong> OU <strong>moderator</strong></td>
                    <td><a href="allRoles" class="test-link">Accéder</a></td>
                </tr>
            </tbody>
        </table>
        
        <div class="login-shortcut">
            <h3>Connexion Rapide (pour tests) :</h3>
            <p>Cliquez sur un rôle pour vous connecter rapidement :</p>
            <form method="POST" action="login" style="display: inline;">
                <input type="hidden" name="username" value="admin_user">
                <input type="hidden" name="role" value="admin">
                <button type="submit" class="quick-login">Se connecter comme Admin</button>
            </form>
            
            <form method="POST" action="login" style="display: inline;">
                <input type="hidden" name="username" value="normal_user">
                <input type="hidden" name="role" value="user">
                <button type="submit" class="quick-login">Se connecter comme User</button>
            </form>
            
            <form method="POST" action="login" style="display: inline;">
                <input type="hidden" name="username" value="mod_user">
                <input type="hidden" name="role" value="moderator">
                <button type="submit" class="quick-login">Se connecter comme Moderator</button>
            </form>
            
            <form method="POST" action="login" style="display: inline;">
                <input type="hidden" name="username" value="guest_user">
                <input type="hidden" name="role" value="guest">
                <button type="submit" class="quick-login" style="background-color: #6c757d;">Se connecter comme Guest</button>
            </form>
        </div>
        
        <h2>Scénarios de Test</h2>
        <div class="info-box">
            <h4>Scénario 1 : Test de @Authorized</h4>
            <ol>
                <li>Accédez à la <a href="protected">page protégée</a> sans être connecté → devrait refuser l'accès</li>
                <li>Connectez-vous avec n'importe quel rôle</li>
                <li>Accédez à nouveau à la <a href="protected">page protégée</a> → devrait fonctionner</li>
            </ol>
            
            <h4>Scénario 2 : Test de @Role (un seul rôle)</h4>
            <ol>
                <li>Connectez-vous avec le rôle "user"</li>
                <li>Essayez d'accéder à la <a href="admin">page admin</a> → devrait refuser l'accès</li>
                <li>Déconnectez-vous et reconnectez-vous avec le rôle "admin"</li>
                <li>Accédez à la <a href="admin">page admin</a> → devrait fonctionner</li>
            </ol>
            
            <h4>Scénario 3 : Test de @Role (plusieurs rôles)</h4>
            <ol>
                <li>Connectez-vous avec le rôle "user"</li>
                <li>Accédez à la <a href="adminOrUser">page admin,user</a> → devrait fonctionner</li>
                <li>Essayez la <a href="adminOrModerator">page admin,moderator</a> → devrait refuser l'accès</li>
                <li>Déconnectez-vous et reconnectez-vous avec le rôle "moderator"</li>
                <li>Accédez à la <a href="adminOrModerator">page admin,moderator</a> → devrait fonctionner</li>
            </ol>
            
            <h4>Scénario 4 : Test des différents rôles</h4>
            <ol>
                <li>Testez chaque rôle (admin, user, moderator, guest)</li>
                <li>Pour chaque rôle, essayez d'accéder à toutes les pages</li>
                <li>Vérifiez que seules les pages correspondantes sont accessibles</li>
            </ol>
            
            <h4>Scénario 5 : Test de "tous les rôles"</h4>
            <ol>
                <li>Testez la <a href="allRoles">page tous les rôles</a> avec admin → devrait fonctionner</li>
                <li>Testez avec user → devrait fonctionner</li>
                <li>Testez avec moderator → devrait fonctionner</li>
                <li>Testez avec guest → devrait refuser l'accès</li>
            </ol>
        </div>
    </div>
</body>
</html>
