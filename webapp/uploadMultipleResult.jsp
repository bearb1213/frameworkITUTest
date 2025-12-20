<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Upload Multiple</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
            max-width: 800px;
            width: 100%;
            max-height: 90vh;
            overflow-y: auto;
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
        
        .summary-box {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .summary-item {
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
            text-align: center;
        }
        
        .summary-label {
            font-size: 12px;
            opacity: 0.9;
            margin-bottom: 5px;
        }
        
        .summary-value {
            font-size: 28px;
            font-weight: 700;
        }
        
        .description-box {
            padding: 15px;
            background: #fff3cd;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .description-box .label {
            font-weight: 600;
            color: #856404;
            font-size: 12px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        
        .description-box .value {
            color: #856404;
            white-space: pre-wrap;
        }
        
        .files-section {
            margin-bottom: 30px;
        }
        
        .section-title {
            color: #333;
            font-size: 18px;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f093fb;
        }
        
        .file-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 10px;
            border-left: 4px solid #28a745;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .file-card:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .file-header {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .file-icon {
            font-size: 24px;
            margin-right: 10px;
        }
        
        .file-name {
            font-weight: 600;
            color: #333;
            font-size: 16px;
            flex: 1;
            word-break: break-all;
        }
        
        .file-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 10px;
            margin-top: 10px;
        }
        
        .detail-item {
            padding: 8px;
            background: white;
            border-radius: 5px;
        }
        
        .detail-label {
            font-size: 11px;
            color: #666;
            text-transform: uppercase;
            margin-bottom: 3px;
        }
        
        .detail-value {
            font-size: 13px;
            color: #333;
            word-break: break-all;
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
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
            padding: 20px;
            background: #f8d7da;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <% Boolean success = (Boolean) request.getAttribute("success"); %>
        <% if (success != null && success) { %>
            <div class="success-icon">✅</div>
            <h1>Fichiers uploadés avec succès!</h1>
            
            <div class="summary-box">
                <div class="summary-item">
                    <div class="summary-label">Nombre de fichiers</div>
                    <div class="summary-value"><%= request.getAttribute("count") %></div>
                </div>
                <div class="summary-item">
                    <div class="summary-label">Taille totale</div>
                    <div class="summary-value"><%= String.format("%.2f", ((Long)request.getAttribute("totalSize")) / 1024.0 / 1024.0) %> MB</div>
                </div>
            </div>
            
            <% if (request.getAttribute("description") != null && !request.getAttribute("description").toString().isEmpty()) { %>
            <div class="description-box">
                <div class="label">📝 Description</div>
                <div class="value"><%= request.getAttribute("description") %></div>
            </div>
            <% } %>
            
            <div class="files-section">
                <h2 class="section-title">📂 Fichiers uploadés</h2>
                
                <% 
                File[] fichiers = (File[]) request.getAttribute("fichiers");
                if (fichiers != null) {
                    int index = 1;
                    for (File fichier : fichiers) {
                        if (fichier != null && fichier.exists()) {
                            double sizeKB = fichier.length() / 1024.0;
                %>
                <div class="file-card">
                    <div class="file-header">
                        <span class="file-icon">📄</span>
                        <span class="file-name"><%= index %>. <%= fichier.getName() %></span>
                    </div>
                    <div class="file-details">
                        <div class="detail-item">
                            <div class="detail-label">Taille</div>
                            <div class="detail-value"><%= String.format("%.2f KB", sizeKB) %></div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-label">Chemin</div>
                            <div class="detail-value"><%= fichier.getAbsolutePath() %></div>
                        </div>
                    </div>
                </div>
                <% 
                            index++;
                        }
                    }
                }
                %>
            </div>
            
        <% } else { %>
            <div class="error-icon">❌</div>
            <h1>Erreur d'upload</h1>
            <div class="error-message">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "Une erreur inconnue est survenue" %>
            </div>
        <% } %>
        
        <div class="btn-container">
            <a href="uploadMultiple" class="btn btn-primary">Uploader d'autres fichiers</a>
            <a href="upload" class="btn btn-secondary">Upload simple</a>
            <a href="/" class="btn btn-secondary">Accueil</a>
        </div>
    </div>
</body>
</html>
