#1 Afficher le service de l'employé 5.
SELECT nom, prenom, service FROM employes WHERE id_employes = 5;

#2 Afficher la date d'embauche de : Melissa.
SELECT prenom, date_embauche FROM employes WHERE prenom = 'Melissa';

#3 Afficher le nombre de commerciaux.
SELECT COUNT(*) AS nb_commerciaux FROM employes WHERE service='commercial';

#4 Afficher le coût des commerciaux sur 1 année.
SELECT SUM(salaire*12) AS salaire_commerciaux FROM employes WHERE service ='commercial';

#5 Afficher le salaire moyen par service.
SELECT service, ROUND(AVG(salaire)) AS salaire_moyen FROM employes GROUP BY service ;

#6 Afficher le nombre de recrutements sur l'année 2019.
SELECT COUNT(id_employes) AS nb_recrutement_2019 FROM employes WHERE date_embauche BETWEEN '2019-01-01' AND '2019-12-31';
SELECT COUNT(*) AS 'nb_recrutement' FROM employes WHERE date_embauche LIKE '2019%';

#7 Augmenter le salaire pour chaque employé de 100€.
UPDATE employes SET salaire = salaire + 100; 

#8 Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
SELECT prenom, nom, service, salaire FROM employes WHERE service='commercial' AND salaire = (SELECT MAX(salaire) FROM employes WHERE service='commercial');
SELECT prenom, nom, service, salaire FROM employes WHERE service='commercial' ORDER BY salaire DESC limit 0,1;

#9 Afficher l'employé ayant été embauché  l'année derniere.
SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2018-01-01' AND '2018-12-31';

#10 Afficher l'employé ayant été embauché  en dernier.
SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche = ( SELECT MAX(date_embauche) FROM employes);