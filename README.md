                                        
# Instructions
Utilisez SQL pour réaliser les tâches décrites ci-dessous.
Créez une base de données et implémentez toutes les tables et requêtes demandées.
Soumettez vos scripts SQL ainsi que des captures d'écran des résultats obtenus pour chaque requête.
# Tâches
# Partie 1 : Configuration de la Base de Données
Créez une base de données nommée SaleOrderQuiz.
Activez l’utilisation de la base de données SaleOrderQuiz.
# Partie 2 : Création des Tables
Créez les tables suivantes avec les champs et contraintes spécifiés :
Table Customer (Client)
CustomerID : INT, NOT NULL, clé primaire.
CustomerFirstName : VARCHAR(50), NOT NULL.
CustomerLastName : VARCHAR(50), NOT NULL.
CustomerAddress : VARCHAR(50), NOT NULL.
CustomerCity : VARCHAR(50), NOT NULL.
CustomerPostCode : CHAR(4), NULL.
CustomerPhoneNumber : CHAR(12), NULL.
Table Inventory (Inventaire)
InventoryID : TINYINT, NOT NULL, clé primaire.
InventoryName : VARCHAR(50), NOT NULL.
InventoryDescription : VARCHAR(255), NULL.
Table Employee (Employé)
EmployeeID : TINYINT, NOT NULL, clé primaire.
EmployeeFirstName : VARCHAR(50), NOT NULL.
EmployeeLastName : VARCHAR(50), NOT NULL.
EmployeeExtension : CHAR(4), NULL.
Table Sale (Vente)
SaleID : TINYINT, NOT NULL, clé primaire.
CustomerID : INT, NOT NULL, clé étrangère faisant référence à CustomerID.
InventoryID : TINYINT, NOT NULL, clé étrangère faisant référence à InventoryID.
EmployeeID : TINYINT, NOT NULL, clé étrangère faisant référence à EmployeeID.
SaleDate : DATE, NOT NULL.
SaleQuantity : INT, NOT NULL.
SaleUnitPrice : SMALLMONEY, NOT NULL.
# Partie 3 : Manipulation des Données
Insérez au moins 3 lignes de données dans chaque table.
Écrivez des requêtes pour :
Afficher tous les clients depuis la table Customer.
Lister toutes les ventes avec leurs montants totaux (SaleQuantity * SaleUnitPrice) par ordre décroissant.
Afficher tous les employés ayant réalisé au moins une vente, ainsi que le montant total des ventes pour chacun.
# Partie 4 : Modifications des Tables
Ajoutez une nouvelle colonne CustomerEmail à la table Customer.
Mettez à jour la colonne CustomerEmail pour l’un des clients.
Supprimez un enregistrement client dont la ville (CustomerCity) est "New York".
# Partie 5 : Requêtes Avancées
Écrivez une requête pour afficher toutes les ventes réalisées au cours des 30 derniers jours.
Affichez tous les clients ayant acheté plus de 5 articles en une seule vente.
Calculez le revenu total des ventes, regroupé par InventoryName.
# Partie 6 : Bonus
Créez une vue nommée CustomerSalesView pour afficher :
CustomerFirstName, CustomerLastName, SaleDate, InventoryName, SaleQuantity, et TotalAmount.
Créez une procédure stockée permettant de récupérer toutes les ventes pour un client spécifique en fonction de son CustomerID.
