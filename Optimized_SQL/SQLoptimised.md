# SQL - Under the hood

## SGBD (Système de Gestion de Base de Données)
Logiciel qui permet de stocker, organiser, manipuler et récupérer des données de manière structurée.

ex: PostgreSQL, MySQL, MariaDB, Oracle, SQL Server, SQLite

---

## ACID
ACID regroupe 4 propriétés qui garantissent qu'une transaction est fiable :

- **A — Atomicité** : Une transaction, c'est tout ou rien. Si une étape échoue, tout est annulé comme si rien ne s'était passé.
- **C — Cohérence** : La base passe toujours d'un état valide à un autre état valide. Les règles définies (contraintes, clés étrangères…) sont toujours respectées.
- **I — Isolation** : Deux transactions simultanées ne se voient pas entre elles. Chacune se déroule comme si elle était seule.
- **D — Durabilité** : Une fois une transaction validée (commit), les données sont sauvegardées définitivement, même en cas de panne ou coupure de courant.

---

## Langage procédural (Python) VS Langage ensembliste (SQL)

- **Procédural** : Tu décris comment faire, étape par étape.
- **Ensembliste** : Tu décris ce que tu veux, pas comment l'obtenir. La SGBD se débrouille pour trouver le chemin le plus efficace.

Avec SQL, la SGBD dispose d'un optimiseur de requêtes qui choisit automatiquement la meilleure façon d'accéder aux données (utiliser un index, l'ordre des jointures, etc.).

> **Attention** : La différence SQL/Python c'est que SQL t'oblige à penser en ensembles, Python te laisse le choix. Cela ne veut pas dire que Python ne peut pas faire d'opérations ensemblistes (eg: numpy, etc). Donc pas confondre langage ensembliste avec opération ensembliste.

---

## Les index en SQL

```sql
CREATE INDEX idx_ville ON clients(ville);
```

> **nb** : L'index est une structure complètement séparée de ta table. Ta table reste exactement comme elle est, tu ne la touches pas, tu n'ajoutes aucune colonne.

Sans index, SQL fait un **full table scan** — il lit toutes les lignes une par une pour trouver ce que tu cherches. **O(n)**

Un index c'est une structure à part qui contient :
1. Les valeurs de la colonne indexée, triées
2. Un pointeur vers la vraie ligne dans la table

### Dichotomie et B-Tree

**La dichotomie (recherche binaire)** : C'est l'algorithme qui exploite le fait que c'est trié. À chaque étape tu divises par 2 l'espace de recherche.

**Le B-Tree (Balanced Tree)** : C'est la structure de données concrète qui implémente cette idée sous forme d'arbre.

Dans le B-Tree, chaque entrée de l'index contient :
- La valeur indexée (ex: "Paris")
- Un pointeur vers la vraie ligne dans la table (son adresse physique sur le disque)

C'est exactement le même concept qu'en C — une référence vers un emplacement mémoire/disque plutôt que la donnée elle-même.

1. Tu pars de la racine
2. À chaque nœud tu vas à gauche ou à droite selon la valeur
3. Tu arrives à ta donnée en **O(log n)** — c'est la notation pour dire "je divise par 2 à chaque étape"

### Problème avec les index

L'index doit rester toujours à jour et équilibré, donc :

- **INSERT** → il faut ajouter une entrée dans le B-Tree et potentiellement le rééquilibrer
- **UPDATE** → il faut déplacer l'entrée
- **DELETE** → il faut supprimer l'entrée

Donc plus tu as d'index sur une table, plus tes écritures sont lentes.

### Compromis fondamental

|            | Lecture   | Écriture  |
|------------|-----------|-----------|
| Sans index | 🐢 Lent   | ✅ Rapide |
| Avec index | ✅ Rapide | 🐢 Lent   |

> **La règle pratique** : on n'indexe pas tout — on indexe les colonnes souvent lues, rarement écrites.

---

## Types et mémoires

> **NB** : plus le type est petit et fixe, plus c'est rapide à comparer et à stocker. Par exemple INT vaut mieux que VARCHAR pour jointure optimale.

### Numériques entiers

| Type     | Taille   | Plage                        |
|----------|----------|------------------------------|
| TINYINT  | 1 octet  | -128 à 127                   |
| SMALLINT | 2 octets | -32 768 à 32 767             |
| INT      | 4 octets | -2 milliards à 2 milliards   |
| BIGINT   | 8 octets | très très grand              |

### Numériques décimaux

| Type        | Taille   | Usage                      |
|-------------|----------|----------------------------|
| FLOAT       | 4 octets | Approximatif (scientifique)|
| DOUBLE      | 8 octets | Approximatif, plus précis  |
| DECIMAL(p,s)| Variable | Exact — finances, prix     |

> DECIMAL est important — FLOAT et DOUBLE ont des erreurs d'arrondi, donc pour de l'argent on utilise toujours DECIMAL.

> Note que int/int renvoie un int donc peut être un trap, nécessité de caster (changer type) eg : 2/3 renvoit 0 => CAST(2 AS FLOAT) / 3 

### Texte

| Type      | Taille           | Usage                    |
|-----------|------------------|--------------------------|
| CHAR(n)   | n octets fixe    | Code pays "FR", genre "M/F" |
| VARCHAR(n)| 1-n octets variable | Noms, villes, emails  |
| TEXT      | Jusqu'à 65 000 caractères | Longs textes    |

> La diff CHAR vs VARCHAR : CHAR réserve toujours la place fixe même si la valeur est plus courte. VARCHAR s'adapte.

### Dates

| Type      | Taille   | Contient                    |
|-----------|----------|-----------------------------|
| DATE      | 3 octets | Jour/mois/année             |
| TIME      | 3 octets | Heures/minutes/secondes     |
| DATETIME  | 8 octets | Les deux                    |
| TIMESTAMP | 4 octets | Les deux, mais limité à 2038|

### Autres

| Type    | Taille   | Usage                      |
|---------|----------|----------------------------|
| BOOLEAN | 1 octet  | Vrai/Faux                  |
| UUID    | 16 octets| Identifiant unique universel|

## Ordre d'exécution d'une requête

| Étape | Clause | Ce qui se passe |
|---|---|---|
| 1 | FROM / JOIN | Quelles tables ? |
| 2 | WHERE | Filtre les lignes brutes |
| 3 | GROUP BY | Agrège en groupes |
| 4 | HAVING | Filtre les groupes agrégés |
| 5 | SELECT | Calcule colonnes et alias |
| 5b | Window functions | LAG, RANK, ROW_NUMBER... |
| 6 | ORDER BY | Trie |
| 7 | TOP / LIMIT | Limite les lignes |

En gros commence toujours par FROM et finit par SELECT + organisation (order by etc) de ce qui est sélectionné.

> Where et Having : Where avant groupby donc sur les lignes brutes, having filtre groupes aggrégés après group by.

## Plans d'exécution — signaux d'alarme

### Activer les statistiques

```sql
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT * FROM USERS
```

A tout à voir avec les index (plus haut)

| Signal | Niveau | Problème | Solution |
|---|---|---|---|
| Index Seek | ✅ | Aucun | C'est parfait |
| Index Scan | 🟡 | Index pas assez ciblé | Réécrire le filtre |
| Table Scan | 🔴 | Lit toute la table | Ajouter un index |
| Hash Match | 🔴 | Jointure coûteuse | Indexer la colonne de jointure |
| Sort | 🟡 | Tri coûteux | Index sur la colonne ORDER BY |
| Key Lookup | 🔴 | Retour en table après index | Éviter SELECT * |

Règle d'or : Seek = bien, Scan = mal

## Règles d'optimisation

❌ À éviter :
- SELECT * → charge inutilement
- Fonction dans le WHERE → bloque l'index : WHERE YEAR(date) = 2026
- LIKE '%mot' → scan complet
- Jointure sur colonne non indexée

✅ À faire :
- SELECT uniquement les colonnes nécessaires
- Filtres directs sur colonnes : WHERE date >= '2026-01-01'
- LIKE 'mot%' → peut utiliser l'index
- Joindre sur PK/FK → déjà indexées automatiquement

## Procédures stockées & Triggers

### Procédure stockée

**Utilité** : traitement manuel déclenché explicitement — ETL, changements d'état,
traitements batch. Peut modifier des données (INSERT, UPDATE, DELETE).
Équivalent dbt : aucun direct — dbt est déclaratif, les procédures sont impératives.
Trouve équivalent conceptuel dans une fonction.

```sql
-- Création
CREATE PROCEDURE nom_procedure
    @param1 NVARCHAR(50),
    @param2 INT
AS
BEGIN
    BEGIN TRY
        -- ta logique ici
        UPDATE ma_table SET col = @param2 WHERE col2 = @param1
        PRINT 'Succès'
        RETURN 0
    END TRY
    BEGIN CATCH
        RAISERROR('Erreur : %s', 16, 1, ERROR_MESSAGE())
        RETURN 1
    END CATCH
END

-- Appel
EXEC nom_procedure @param1 = 'valeur', @param2 = 1
```

### Trigger

**Utilité** : déclenchement automatique et invisible à chaque INSERT/UPDATE/DELETE.
Watch/surveille une table.
Parfait pour l'historisation, l'audit, la validation.
Ne jamais appeler manuellement — SQL Server le fait tout seul.

```sql
-- Création
CREATE TRIGGER nom_trigger
ON ma_table
AFTER INSERT, UPDATE  -- ou DELETE
AS
BEGIN
    -- Tables magiques disponibles :
    -- INSERTED → nouvelles valeurs (INSERT et UPDATE)
    -- DELETED  → anciennes valeurs (UPDATE et DELETE)

    INSERT INTO ma_table_historique (ACTION, col1, col2)
    SELECT
        CASE
            WHEN EXISTS (SELECT 1 FROM DELETED) THEN 'UPDATE'
            ELSE 'INSERT'
        END,
        col1,
        col2
    FROM INSERTED
END
```

### Différence clé

| | Procédure | Trigger |
|---|---|---|
| Déclenchement | Manuel — EXEC | Automatique sur INSERT/UPDATE/DELETE |
| Qui l'appelle ? | Toi ou un Job | SQL Server lui-même |
| Usage typique | ETL, traitements, calculs | Historisation, audit |
| Paramètres | ✅ Oui | ❌ Non |