<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.frame.extension.FileExtension" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Upload FileExtension Map</title>
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
        }
        
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
            text-align: center;
        }
        
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        
        .success-message, .error-message {
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 600;
        }
        
        .success-message {
            background: #d4edda;
            color: #155724;
            border: 2px solid #c3e6cb;
        }
        
        .error-message {
            background: #f8d7da;
            color: #721c24;
            border: 2px solid #f5c6cb;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
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
        
        .files-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .files-table thead {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .files-table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
        }
        
        .files-table td {
            padding: 15px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 14px;
        }
        
        .files-table tr:last-child td {
            border-bottom: none;
        }
        
        .files-table tbody tr:hover {
            background: #f8f9fa;
        }
        
        .extension-badge {
            background: #f093fb;
            color: white;
            padding: 4px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }
        
        .file-size {
            color: #666;
            font-family: 'Courier New', monospace;
        }
        
        .buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 30px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 14px;
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
        
        .btn-secondary {
            background: #6c757d;
            color: white;
            box-shadow: 0 4px 15px rgba(108, 117, 125, 0.3);
        }
        
        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(108, 117, 125, 0.4);
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
        
        .container {
            animation: fadeIn 0.5s ease;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📦 Résultat Upload FileExtension Map</h1>
        <p class="subtitle">Map&lt;FileExtension, byte[]&gt;</p>
        
        <% 
        Boolean success = (Boolean) request.getAttribute("success");
        if (success != null && success) {
            Integer count = (Integer) request.getAttribute("count");
            Long totalSize = (Long) request.getAttribute("totalSize");
            Map<FileExtension, byte[]> files = (Map<FileExtension, byte[]>) request.getAttribute("files");
        %>
            <div class="success-message">
                ✅ Fichiers uploadés avec succès !
            </div>
            
            <div class="stats">
                <div class="stat-card">
                    <div class="stat-value"><%= count %></div>
                    <div class="stat-label">Fichiers uploadés</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value"><%= String.format("%.2f", totalSize / 1024.0) %></div>
                    <div class="stat-label">KB au total</div>
                </div>
            </div>
            
            <table class="files-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nom du fichier</th>
                        <th>Extension</th>
                        <th>Taille</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    int index = 1;
                    for (Map.Entry<FileExtension, byte[]> entry : files.entrySet()) {
                        FileExtension fileExt = entry.getKey();
                        byte[] content = entry.getValue();
                        double sizeKB = content.length / 1024.0;
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><strong><%= fileExt.getFileName() %></strong></td>
                        <td><span class="extension-badge">.<%= fileExt.getFileExtension() %></span></td>
                        <td class="file-size"><%= String.format("%.2f KB", sizeKB) %> (<%= content.length %> bytes)</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { 
            String error = (String) request.getAttribute("error");
        %>
            <div class="error-message">
                ❌ <%= error != null ? error : "Erreur lors de l'upload" %>
            </div>
        <% } %>
        
        <div class="buttons">
            <a href="fileextmap" class="btn btn-primary">📤 Uploader d'autres fichiers</a>
            <a href="index.html" class="btn btn-secondary">🏠 Retour à l'accueil</a>
        </div>
    </div>
</body>
</html>
