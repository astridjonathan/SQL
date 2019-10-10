# Augmenter le salaire de l'employé id 1
#1. Update MAJ
#2. Suivi de la table à mettre à jour
#3. SET suivi de la colonne à modifier
#4. (OPTION) une condition WHERE
UPDATE employes SET salaire = 5700  WHERE id_employes = 1;

#Augmenter de 20% tous les salaires sauf celui de la direction?
UPDATE employes SET salaire = salaire*1.20 WHERE service != 'direction';
UPDATE employes SET salaire = ROUND(salaire*1.05) WHERE service != 'direction'; #ou salaire * (1+20 /100)

#Augmenter de 10%  les 5 salaires qui ont le plus d'ancienneté?
#UPDATE employes SET salaire = salaire*1.10 WHERE MAX(salaire) CURDATE() - date_embauche AS nb_anciennete; #a finir