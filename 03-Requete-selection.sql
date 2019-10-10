#récuperer  les prenoms et noms de tous les users
#1- SELECT pour effectuer une requête de SLECTION
#2- On précise les colonnes qu'on souhaite récupérer
#3- FROM pour indiquer la table concernée.
#SELECT nom, prenom FROM employes;

#Afficher les services occupés dans l'entreprise
#On remarque la présence de doublon
#SELECT service FROM employes;

#Afficher les services occupés dans l'entreprise sans doublons
#le mot clé 'DISTINCT' permet d'éviter les doublons
#SELECT DISTINCT service FROM employes;

#Sélectionner tous les champs 
#SELECT * FROM employes;

# Récupérer le prénom et le nom des employés du service "employés"
#SELECT prenom, nom FROM employes WHERE service='informatique';

# Récupérer les employés ayant été recruté entre Janvier et Mars 2019
#SELECT prenom, nom FROM employes WHERE date_embauche  BETWEEN '2019-01-01' AND '2019-03-01';

# Récupérer les employés ayant un salaire de 2000 et 3000;
#SELECT prenom, nom FROM employes WHERE salaire  BETWEEN '2000' AND '3000';

# Connaître la date du jour
#SELECT CURDATE();
# Récupérer les employés ayant été recruté entre Janvier e taujourd'hui
#SELECT prenom, nom,  date_embauche  FROM employes WHERE date_embauche  BETWEEN '2019-01-01' AND CURDATE();

# Récupérer les employés ayant un prénom commençant par la lettre 'A'
#SELECT prenom FROM employes WHERE prenom LIKE 'a%';

# Récupérer les employés ayant un prénom contenant par la lettre 'I'
#SELECT prenom FROM employes WHERE prenom LIKE '%i%';

# Afficher tous les employés sauf ceux du service informatique
#SELECT prenom, nom, service FROM employes WHERE service != 'production';

# Afficher tous les employés gagnant un salaire de plus de 3000
#SELECT prenom, nom, salaire FROM employes WHERE salaire > 3000;

#Afficher tous les employés par ordre alphabétique (colonne prenom) ASC: pour ascendant et DESC pour descendant
#SELECT prenom,nom FROM employes ORDER BY prenom ;
#SELECT prenom,nom FROM employes ORDER BY prenom ASC;
#SELECT prenom,nom FROM employes ORDER BY prenom DESC;

# Quels sont les 3 salariés ayant le meilleur salaire?
#Grace à LIMIT, on limite  les résultats et on peut introduite la pagination
#LIMIT(position de depart, nombre de resultat souhaité)
SELECT prenom,nom,service, salaire FROM employes ORDER BY salaire DESC LIMIT 0,3; # je pars de 0 et je veux 3 Résultats
SELECT prenom,nom,service, salaire FROM employes ORDER BY salaire DESC LIMIT 3,3; # je pars de 3 et je veux 3 Résultats
SELECT prenom,nom,service, salaire FROM employes ORDER BY salaire DESC LIMIT 6,3; # je pars de 6 et je veux 3 Résultats

# Afficher la liste des employés avec leur salaire annuel 
SELECT prenom,nom,service, salaire*12 FROM employes  ORDER BY salaire DESC;

# Le mot clé AS permet de nommer une colonne (de définir un ALIAS)
SELECT prenom,nom,service, salaire*12 AS salaire_annuel FROM employes;

# Connaitre le montant de la charge salariale
SELECT SUM(salaire*12) AS masse_salariale_annuelle FROM employes;

#connaitre le salaire moyen average (avg)
SELECT AVG(salaire) as moyenne_salaire FROM employes;

#resultat arrondi
SELECT ROUND(AVG(salaire)) as moyenne_salaire FROM employes;
SELECT ROUND(AVG(salaire),2) as moyenne_salaire FROM employes; #arrondi à 2 chiffres apres virgule

# Nombre d'homme et de femme de l'entreprise
SELECT COUNT(*) FROM employes WHERE sexe='h';
SELECT COUNT(*) FROM employes WHERE sexe='f';

# LE salaire le plus faible dans notre liste d'employés
SELECT prenom, service, salaire FROM employes ORDER BY salaire LIMIT 0,1;
SELECT MIN(salaire) FROM employes; # ici nous ne pouvons pas connaitre l'id 

#il faudrait use une requete imbriquée
#quel est le salaire min ? (ou max)et à qui il correspond .
SELECT prenom, service, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);

# Récupérer les employes du service informatique et comptabilité
SELECT prenom, nom, service FROM employes WHERE service IN('informatique', 'comptabilite');
SELECT prenom, nom, service FROM employes WHERE service NOT IN('informatique', 'production', 'comptabilite' ); # tous les services sauf inf, compta et prod

# Récuperer les employés du service production qui gagne un salaire <=à 2000 et prenom commencant par a
SELECT prenom, nom, service, salaire FROM employes WHERE service='production' AND salaire <=2000 AND prenom LIKE 'm%';

# Récupérer les employés du service commercial qui gagnent un salaire de 2700€ ou 3200€
# Ici nous avons trois conditions
# 1. Appartenir au service commercial
# 2. Avoir un salaire de 2700€
# 3. Ou Avoir un salaire de 3200€
SELECT prenom, nom, service, salaire FROM employes
	WHERE service = 'commercial'
    AND salaire = 2700
    OR salaire = 3200 ;
    
#ordre de priorité
SELECT prenom, nom, service, salaire FROM employes WHERE service='production' AND (salaire= 1520 OR salaire=1800) ;

#connaitre le nombre d'employés par service GROUP BY
SELECT service, COUNT(*) AS nb_employes FROM employes GROUP BY service ;

#connaitre le nombre d'employés des services ayant plus de 2 personnes
# le HAVING permet d'imposer une condition  au GROUP BY
SELECT service, COUNT(*) AS nb_employes FROM employes GROUP BY service HAVING COUNT(*) >2 ;

# AFFIcher pour chaque service l'employé ayant le meilleur salaire?



# AFFIcher pour chaque service l'employé ayant le plus d'ancienneté? 

