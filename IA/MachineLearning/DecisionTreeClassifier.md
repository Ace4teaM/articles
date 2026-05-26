# Arbre de décision

Cette méthode de prédiction est un modèle qui apprend en se basant sur des seuils de décisions.

> Si la feature X > seuil → aller à gauche, sinon → aller à droite

Il ne s'agit pas de définir des seuil manuellement mais automatiquement en appliquant la règle suivante:

1. choisit une feature
2. choisit un seuil
3. coupe les données en 2
4. répète récursivement
5. s’arrête selon des règles (`max_depth`, `min_samples_split`, `min_samples_leaf` et `min_impurity_decrease`)

# Où l'utiliser ?

Pour la **classification** (prédire une catégorie) ou la **régression** (prédire une valeur) avec `DecisionTreeClassifier` et `DecisionTreeRegressor`

# Quand l'utiliser ?

**Quand les données sont non linéaires**

Les arbres gèrent très bien :

- relations complexes
- interactions entre variables
- seuils naturels

pas besoin de normalisation

**Quand les données sont mixtes**

- numériques + catégorielles
- pas besoin de standardisation

**Comme baseline rapide**

Très bon modèle “première approche”

- rapide à entraîner
- bon point de départ

# Quand ne pas l'utiliser ?

Si besoin de  :

- très haute performance
- stabilité
- robustesse

préfèrer :

- Random Forest
- XGBoost / LightGBM
