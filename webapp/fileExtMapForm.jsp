<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Map&lt;FileExtension, byte[]&gt; Upload</title>
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
            max-width: 600px;
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
        
        .info-box {
            background: #f0f7ff;
            border-left: 4px solid #2196F3;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 5px;
        }
        
        .info-box h3 {
            color: #2196F3;
            margin-bottom: 8px;
            font-size: 16px;
        }
        
        .info-box p {
            color: #555;
            font-size: 13px;
            line-height: 1.6;
        }
        
        .info-box code {
            background: #e3f2fd;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: 'Courier New', monospace;
            font-size: 12px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }
        
        .file-input-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }
        
        .file-input-wrapper input[type=file] {
            position: absolute;
            left: -9999px;
        }
        
        .file-input-label {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px 25px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
        }
        
        .file-input-label:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(245, 87, 108, 0.4);
        }
        
        .file-input-label svg {
            margin-right: 10px;
        }
        
        .selected-files {
            margin-top: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            display: none;
        }
        
        .selected-files.active {
            display: block;
        }
        
        .file-item {
            padding: 10px;
            background: white;
            margin-bottom: 8px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        
        .file-item:last-child {
            margin-bottom: 0;
        }
        
        .file-name {
            font-size: 13px;
            color: #333;
            font-weight: 500;
        }
        
        .file-size {
            font-size: 12px;
            color: #999;
        }
        
        .file-extension {
            background: #f093fb;
            color: white;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            margin-left: 10px;
        }
        
        button[type="submit"] {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        
        button[type="submit"]:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        
        button[type="submit"]:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .back-link:hover {
            color: #764ba2;
            transform: translateX(-5px);
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
        <h1>📦 Test FileExtension Map Upload</h1>
        <p class="subtitle">Upload de fichiers avec Map&lt;FileExtension, byte[]&gt;</p>
        
        <div class="info-box">
            <h3>ℹ️ À propos de ce test</h3>
            <p>
                Cette page teste l'upload de fichiers en utilisant un paramètre de type 
                <code>Map&lt;FileExtension, byte[]&gt;</code>. Le framework extrait automatiquement 
                le nom du fichier et son extension pour créer des objets <code>FileExtension</code> 
                qui servent de clés dans la Map, avec le contenu du fichier (byte[]) comme valeur.
            </p>
        </div>
        
        <form action="fileextmap" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Sélectionner des fichiers :</label>
                <div class="file-input-wrapper">
                    <input type="file" 
                           id="files" 
                           name="files" 
                           multiple 
                           accept="*/*"
                           onchange="updateFileList()">
                    <label for="files" class="file-input-label">
                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M10 4V16M4 10H16" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                        Choisir des fichiers
                    </label>
                </div>
                
                <div id="selectedFiles" class="selected-files">
                    <strong style="display: block; margin-bottom: 10px; color: #333;">Fichiers sélectionnés :</strong>
                    <div id="fileList"></div>
                </div>
            </div>
            
            <button type="submit" id="submitBtn" disabled>
                📤 Uploader les fichiers
            </button>
        </form>
        
        <a href="index.html" class="back-link">← Retour à l'accueil</a>
    </div>
    
    <script>
        function updateFileList() {
            const input = document.getElementById('files');
            const fileListDiv = document.getElementById('fileList');
            const selectedFilesDiv = document.getElementById('selectedFiles');
            const submitBtn = document.getElementById('submitBtn');
            
            if (input.files.length > 0) {
                selectedFilesDiv.classList.add('active');
                submitBtn.disabled = false;
                
                let html = '';
                for (let i = 0; i < input.files.length; i++) {
                    const file = input.files[i];
                    const size = formatFileSize(file.size);
                    const extension = getFileExtension(file.name);
                    
                    html += `
                        <div class="file-item">
                            <div>
                                <span class="file-name">${file.name}</span>
                                <span class="file-extension">.${extension}</span>
                            </div>
                            <span class="file-size">${size}</span>
                        </div>
                    `;
                }
                fileListDiv.innerHTML = html;
            } else {
                selectedFilesDiv.classList.remove('active');
                submitBtn.disabled = true;
            }
        }
        
        function formatFileSize(bytes) {
            if (bytes === 0) return '0 Bytes';
            const k = 1024;
            const sizes = ['Bytes', 'KB', 'MB', 'GB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
        }
        
        function getFileExtension(filename) {
            const parts = filename.split('.');
            return parts.length > 1 ? parts[parts.length - 1] : 'unknown';
        }
    </script>
</body>
</html>
