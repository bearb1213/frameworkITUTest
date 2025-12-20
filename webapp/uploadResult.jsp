<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Upload</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
            max-width: 600px;
            width: 100%;
        }
        
        .success-icon, .error-icon {
            text-align: center;
            font-size: 64px;
            margin-bottom: 20px;
        }
        
        .success-icon {
            color: #28a745;
        }
        
        .error-icon {
            color: #dc3545;
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        
        .info-grid {
            display: grid;
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .info-item {
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
            border-left: 4px solid #667eea;
        }
        
        .info-item.success {
            border-left-color: #28a745;
            background: #d4edda;
        }
        
        .info-item.error {
            border-left-color: #dc3545;
            background: #f8d7da;
        }
        
        .info-label {
            font-weight: 600;
            color: #666;
            font-size: 12px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        
        .info-value {
            color: #333;
            font-size: 16px;
            word-break: break-all;
        }
        
        .description-box {
            padding: 15px;
            background: #fff3cd;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .description-box .info-label {
            color: #856404;
        }
        
        .description-box .info-value {
            color: #856404;
            white-space: pre-wrap;
        }
        
        .btn-container {
            display: flex;
            gap: 15px;
        }
        
        .btn {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
        
        .error-message {
            text-align: center;
            color: #dc3545;
            font-size: 18px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <% Boolean success = (Boolean) request.getAttribute("success"); %>
        <% if (success != null && success) { %>
            <div class="success-icon">✅</div>
            <h1>Fichier uploadé avec succès!</h1>
            
            <div class="info-grid">
                <div class="info-item success">
                    <div class="info-label">Nom du fichier</div>
                    <div class="info-value"><%= request.getAttribute("fileName") %></div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">Taille</div>
                    <div class="info-value"><%= request.getAttribute("fileSize") %> octets</div>
                </div>
                
                <div class="info-item">
                    <div class="info-label">Chemin complet</div>
                    <div class="info-value"><%= request.getAttribute("filePath") %></div>
                </div>
            </div>
            
            <% if (request.getAttribute("description") != null && !request.getAttribute("description").toString().isEmpty()) { %>
            <div class="description-box">
                <div class="info-label">📝 Description</div>
                <div class="info-value"><%= request.getAttribute("description") %></div>
            </div>
            <% } %>
            
        <% } else { %>
            <div class="error-icon">❌</div>
            <h1>Erreur d'upload</h1>
            <p class="error-message">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "Une erreur inconnue est survenue" %>
            </p>
        <% } %>
        
        <div class="btn-container">
            <a href="upload" class="btn btn-primary">Uploader un autre fichier</a>
            <a href="/" class="btn btn-secondary">Retour à l'accueil</a>
        </div>
    </div>
</body>
</html>
