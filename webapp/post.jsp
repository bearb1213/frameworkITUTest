<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulaire GET et POST</title>
</head>
<body>
    <h1>Méthode utilisée : ${methode}</h1>
    
    <h2>Formulaire avec méthode GET</h2>
    <form action="double" method="get">
        <label for="nomGet">Nom :</label>
        <input type="text" id="nomGet" name="nom"><br><br>
        
        <label for="emailGet">Email :</label>
        <input type="email" id="emailGet" name="email"><br><br>
        
        <input type="submit" value="Envoyer avec GET">
    </form>
    
    <hr>
    
    <h2>Formulaire avec méthode POST</h2>
    <form action="double" method="post">
        <label for="nomPost">Nom :</label>
        <input type="text" id="nomPost" name="nom"><br><br>
        
        <label for="emailPost">Email :</label>
        <input type="email" id="emailPost" name="email"><br><br>
        
        <input type="submit" value="Envoyer avec POST">
    </form>
    
    <hr>
    
    <h3>Informations soumises :</h3>
    <p>Nom : ${param.nom}</p>
    <p>Email : ${param.email}</p>
</body>
</html>