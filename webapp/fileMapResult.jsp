<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Upload Map</title>
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
            max-width: 700px;
            width: 100%;
        }
        
        .success-icon, .error-icon {
            text-align: center;
            font-size: 64px;
            margin-bottom: 20px;
        }
        
        .success-icon {
            color: #4caf50;
        }
        
        .error-icon {
            color: #f44336;
        }
        
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
        }
        
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .stat-value {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-label {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .files-section {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
        }
        
        .section-title {
            color: #333;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        
        .section-title::before {
            content: "📁";
            margin-right: 10px;
            font-size: 24px;
        }
        
        .file-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }
        
        .file-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        
        .file-card:last-child {
            margin-bottom: 0;
        }
        
        .file-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .file-field {
            font-weight: 700;
            color: #667eea;
            font-size: 16px;
        }
        
        .file-size {
            background: #e3f2fd;
            color: #1976d2;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }
        
        .file-info {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
        }
        
        .file-preview {
            margin-top: 12px;
            padding: 12px;
            background: #f5f5f5;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 12px;
            color: #555;
            word-break: break-all;
        }
        
        .error-message {
            background: #ffebee;
            border-left: 4px solid #f44336;
            padding: 20px;
            border-radius: 10px;
            color: #c62828;
            margin-bottom: 20px;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #f5f5f5;
            color: #333;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .summary-box {
            background: #fff3e0;
            border-left: 4px solid #ff9800;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .summary-box p {
            color: #e65100;
            font-size: 14px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <% Boolean success = (Boolean) request.getAttribute("success");
           if (success != null && success) { %>
            <div class="success-icon">✅</div>
            <h1>Upload réussi !</h1>
            <p class="subtitle">Vos fichiers ont été traités avec succès</p>
            
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-value"><%= request.getAttribute("count") %></div>
                    <div class="stat-label">Fichiers uploadés</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value">
                        <%= String.format("%.2f", ((Long)request.getAttribute("totalSize")) / 1024.0) %>
                    </div>
                    <div class="stat-label">KB Total</div>
                </div>
            </div>
            
            <div class="summary-box">
                <p><strong>Type de paramètre:</strong> Map&lt;String, byte[]&gt;</p>
                <p><strong>Nombre d'entrées:</strong> <%= request.getAttribute("count") %></p>
                <p><strong>Taille totale:</strong> <%= request.getAttribute("totalSize") %> bytes</p>
            </div>
            
            <div class="files-section">
                <div class="section-title">Détails des fichiers</div>
                
                <% Map<String, byte[]> files = (Map<String, byte[]>) request.getAttribute("files");
                   if (files != null) {
                       for (Map.Entry<String, byte[]> entry : files.entrySet()) { %>
                        <div class="file-card">
                            <div class="file-header">
                                <span class="file-field">🔑 <%= entry.getKey() %></span>
                                <span class="file-size"><%= entry.getValue().length %> bytes</span>
                            </div>
                            <div class="file-info">
                                📊 Taille: <%= String.format("%.2f KB", entry.getValue().length / 1024.0) %>
                            </div>
                            <div class="file-preview">
                                Premiers bytes (hex): <%= getHexPreview(entry.getValue()) %>
                            </div>
                        </div>
                   <% }
                   } %>
            </div>
            
        <% } else { %>
            <div class="error-icon">❌</div>
            <h1>Erreur</h1>
            <p class="subtitle">Une erreur s'est produite lors de l'upload</p>
            
            <div class="error-message">
                <strong>Message d'erreur:</strong><br>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <div class="action-buttons">
            <a href="filemap" class="btn btn-primary">📤 Nouvel upload</a>
            <a href="index.html" class="btn btn-secondary">🏠 Accueil</a>
        </div>
    </div>
    
    <%!
        private String getHexPreview(byte[] bytes) {
            if (bytes == null || bytes.length == 0) return "N/A";
            StringBuilder sb = new StringBuilder();
            int limit = Math.min(bytes.length, 16);
            for (int i = 0; i < limit; i++) {
                sb.append(String.format("%02X ", bytes[i]));
            }
            if (bytes.length > 16) {
                sb.append("...");
            }
            return sb.toString();
        }
    %>
</body>
</html>
