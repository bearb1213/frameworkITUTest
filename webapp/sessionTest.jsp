<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test de Session</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
        
        .header {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 32px;
        }
        
        .subtitle {
            color: #666;
            font-size: 14px;
        }
        
        .status-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .status-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .stat-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        
        .stat-value {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .user-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .user-info h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 18px;
        }
        
        .user-detail {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background: white;
            margin-bottom: 8px;
            border-radius: 5px;
        }
        
        .user-detail:last-child {
            margin-bottom: 0;
        }
        
        .label {
            font-weight: 600;
            color: #666;
        }
        
        .value {
            color: #333;
        }
        
        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }
        
        .status-logged-in {
            background: #d4edda;
            color: #155724;
        }
        
        .status-logged-out {
            background: #f8d7da;
            color: #721c24;
        }
        
        .message {
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-weight: 500;
            text-align: center;
        }
        
        .message-success {
            background: #d4edda;
            color: #155724;
            border: 2px solid #c3e6cb;
        }
        
        .actions-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .actions-card h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 20px;
        }
        
        .form-section {
            margin-bottom: 25px;
            padding-bottom: 25px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .form-section h3 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 16px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        
        input[type="text"]:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #f5576c 0%, #f093fb 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }
        
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 87, 108, 0.4);
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
            box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
        }
        
        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.4);
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .session-data {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .session-data h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 20px;
        }
        
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .data-table th {
            background: #f8f9fa;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            color: #666;
            border-bottom: 2px solid #e0e0e0;
        }
        
        .data-table td {
            padding: 12px;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .data-table tr:last-child td {
            border-bottom: none;
        }
        
        .data-table tr:hover {
            background: #f8f9fa;
        }
        
        .key-cell {
            font-weight: 600;
            color: #667eea;
        }
        
        .back-link {
            display: block;
            text-align: center;
            color: white;
            text-decoration: none;
            font-weight: 600;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            transition: all 0.3s;
        }
        
        .back-link:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .container > * {
            animation: fadeIn 0.5s ease;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔐 Test de Session</h1>
            <p class="subtitle">Démonstration de l'utilisation de l'objet Session en tant que paramètre de contrôleur</p>
        </div>
        
        <% String message = (String) request.getAttribute("message");
           if (message != null) { %>
        <div class="message message-success">
            ✅ <%= message %>
        </div>
        <% } %>
        
        <div class="status-card">
            <div class="status-grid">
                <div class="stat-box">
                    <div class="stat-value"><%= request.getAttribute("visitCount") != null ? request.getAttribute("visitCount") : 0 %></div>
                    <div class="stat-label">Visites</div>
                </div>
                <div class="stat-box">
                    <div class="stat-value">
                        <% Boolean isLoggedIn = (Boolean) request.getAttribute("isLoggedIn");
                           if (isLoggedIn != null && isLoggedIn) { %>
                            ✓
                        <% } else { %>
                            ✗
                        <% } %>
                    </div>
                    <div class="stat-label">Connecté</div>
                </div>
            </div>
            
            <div class="user-info">
                <h3>📊 Informations de Session</h3>
                <div class="user-detail">
                    <span class="label">Statut:</span>
                    <span class="value">
                        <% if (isLoggedIn != null && isLoggedIn) { %>
                            <span class="status-badge status-logged-in">Connecté</span>
                        <% } else { %>
                            <span class="status-badge status-logged-out">Non connecté</span>
                        <% } %>
                    </span>
                </div>
                <% String username = (String) request.getAttribute("username");
                   if (username != null) { %>
                <div class="user-detail">
                    <span class="label">Utilisateur:</span>
                    <span class="value"><%= username %></span>
                </div>
                <% } %>
                <div class="user-detail">
                    <span class="label">Nombre de visites:</span>
                    <span class="value"><%= request.getAttribute("visitCount") != null ? request.getAttribute("visitCount") : 0 %></span>
                </div>
            </div>
        </div>
        
        <div class="actions-card">
            <h2>🎮 Actions</h2>
            
            <% if (isLoggedIn == null || !isLoggedIn) { %>
            <div class="form-section">
                <h3>Connexion</h3>
                <form action="/frame/session/login" method="post">
                    <div class="form-group">
                        <label for="username">Nom d'utilisateur:</label>
                        <input type="text" id="username" name="username" placeholder="Entrez votre nom" required>
                    </div>
                    <button type="submit" class="btn btn-primary">🔓 Se connecter</button>
                </form>
            </div>
            <% } else { %>
            <div class="form-section">
                <h3>Déconnexion</h3>
                <div class="button-group">
                    <a href="/frame/session/logout" class="btn btn-danger">🔒 Se déconnecter</a>
                </div>
            </div>
            <% } %>
            
            <div class="form-section">
                <h3>Ajouter des données à la session</h3>
                <form action="/frame/session/addData" method="post">
                    <div class="form-group">
                        <label for="key">Clé:</label>
                        <input type="text" id="key" name="key" placeholder="Nom de la donnée" required>
                    </div>
                    <div class="form-group">
                        <label for="value">Valeur:</label>
                        <input type="text" id="value" name="value" placeholder="Valeur de la donnée" required>
                    </div>
                    <button type="submit" class="btn btn-primary">➕ Ajouter</button>
                </form>
            </div>
            
            <div class="form-section">
                <h3>Actions diverses</h3>
                <div class="button-group">
                    <a href="/frame/session/test" class="btn btn-secondary">🔄 Rafraîchir</a>
                    <a href="/frame/session/clear" class="btn btn-danger">🗑️ Effacer la session</a>
                </div>
            </div>
        </div>
        
        <% Map<String, Object> sessionData = (Map<String, Object>) request.getAttribute("sessionData");
           if (sessionData != null && !sessionData.isEmpty()) { %>
        <div class="session-data">
            <h2>💾 Contenu de la Session</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Clé</th>
                        <th>Valeur</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Map.Entry<String, Object> entry : sessionData.entrySet()) { %>
                    <tr>
                        <td class="key-cell"><%= entry.getKey() %></td>
                        <td><%= entry.getValue() != null ? entry.getValue().toString() : "null" %></td>
                        <td><%= entry.getValue() != null ? entry.getValue().getClass().getSimpleName() : "null" %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } %>
        
        <a href="index.html" class="back-link">← Retour à l'accueil</a>
    </div>
</body>
</html>
