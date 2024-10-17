-- create a table
CREATE TABLE produit (
  num_prod INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  prix INTEGER NOT NULL,
  poids INTEGER NOT NULL
);

CREATE TABLE fournisseurs (
  num_fourn INTEGER PRIMARY KEY,
  nom TEXT NOT NULL,
  adresse TEXT NOT NULL,
  ville TEXT NOT NULL
);

CREATE TABLE commandes (
num_prod INT NOT NULL REFERENCES produit(num_prod),
num_fourn INT NOT NULL REFERENCES fournisseurs(num_fourn),
qte INT NOT NULL,
PRIMARY KEY (num_prod, num_fourn));

-- insert some values
INSERT INTO produit VALUES (1, 'patate', 1, 1), (2, 'canard', 8, 0.4), (3, 'haricots', 4, 2), (4, 'carottes', 3, 1.5);
INSERT INTO fournisseurs VALUES (1, 'radis radieux', '3 allée du swag', 'Tarbes'), (2, 'navet naviguant', '1 rue du caca', 'Chartres');
INSERT INTO commandes VALUES (1, 1, 3), (1, 2, 150), (3, 1, 2);


-- fetch some values

-- SELECT nom, prix
-- FROM produit
-- WHERE poids > 1;

-- SELECT nom, qte
-- FROM produit AS p JOIN
--      commandes AS c ON p.num_prod = c.num_prod;

INSERT INTO commandes VALUES (4, 3, 50);

UPDATE commandes
SET qte = 2*qte
WHERE num_fourn = 1;

-- SELECT * FROM commandes;

DELETE FROM produit
WHERE num_prod = 2;

-- SELECT * FROM produit;

INSERT INTO commandes VALUES
    ((SELECT num_prod
     FROM produit
     WHERE nom = 'haricots'),
    (SELECT num_fourn
     FROM fournisseurs
     WHERE nom = 'navet naviguant'),
    10);

-- SELECT * FROM commandes;

SELECT COUNT(*) FROM commandes;

SELECT nom
FROM produit
ORDER BY prix DESC
LIMIT 1;

