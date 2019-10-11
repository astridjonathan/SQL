
SELECT * FROM abonne ; 
SELECT * FROM livre ; 
SELECT * FROM emprunt ; 

# Afficher les livres qui n'ont pas été rendus 
# On recherche dees livres ayant une date rendu NULL
# Attention IS NULL et non pas =NULL
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;
SELECT  titre FROM livre WHERE id IN (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL) ;

#Récupérer les ID des livres empruntes par Astrid
SELECT id_livre FROM emprunt WHERE id_abonne IN (SELECT id FROM abonne WHERE prenom = 'Hugo');

#Récupérer les titres des livres empruntes par Laureen
SELECT titre FROM livre WHERE id IN (SELECT id_livre FROM  emprunt WHERE id_abonne =
(SELECT id FROM abonne WHERE prenom = 'Laureen'));

#Afficher les prenoms des abonnes ayant empruntés un livre le 2018-02-17
SELECT prenom, nom from abonne WHERE id IN (SELECT id_abonne FROM emprunt WHERE date_sortie='2018-02-17');

#Afficher la liste des abonnes ayant dèja emprunté un livre de ' Père Riche, Père Pauvre
SELECT prenom, nom from abonne WHERE id IN (SELECT id_abonne FROM emprunt WHERE id_livre = 
(SELECT id from livre WHERE titre='Père Riche, Père Pauvre') );

# Afficher le(s) titre de(s) livre(s) que Lena n'a pas encore emprunté à la bibliothèque ?
SELECT titre FROM livre WHERE id NOT IN ( SELECT id_livre FROM emprunt WHERE id_abonne = 
(SELECT id from abonne WHERE prenom ='Lena' ));


# Afficher le(s) titre de(s) livre(s) que Hugo n'a pas encore rendu(s) à la bibliothèque.
SELECT titre FROM livre WHERE id IN ( SELECT id_livre FROM emprunt WHERE 
 date_rendu IS NULL AND id_abonne= (
 (SELECT id from abonne WHERE prenom ='Hugo' )));
 
# Combien de livre Astrid a emprunté à la bibliotheque ?
SELECT COUNT(*) AS nb_livre from emprunt WHERE id_abonne =
 (SELECT id from abonne WHERE prenom ='Astrid' );


# Notion de Requête jointure
# Afficher le nom et prenom des abonnes qui n'ont pas rendu les livres et leurs titres
SELECT a.prenom, a.nom, l.titre
FROM abonne a, emprunt e, livre l
WHERE e.date_rendu IS NULL
AND a.id= e.id_abonne
AND e.id_livre = l.id;


