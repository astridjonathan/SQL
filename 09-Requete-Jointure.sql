# Afficher les dates auqueles Hugo s'est rendu à la bibliothèqe pour emprunter ou rendre un livre
#On veux récupérer 3 informations: date de sortie et de rendu prenom de Hugo

SELECT a.prenom, e.date_sortie, e.date_rendu
FROM abonne a, emprunt e
WHERE a.id = e.id_abonne
AND a.prenom = 'Hugo';

#Afficher les dates auxquelles les livres écrits par GUY DE MAUPASSANT ont été empruntés ou rendus à la bibliothèque.
SELECT e.date_sortie, e.date_rendu
FROM livre l, emprunt e
WHERE l.id = e.id_livre
AND l.auteur = 'GUY DE MAUPASSANT';

# Qui a emprunté le livre 'La Reine Margot' sur l'année 2019 ?
SELECT a.prenom, a.nom
FROM abonne a, livre l, emprunt e
WHERE l.id = e.id_livre
AND a.id = e.id_abonne
AND l.titre = 'La Reine Margot'
AND e.date_sortie LIKE '2019%';

# Afficher le nombre de livres empruntés par chaque abonné

SELECT a.prenom, COUNT(e.id_livre) AS nb_livre
FROM abonne a,  emprunt e
WHERE a.id = e.id_abonne
GROUP BY e.id_abonne;

# Qui a emprunté Quoi ? et Quand ?
SELECT a.prenom, l.titre, e.date_sortie
FROM abonne a, livre l, emprunt e
WHERE  a.id = e.id_abonne

GROUP BY e.id_abonne;

INSERT INTO abonne (nom) VALUES ('DUPONT');
SELECT * FROM abonne;


#Afficher le prénom des abonnés avec le numéro des livres qu'ils ont emprunté
#ça ne marche pas car Alex qui n'a pas réservé de libre n'est pas la
SELECT a.prenom, e.id_livre
FROM  abonne a, emprunt e
WHERE a.id = e.id_abonne
ORDER BY a.id;

#Utilisation jointure externe par la gauche avec  LEFT JOIN ... ON ....
#Meme si toutes les conditions ne sont pas remplies ont affiche quand même
SELECT a.prenom, e.id_livre
FROM  abonne a LEFT JOIN emprunt e
ON a.id =  e.id_abonne
ORDER BY a.id;



