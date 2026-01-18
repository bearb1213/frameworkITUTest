<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Map&lt;String, byte[]&gt; Upload</title>
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
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
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
            display: block;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
        }
        
        .file-input-label:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .file-input-label i {
            margin-right: 8px;
        }
        
        .file-list {
            margin-top: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
            min-height: 60px;
        }
        
        .file-item {
            padding: 10px;
            background: white;
            border-radius: 8px;
            margin-bottom: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .file-item:last-child {
            margin-bottom: 0;
        }
        
        .file-name {
            font-weight: 500;
            color: #333;
            word-break: break-word;
        }
        
        .file-size {
            color: #666;
            font-size: 12px;
            margin-left: 10px;
        }
        
        .no-files {
            text-align: center;
            color: #999;
            font-style: italic;
        }
        
        .submit-btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(245, 87, 108, 0.4);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .info-box {
            background: #e3f2fd;
            border-left: 4px solid #2196f3;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 25px;
        }
        
        .info-box p {
            color: #1976d2;
            font-size: 14px;
            line-height: 1.6;
        }
        
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        
        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
        
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📦 Test Map&lt;String, byte[]&gt;</h1>
        <p class="subtitle">Upload de fichiers multiples dans une Map</p>
        
        <div class="info-box">
            <p>
                <strong>📋 Instructions:</strong><br>
                Sélectionnez plusieurs fichiers. Ils seront envoyés dans un paramètre 
                de type <code>Map&lt;String, byte[]&gt;</code> où la clé est le nom du champ 
                et la valeur est le contenu du fichier en bytes.
            </p>
        </div>
        
        <form action="filemap" method="post" enctype="multipart/form-data" id="uploadForm">
            <div class="form-group">
                <label>Sélectionnez vos fichiers</label>
                <div class="file-input-wrapper">
                    <input type="file" name="file1" id="file1" onchange="updateFileList()">
                    <label for="file1" class="file-input-label">
                        📄 Choisir fichier 1
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <div class="file-input-wrapper">
                    <input type="file" name="file2" id="file2" onchange="updateFileList()">
                    <label for="file2" class="file-input-label">
                        📄 Choisir fichier 2
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <div class="file-input-wrapper">
                    <input type="file" name="file3" id="file3" onchange="updateFileList()">
                    <label for="file3" class="file-input-label">
                        📄 Choisir fichier 3
                    </label>
                </div>
            </div>
            
            <div class="form-group">
                <label>Fichiers sélectionnés:</label>
                <div class="file-list" id="fileList">
                    <div class="no-files">Aucun fichier sélectionné</div>
                </div>
            </div>
            
            <button type="submit" class="submit-btn">
                🚀 Envoyer les fichiers
            </button>
        </form>
        
        <div class="back-link">
            <a href="index.html">← Retour à l'accueil</a>
        </div>
    </div>
    
    <script>
        function formatFileSize(bytes) {
            if (bytes === 0) return '0 Bytes';
            const k = 1024;
            const sizes = ['Bytes', 'KB', 'MB', 'GB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
        }
        
        function updateFileList() {
            const fileList = document.getElementById('fileList');
            const files = [];
            
            ['file1', 'file2', 'file3'].forEach(id => {
                const input = document.getElementById(id);
                if (input.files.length > 0) {
                    files.push({
                        name: input.files[0].name,
                        size: input.files[0].size,
                        field: id
                    });
                }
            });
            
            if (files.length === 0) {
                fileList.innerHTML = '<div class="no-files">Aucun fichier sélectionné</div>';
            } else {
                fileList.innerHTML = files.map(file => `
                    <div class="file-item">
                        <span class="file-name">
                            <strong>${file.field}:</strong> ${file.name}
                        </span>
                        <span class="file-size">${formatFileSize(file.size)}</span>
                    </div>
                `).join('');
            }
        }
    </script>
</body>
</html>
