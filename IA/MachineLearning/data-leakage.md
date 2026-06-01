# Data Leakage

Le **Data Leakage** (ou *fuite de données*) en Machine Learning correspond à une situation où :

> le modèle apprend des informations qu’il ne devrait pas connaître au moment réel de la prédiction.

Résultat :

- les performances semblent excellentes pendant l’entraînement,
- mais le modèle échoue en production.

C’est l’un des problèmes les plus trompeurs en ML.

# Idée intuitive

Imagine un examen :

- normalement tu révises avant,
- mais quelqu’un te donne les réponses exactes pendant le test.

Tu obtiens :

- 20/20 au test,
- mais tu n’as rien réellement appris.

Le Data Leakage est exactement ça.

------

# Exemple simple

Tu veux prédire :

> “Un client va-t-il quitter l’entreprise ?”

Features :

- âge,
- ancienneté,
- nombre d’achats,
- etc.

Mais par erreur tu ajoutes :

```
date_de_resiliation
```

Or cette donnée :

- n’existe qu’après le départ du client.

Le modèle comprend immédiatement :

- si une date de résiliation existe → le client partira.

Accuracy :

- 99%.

Mais en production :

- impossible d’avoir cette info à l’avance.

Le modèle devient inutile.

# Pourquoi c’est dangereux

Le leakage :

- donne de faux bons résultats,
- masque les vrais problèmes,
- crée des modèles impossibles à utiliser réellement.

Tu crois avoir :

- un excellent modèle,

mais tu as :

- un modèle qui triche.

# Les principaux types de Data Leakage

# 1. Target Leakage (le plus fréquent)

La feature contient directement ou indirectement la réponse.

Exemple :
 Prédire :

```
maladie = oui/non
```

Mais les features contiennent :

```
prise_medicament_specifique
```

Or ce médicament :

- n’est donné qu’aux malades.

Le modèle apprend :

```
médicament ⇒ malade
```

sans apprendre la vraie logique médicale.

# 2. Leakage temporel

Très fréquent avec :

- séries temporelles,
- finance,
- prédiction métier.

Le modèle utilise des données du futur.

## Mauvais exemple

Prédire :

> ventes de demain

Mais ton dataset contient :

```
moyenne_ventes_semaine
```

calculée avec :

- les ventes futures.

Le modèle “voit le futur”.

# 3. Leakage pendant le preprocessing

Très fréquent chez les débutants.

## Mauvaise pratique

Tu fais :

```
scaler.fit(X_total)
```

avant le split train/test.

Donc :

- le scaler apprend aussi les statistiques du test set.

Le modèle connaît déjà :

- moyenne,
- variance,
- distribution du test.

## Bonne pratique

```
scaler.fit(X_train)

X_train = scaler.transform(X_train)
X_test = scaler.transform(X_test)
```

# 4. Leakage via duplication

Le train et le test contiennent :

- les mêmes clients,
- mêmes images,
- mêmes lignes proches.

Le modèle mémorise au lieu d’apprendre.

# Symptômes typiques

## Résultats “trop beaux”

Exemple :

- accuracy = 99.9%
- problème très complexe.

→ suspect.

## Écart énorme production / test

- excellent en validation,
- catastrophique en réel.

## Features “magiques”

Une variable semble :

- prédire parfaitement la cible.

Souvent :

- elle fuit la target.

# Exemple concret complet

Supposons :

```
Prédire si un prêt sera remboursé
```

Features :

- salaire,
- âge,
- historique bancaire.

Mais tu ajoutes :

```
nombre_de_relances_bancaires
```

Or :

- les relances arrivent après les impayés.

Le modèle apprend :

```
beaucoup de relances ⇒ défaut
```

mais cette info n’existe pas au moment d’accorder le prêt.

# Comment éviter le Data Leakage

## 1. Toujours penser :

> “Cette donnée existe-t-elle réellement au moment de la prédiction ?”

C’est LA question clé.

## 2. Split avant preprocessing

Toujours :

1. split train/test,
2. fit preprocessing sur train uniquement.

## 3. Respecter le temps

Pour les séries temporelles :

- ne jamais mélanger passé et futur.

Utiliser :

- validation chronologique,
- TimeSeriesSplit.

## 4. Vérifier les features suspectes

Questions utiles :

- cette variable est-elle créée après l’événement ?
- contient-elle indirectement la cible ?
- est-elle mise à jour plus tard ?

# Différence avec Overfitting

Le leakage et l’overfitting sont différents.

## Overfitting

Le modèle :

- apprend trop bien le train,
- mémorise le bruit.

Mais il reste “honnête”.

## Data Leakage

Le modèle :

- possède des informations interdites.

Il triche.

# En résumé

Le **Data Leakage** est :

> une fuite d’information entre les données de prédiction et la réponse attendue.

Le modèle obtient :

- des informations du futur,
- ou des indices cachés sur la cible.

Conséquences :

- scores artificiellement élevés,
- modèle inutilisable en production.

C’est un des problèmes les plus critiques en Machine Learning.
