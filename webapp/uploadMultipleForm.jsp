<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Multiple Files</title>
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
            padding: 20px;
            background: #f8f9fa;
            border: 3px dashed #f093fb;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .file-input-label:hover {
            background: #e9ecef;
            border-color: #f5576c;
        }
        
        .file-input-label svg {
            width: 32px;
            height: 32px;
            margin-right: 10px;
            color: #f093fb;
        }
        
        .file-list {
            margin-top: 15px;
            max-height: 200px;
            overflow-y: auto;
        }
        
        .file-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 15px;
            background: #e7f3ff;
            border-radius: 8px;
            margin-bottom: 8px;
            transition: background 0.2s ease;
        }
        
        .file-item:hover {
            background: #cce5ff;
        }
        
        .file-info {
            display: flex;
            align-items: center;
            flex: 1;
        }
        
        .file-icon {
            font-size: 20px;
            margin-right: 10px;
        }
        
        .file-details {
            flex: 1;
        }
        
        .file-name {
            color: #0066cc;
            font-size: 14px;
            font-weight: 500;
        }
        
        .file-size {
            color: #666;
            font-size: 12px;
        }
        
        .file-count {
            display: inline-block;
            padding: 4px 12px;
            background: #f093fb;
            color: white;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-top: 10px;
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
            border-color: #f093fb;
        }
        
        .btn-submit {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
            box-shadow: 0 10px 20px rgba(240, 147, 251, 0.4);
        }
        
        .btn-submit:active {
            transform: translateY(0);
        }
        
        .btn-submit:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .info-box {
            margin-top: 20px;
            padding: 15px;
            background: #d1ecf1;
            border-left: 4px solid #17a2b8;
            border-radius: 5px;
            font-size: 13px;
            color: #0c5460;
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
        <h1>📁 Upload Multiple Fichiers</h1>
        <p class="subtitle">Sélectionnez plusieurs fichiers à uploader</p>
        
        <div class="btn-container">
            <a href="upload" class="btn-link">Upload simple</a>
            <a href="/" class="btn-link">Accueil</a>
        </div>

        <form action="uploadMultiple" method="post" enctype="multipart/form-data" id="uploadForm">
            <div class="form-group">
                <label for="fichiers">Sélectionner des fichiers</label>
                <div class="file-input-wrapper">
                    <input type="file" id="fichiers" name="fichiers" multiple required>
                    <label for="fichiers" class="file-input-label">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"/>
                        </svg>
                        <span>Cliquez pour choisir plusieurs fichiers</span>
                    </label>
                </div>
                <div class="file-list" id="fileList"></div>
            </div>
            
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Ajoutez une description pour ces fichiers..."></textarea>
            </div>
            
            <button type="submit" class="btn-submit" id="submitBtn" disabled>
                Uploader les fichiers
            </button>
        </form>
        
        <div class="info-box">
            <strong>ℹ️ Information</strong>
            Taille maximale par fichier : 10 MB<br>
            Taille totale maximale : 50 MB<br>
            Chaque fichier sera enregistré avec un nom unique.
        </div>
    </div>
    
    <script>
        const fileInput = document.getElementById('fichiers');
        const fileList = document.getElementById('fileList');
        const submitBtn = document.getElementById('submitBtn');
        
        fileInput.addEventListener('change', function(e) {
            fileList.innerHTML = '';
            
            if (this.files && this.files.length > 0) {
                let totalSize = 0;
                
                for (let i = 0; i < this.files.length; i++) {
                    const file = this.files[i];
                    const fileSize = (file.size / 1024).toFixed(2);
                    totalSize += file.size;
                    
                    const fileItem = document.createElement('div');
                    fileItem.className = 'file-item';
                    fileItem.innerHTML = `
                        <div class="file-info">
                            <span class="file-icon">📄</span>
                            <div class="file-details">
                                <div class="file-name">\${file.name}</div>
                                <div class="file-size">\${fileSize} KB</div>
                            </div>
                        </div>
                    `;
                    fileList.appendChild(fileItem);
                }
                
                const totalMB = (totalSize / (1024 * 1024)).toFixed(2);
                const countBadge = document.createElement('span');
                countBadge.className = 'file-count';
                countBadge.textContent = `\${this.files.length} fichier(s) - Total: \${totalMB} MB`;
                fileList.appendChild(countBadge);
                
                submitBtn.disabled = false;
            } else {
                submitBtn.disabled = true;
            }
        });
    </script>
</body>
</html>
