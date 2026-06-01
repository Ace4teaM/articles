# Forêt aléatoire

Le modèle de **Random Forest** (forêt aléatoire) est un des algorithmes les plus utilisés en Machine Learning car il est :

- simple à utiliser,
- performant sans beaucoup de réglages,
- robuste au bruit,
- capable de gérer des relations non linéaires.

Il peut servir :

- à faire de la **régression** → prédire une valeur numérique,
- à faire de la **classification** → prédire une catégorie.



Un **Random Forest** est un ensemble de plusieurs **arbres de décision**.

Chaque arbre :

- apprend une version légèrement différente des données,
- fait sa propre prédiction.

Ensuite :

- en classification → les arbres votent,
- en régression → on fait la moyenne.



## Régression (valeur continue)

```python
from sklearn.ensemble import RandomForestRegressor

model = RandomForestRegressor(
    n_estimators=100, # Nombre d’arbres, Plus il y a d’arbres, plus le modèle est puissant, mais aussi plus lent à entraîner
    random_state=42 # Profondeur maximale, trouver le bon équilibre entre la performance et le risque de surapprentissage
)

model.fit(X_train, y_train)
```



## Exemple simple

Supposons que l’on veut prédire le prix d’une maison :

Variables :

- surface
- nombre de pièces
- âge

Un arbre pourrait décider :

```
Si surface > 100m² :
    Si quartier = centre :
        Prix = 450000
    Sinon :
        Prix = 300000
Sinon :
    Prix = 180000
```

Le problème :

- un seul arbre peut facilement sur-apprendre (overfitting).

Le Random Forest résout cela en créant :

- beaucoup d’arbres,
- sur des sous-parties aléatoires des données.
