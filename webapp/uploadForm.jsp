<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Upload de Fichier</title>
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
            max-width: 500px;
            width: 100%;
        }
        
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 28px;
            text-align: center;
        }
        
        .subtitle {
            color: #666;
            text-align: center;
            margin-bottom: 30px;
            font-size: 14px;
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
            padding: 15px 20px;
            background: #f8f9fa;
            border: 2px dashed #667eea;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .file-input-label:hover {
            background: #e9ecef;
            border-color: #764ba2;
        }
        
        .file-input-label svg {
            width: 24px;
            height: 24px;
            margin-right: 10px;
            color: #667eea;
        }
        
        .file-name {
            margin-top: 10px;
            padding: 10px;
            background: #e7f3ff;
            border-radius: 5px;
            color: #0066cc;
            font-size: 13px;
            display: none;
        }
        
        .file-name.show {
            display: block;
        }
        
        textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-family: inherit;
            font-size: 14px;
            resize: vertical;
            min-height: 100px;
            transition: border-color 0.3s ease;
        }
        
        textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .btn-submit {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-submit:active {
            transform: translateY(0);
        }
        
        .info-box {
            margin-top: 20px;
            padding: 15px;
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            border-radius: 5px;
            font-size: 13px;
            color: #856404;
        }
        
        .info-box strong {
            display: block;
            margin-bottom: 5px;
        }

        .btn-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .btn-link {
            flex: 1;
            padding: 10px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            text-align: center;
            border-radius: 8px;
            font-size: 14px;
            transition: background 0.3s ease;
        }

        .btn-link:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Upload de Fichier</h1>
        <p class="subtitle">Testez l'upload de fichiers du framework</p>

        <div class="btn-container">
            <a href="uploadMultiple" class="btn-link">Upload multiple</a>
            <a href="/" class="btn-link">Accueil</a>
        </div>
        
        <form action="upload" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fichier">Sélectionner un fichier</label>
                <div class="file-input-wrapper">
                    <input type="file" id="fichier" name="fichier" required>
                    <label for="fichier" class="file-input-label">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"/>
                        </svg>
                        <span>Cliquez pour choisir un fichier</span>
                    </label>
                </div>
                <div class="file-name" id="fileName"></div>
            </div>
            
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Ajoutez une description pour ce fichier..."></textarea>
            </div>
            
            <button type="submit" class="btn-submit">
                Uploader le fichier
            </button>
        </form>
        
        <div class="info-box">
            <strong>ℹ️ Information</strong>
            Taille maximale : 10 MB<br>
            Le fichier sera enregistré avec un nom unique pour éviter les écrasements.
        </div>
    </div>
    
    <script>
        const fileInput = document.getElementById('fichier');
        const fileNameDisplay = document.getElementById('fileName');
        
        fileInput.addEventListener('change', function(e) {
            if (this.files && this.files[0]) {
                const fileName = this.files[0].name;
                const fileSize = (this.files[0].size / 1024).toFixed(2);
                fileNameDisplay.innerHTML = `📎 <strong>${fileName}</strong> (${fileSize} KB)`;
                fileNameDisplay.classList.add('show');
            } else {
                fileNameDisplay.classList.remove('show');
            }
        });
    </script>
</body>
</html>
