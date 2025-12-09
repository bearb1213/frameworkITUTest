<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.exemple.model.Employe" %>
<%@ page import="com.exemple.model.Salaire" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Affichage de l'Employé</title>
</head>
<body>
    <h1>Informations de l'Employé</h1>

    <%
        Employe emp = (Employe) request.getAttribute("emp");
        
        if (emp != null) {
            double totalSalaire = 0;
    %>

    <table border="1" cellpadding="10">
        <tr>
            <th>Champ</th>
            <th>Valeur</th>
        </tr>

        <tr>
            <td><strong>Nom :</strong></td>
            <td><%= emp.getNom() %></td>
        </tr>

        <tr>
            <td><strong>Âge :</strong></td>
            <td><%= emp.getAge() %></td>
        </tr>

        <tr>
            <td><strong>Salaires :</strong></td>
            <td>

                <!-- TABLE DES SALAIRES -->
                <table border="1" cellpadding="5">
                    <tr>
                        <th>Montant</th>
                        <th>Devise</th>
                    </tr>

                    <%
                        if (emp.getSalaires() != null) {
                            for (int i = 0; i < emp.getSalaires().size(); i++) {
                                Salaire s = emp.getSalaires().get(i);
                                totalSalaire += (s.getMontant() != null ? s.getMontant() : 0);
                    %>

                    <tr>
                        <td><%= String.format("%.2f", s.getMontant()) %></td>
                        <td><%= s.getDevise() %></td>
                    </tr>

                    <%  
                            }
                        }
                    %>

                </table>

            </td>
        </tr>

        <tr>
            <td><strong>Total Montants :</strong></td>
            <td><%= String.format("%.2f", totalSalaire) %></td>
        </tr>

    </table>

    <br>

    <h3>Détails supplémentaires :</h3>
    <ul>
        <li>Nom complet : <strong><%= emp.getNom() %></strong></li>
        <li>Âge : <strong><%= emp.getAge() %> ans</strong></li>
        <li>Total salaires saisis : <strong><%= emp.getSalaires().size() %></strong></li>
        <li>Somme totale des salaires : <strong><%= String.format("%.2f", totalSalaire) %></strong></li>
        <li>Salaire annuel (estimation) : <strong><%= String.format("%.2f", totalSalaire * 12) %></strong></li>
    </ul>

    <%
        } else {
    %>
        <p style="color:red;">Aucun employé à afficher !</p>
    <%
        }
    %>

    
    <br><br>
    
    <h2>Formulaire pour créer un nouvel employé</h2>

    <form method="POST" action="objetTest">

        <table>
            <tr>
                <td><label for="nom">Nom :</label></td>
                <td><input type="text" id="nom" name="emp.nom" required></td>
            </tr>

            <tr>
                <td><label for="age">Âge :</label></td>
                <td><input type="number" id="age" name="emp.age" min="18" max="100" required></td>
            </tr>

            <!-- --------   LISTE DES SALAIRES   -------- -->
            <tr>
                <td style="vertical-align: top;"><strong>Salaires :</strong></td>
                <td>
                    <div id="salaire-container">

                        <!-- MODELE DE LIGNE SALAIRE -->
                        <div class="salaire-item">
                            Montant :
                            <input type="number" step="0.01" name="emp.salaires[0].montant" required>

                            Devise :
                            <input type="text" name="emp.salaires[0].devise" required>

                            <button type="button" onclick="removeSalaire(this)">X</button>
                        </div>
                        <div class="salaire-item">
                            Montant :
                            <input type="number" step="0.01" name="emp.salaires[1].montant" required>

                            Devise :
                            <input type="text" name="emp.salaires[1].devise" required>

                            <button type="button" onclick="removeSalaire(this)">X</button>
                        </div>
                    </div>

                    <br>
                    <button type="button" onclick="addSalaire()">+ Ajouter un salaire</button>
                </td>
            </tr>

            <!-- BOUTONS -->
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">Soumettre</button>
                    <button type="reset">Réinitialiser</button>
                </td>
            </tr>
        </table>

    </form>

    <script>
        let indexSalaire = 2;

        // Ajouter un salaire
        function addSalaire() {
            const container = document.getElementById("salaire-container");

            const div = document.createElement("div");
            div.className = "salaire-item";

            div.innerHTML = `
                Montant :
                <input type="number" step="0.01" name="emp.salaires[${indexSalaire}].montant" required>

                Devise :
                <input type="text" name="emp.salaires[${indexSalaire}].devise" required>

                <button type="button" onclick="removeSalaire(this)">X</button>
            `;

            container.appendChild(div);
            indexSalaire++;
        }

        // Supprimer une ligne salaire
        function removeSalaire(btn) {
            btn.parentNode.remove();
        }
    </script>

</body>
</html>