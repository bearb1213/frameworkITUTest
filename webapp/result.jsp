<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Affichage des données</title>
</head>
<body>
    <h1>Résultats</h1>
    <%
        Object idAttr = request.getAttribute("id");
        Object nameAttr = request.getAttribute("name");
        Object valeurAttr = request.getAttribute("valeur");
    %>
    
    <div>
        <p>ID présent : <%= idAttr != null %></p>
        <p>Name présent : <%= nameAttr != null %></p>
        <p>valeur présent : <%= valeurAttr != null %></p>
    </div>
    
    <div>
        <h2>Valeurs :</h2>
        <p>ID : ${id}</p>
        <p>Name : ${name}</p>
        <p>valeur : ${valeur}</p>
    </div>
    
</body>
</html>