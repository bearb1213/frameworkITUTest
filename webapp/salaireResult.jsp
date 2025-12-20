<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.exemple.model.Salaire" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat Salaires</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
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
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
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
        
        .salaires-section {
            margin-bottom: 30px;
        }
        
        .section-title {
            color: #333;
            font-size: 18px;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #43e97b;
        }
        
        .salaire-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            border-left: 4px solid #28a745;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .salaire-card:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .salaire-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .salaire-number {
            font-weight: 700;
            color: #43e97b;
            font-size: 16px;
        }
        
        .salaire-montant {
            font-size: 24px;
            font-weight: 700;
            color: #333;
        }
        
        .salaire-devise {
            display: inline-block;
            padding: 4px 12px;
            background: #43e97b;
            color: white;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-left: 10px;
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
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
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

        .total-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            text-align: center;
        }

        .total-label {
            font-size: 14px;
            opacity: 0.9;
            margin-bottom: 10px;
        }

        .total-value {
            font-size: 36px;
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="container">
        <% Boolean success = (Boolean) request.getAttribute("success"); %>
        <% if (success != null && success) { %>
            <div class="success-icon">✅</div>
            <h1>Salaires créés avec succès!</h1>
            
            <div class="summary-box">
                <div class="summary-item">
                    <div class="summary-label">Nombre de salaires</div>
                    <div class="summary-value"><%= request.getAttribute("count") %></div>
                </div>
            </div>

            <% if (request.getAttribute("total") != null) { %>
            <div class="total-box">
                <div class="total-label">💰 Montant Total</div>
                <div class="total-value"><%= String.format("%.2f", (Double)request.getAttribute("total")) %></div>
                <div class="total-label">(somme de tous les montants)</div>
            </div>
            <% } %>
            
            <div class="salaires-section">
                <h2 class="section-title">💼 Liste des Salaires</h2>
                
                <% 
                Salaire[] salaires = (Salaire[]) request.getAttribute("salaires");
                if (salaires != null) {
                    for (int i = 0; i < salaires.length; i++) {
                        Salaire salaire = salaires[i];
                        if (salaire != null) {
                %>
                <div class="salaire-card">
                    <div class="salaire-header">
                        <span class="salaire-number">Salaire #<%= i + 1 %></span>
                        <div>
                            <span class="salaire-montant"><%= String.format("%.2f", salaire.getMontant()) %></span>
                            <span class="salaire-devise"><%= salaire.getDevise() %></span>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    }
                }
                %>
            </div>
            
        <% } else { %>
            <div class="error-icon">❌</div>
            <h1>Erreur de création</h1>
            <div class="error-message">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "Une erreur inconnue est survenue" %>
            </div>
        <% } %>
        
        <div class="btn-container">
            <a href="salaires" class="btn btn-primary">Créer d'autres salaires</a>
            <a href="/" class="btn btn-secondary">Retour à l'accueil</a>
        </div>
    </div>
</body>
</html>
