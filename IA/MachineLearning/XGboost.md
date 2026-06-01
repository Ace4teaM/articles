# XGBoost

XGBoost est une bibliothèque de Machine Learning très puissante basée sur une idée simple mais très efficace :

> combiner plusieurs “petits modèles faibles” (des arbres de décision) pour obtenir un modèle final très performant.

C’est l’une des méthodes les plus utilisées en data science pour des données tabulaires (CSV, bases métier, scoring, fraude, etc.).

# L’idée de base : le boosting

XGBoost appartient à la famille du **Gradient Boosting**.

L’idée :

1. On entraîne un premier petit modèle (souvent un arbre de décision).
2. Il fait des erreurs.
3. Un deuxième modèle est entraîné pour corriger ces erreurs.
4. Puis un troisième corrige les erreurs restantes.
5. Etc.

Au final :

> on additionne tous les petits modèles pour obtenir une forte prédiction.

# Intuition simple

Imagine :

- un étudiant faible (modèle 1),
- un deuxième qui corrige ses erreurs,
- un troisième qui corrige encore,
- etc.

Chaque modèle :

> apprend ce que les précédents ont mal fait.

# Pourquoi XGBoost est spécial ?

XGBoost améliore le boosting classique avec :

## Optimisation très rapide

- calculs parallélisés,
- utilisation efficace CPU/GPU.

## Arbres de décision optimisés

Les modèles de base sont des :

- arbres de décision peu profonds (weak learners).

## Régularisation intégrée

XGBoost ajoute :

- L1 (Lasso),
- L2 (Ridge),

→ pour éviter le surapprentissage.

## Gestion des valeurs manquantes

Le modèle apprend automatiquement :

- comment traiter les NaN.

## Optimisation du gradient

Il utilise le **gradient de la fonction de perte** pour savoir :

> dans quelle direction corriger les erreurs.

# Fonctionnement simplifié

On veut prédire y :

### Étape 1

```
modèle 1 → prédiction grossière
```

### Étape 2

```
erreur = y - prédiction
modèle 2 apprend ces erreurs
```

### Étape 3

```
modèle 3 corrige encore les erreurs restantes
```

# Forme mathématique (simplifiée)

Le modèle final est :

```
prediction = somme(des arbres faibles)
```

Chaque arbre ajoute une petite correction.

# Exemple concret

Prédire le prix d’une maison :

### Modèle 1

- estime juste avec **surface** comme feature
- erreur importante

### Modèle 2

- corrige avec **localisation**

### Modèle 3

- corrige avec **nombre de pièces**

### Résultat

→ prédiction très précise

# Pourquoi XGBoost est si utilisé ?

## Très performant sur données tabulaires

Souvent meilleur que :

- régression logistique,
- random forest,
- réseaux de neurones simples.

## Fonctionne très bien sans gros tuning

- robuste,
- stable.

## Gère bien les données réelles

- valeurs manquantes,
- variables hétérogènes.

# Comment XGBoost combine les arbres de décision

XGBoost construit une prédiction comme une somme :

```
ŷ(x) = arbre1(x) + arbre2(x) + arbre3(x) + ...
```

Chaque arbre ne donne pas une prédiction complète :

> il apporte une **petite correction**.

## Comment ça fonctionne étape par étape

### Étape 0 : prédiction initiale

On commence avec une prédiction très simple :

- souvent la moyenne (régression),
- ou une probabilité log-odds (classification).

```
ŷ0 = constante
```

### Étape 1 : premier arbre

On calcule les erreurs :

```
erreur = y - ŷ0
```

Puis on entraîne un arbre qui essaie de prédire ces erreurs.

```
arbre1 ≈ erreurs
```

Nouvelle prédiction :

```
ŷ1 = ŷ0 + arbre1(x)
```

### Étape 2 : deuxième arbre

On recalcule les erreurs restantes :

```
erreur2 = y - ŷ1
```

Puis :

```
arbre2 apprend erreur2
```

Nouvelle prédiction :

```
ŷ2 = ŷ1 + arbre2(x)
```

### Étape 3 : répétition

On continue :

```
ŷ3 = ŷ2 + arbre3(x)
```

# Comparaison avec Random Forest

| Aspect             | Random Forest       | XGBoost                          |
| ------------------ | ------------------- | -------------------------------- |
| Méthode            | bagging             | boosting                         |
| Construction       | arbres indépendants | arbres séquentiels               |
| Correction erreurs | non                 | oui                              |
| Performance        | bonne               | souvent meilleure                |
| Overfitting        | plus stable         | plus puissant mais plus sensible |

# Inconvénients

XGBoost n’est pas parfait :

- peut overfitter si mal réglé,
- plus complexe à tuner,
- moins interprétable qu’un arbre simple,
- moins adapté aux images/texte brut (où deep learning est meilleur).

# Quand l’utiliser ?

Très bon choix pour :

- scoring bancaire,
- fraude,
- churn (départ client),
- données tabulaires classiques,
- compétitions Kaggle.

# En résumé

XGBoost est :

> un modèle de Machine Learning basé sur des arbres de décision construits séquentiellement, où chaque nouvel arbre corrige les erreurs des précédents.

C’est :

- rapide,
- puissant,
- robuste,
- et souvent un des meilleurs choix “par défaut” en ML tabulaire.