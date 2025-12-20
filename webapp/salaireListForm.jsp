<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Création de Salaires (ArrayList)</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
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

        .type-badge {
            display: inline-block;
            padding: 5px 15px;
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: white;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 20px;
        }
        
        .controls {
            display: flex;
            gap: 10px;
            margin-bottom: 30px;
            justify-content: center;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-add {
            background: #fa709a;
            color: white;
        }
        
        .btn-add:hover {
            background: #f8568f;
        }
        
        .btn-remove {
            background: #dc3545;
            color: white;
        }
        
        .btn-remove:hover {
            background: #c82333;
        }
        
        .salaires-container {
            margin-bottom: 30px;
        }
        
        .salaire-item {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            border-left: 4px solid #fa709a;
            position: relative;
            transition: transform 0.2s ease;
        }
        
        .salaire-item:hover {
            transform: translateX(5px);
        }
        
        .salaire-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .salaire-number {
            font-weight: 700;
            color: #fa709a;
            font-size: 18px;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 15px;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
        }
        
        label {
            font-size: 12px;
            font-weight: 600;
            color: #666;
            margin-bottom: 5px;
            text-transform: uppercase;
        }
        
        input, select {
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }
        
        input:focus, select:focus {
            outline: none;
            border-color: #fa709a;
        }
        
        .btn-submit {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
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
            box-shadow: 0 10px 20px rgba(250, 112, 154, 0.4);
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

        .btn-link {
            display: inline-block;
            padding: 10px 20px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            text-align: center;
            border-radius: 8px;
            font-size: 14px;
            transition: background 0.3s ease;
            margin-bottom: 20px;
            margin-right: 10px;
        }

        .btn-link:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>💰 Création de Salaires</h1>
        <p class="subtitle">Testez avec ArrayList&lt;Salaire&gt;</p>
        
        <div style="text-align: center;">
            <span class="type-badge">🔷 Type: ArrayList&lt;Salaire&gt;</span>
        </div>
        
        <a href="salaires" class="btn-link">🔸 Version Array</a>
        <a href="/" class="btn-link">← Accueil</a>
        
        <div class="controls">
            <button type="button" class="btn btn-add" onclick="addSalaire()">➕ Ajouter un salaire</button>
            <button type="button" class="btn btn-remove" onclick="removeSalaire()">➖ Retirer le dernier</button>
        </div>
        
        <form action="salaireslist" method="post" id="salaireForm">
            <div class="salaires-container" id="salairesContainer">
                <!-- Les salaires seront ajoutés ici dynamiquement -->
            </div>
            
            <button type="submit" class="btn-submit">
                Créer les salaires (ArrayList)
            </button>
        </form>
        
        <div class="info-box">
            <strong>ℹ️ Information</strong>
            Cette version utilise <strong>ArrayList&lt;Salaire&gt;</strong> au lieu de Salaire[].<br>
            Les données seront automatiquement converties en ArrayList par le framework.
        </div>
    </div>
    
    <script>
        let salaireCount = 0;
        
        function addSalaire() {
            const container = document.getElementById('salairesContainer');
            const index = salaireCount;
            
            const salaireDiv = document.createElement('div');
            salaireDiv.className = 'salaire-item';
            salaireDiv.id = 'salaire-' + index;
            salaireDiv.innerHTML = `
                <div class="salaire-header">
                    <span class="salaire-number">Salaire #\${index + 1}</span>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="montant_\${index}">Montant</label>
                        <input type="number" 
                               id="montant_\${index}" 
                               name="salaires[\${index}].montant" 
                               step="0.01" 
                               placeholder="Ex: 2500.00" 
                               required>
                    </div>
                    <div class="form-group">
                        <label for="devise_\${index}">Devise</label>
                        <select id="devise_\${index}" name="salaires[\${index}].devise" required>
                            <option value="">Choisir...</option>
                            <option value="EUR">EUR (€)</option>
                            <option value="USD">USD ($)</option>
                            <option value="GBP">GBP (£)</option>
                            <option value="MGA">MGA (Ar)</option>
                            <option value="JPY">JPY (¥)</option>
                            <option value="CHF">CHF (CHF)</option>
                        </select>
                    </div>
                </div>
            `;
            
            container.appendChild(salaireDiv);
            salaireCount++;
        }
        
        function removeSalaire() {
            if (salaireCount > 0) {
                const lastSalaire = document.getElementById('salaire-' + (salaireCount - 1));
                if (lastSalaire) {
                    lastSalaire.remove();
                    salaireCount--;
                }
            }
        }
        
        // Ajouter 3 salaires par défaut au chargement
        window.addEventListener('load', function() {
            addSalaire();
            addSalaire();
            addSalaire();
        });
    </script>
</body>
</html>
