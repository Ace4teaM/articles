# Différences des principales syntaxes SQL

## Introduction
Dans cet article je vais vous présenter les principales pratiques du langage SQL dans sa syntaxe standardisé et les principaux SGBD du marché.

Dans l’idéal pour écrire des requêtes SQL il est préférable d’utiliser le standard international, cela vous évitera une refonte total de votre base de données et programmes client lors d’un changement de SGBD (Système de gestion de base de données).

Cependant, les syntaxes propriétaires introduites par Microsoft, Oracle et les innombrables fournisseur de SGBD ne vous permettent pas d’écrire du code standardisé mais au contraire vous permet de simplifier et optimiser vos requêtes.

Cet article peut être utilisé comme une aide-mémoire pour trouver comment faire tel ou tel chose dans le SGBD de votre choix.

## Création de la base de données

SQL98 / SQLite

```sql
CREATE DATABASE [NAME]
```

SQL Server

```sql
CREATE DATABASE [NAME] COLLATE [COLLATION]
```

Postgres

```sql
CREATE DATABASE [NAME]
```

Oracle

```sql
CREATE DATABASE [NAME]
```

## Clé primaire auto incrémentée

SQL98 / SQLite

```sql
...
```

SQL Server

```sql
create table client (
	client_id int identity
);
```

## UPDATE / SELECT
Il est souvant utile de mettre a jour une table avec les données d'une autre. Combiner une instruction SELECT avec un update permet de réaliser cette action.

Dans notre cas le code met à jour plusieurs tables avec une sélection unique
	
SQL98 / SQLite

```sql
WITH c
( SELECT NOM, PRENOM FROM CLIENT )
UPDATE
CLIENT_FIDELE cf SET cf.NOM = c.NOM, cf.PRENOM = c.PRENOM
WHERE
c.CLIENT_ID = 10 AND cf.CLIENT_ID = c.CLIENT_ID
```


SQL Server

```sql
UPDATE CLIENT_FIDELE
	SET rang = rang+1
	FROM CLIENT_FIDELE cf
	CROSS APPLY (SELECT NOM, PRENOM FROM CLIENT) c
	WHERE c.nom = cf.nom and c.prenom = cf.prenom;
```

ou

```sql
UPDATE CLIENT_FIDELE
	SET rang = rang+1
	FROM CLIENT_FIDELE cf
	inner join CLIENT c on c.nom = cf.nom and c.prenom = cf.prenom
	;
```

## INSERT / SELECT
Ajouter plusieurs n entrées depuis une sélection multiple est possible et très partique pour copier des données d'une base à une autre par exemple.

	...

## SELECT depuis une autre base de données



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)