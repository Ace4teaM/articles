# MAE "Mean absolute error"

Cette méthode de calcule est utilisé pour évaluer la performance d'un modèle de [régression linéaire](RegressionLineaire.md).

> Calcule la moyenne des écarts d'erreurs pour chaque prédiction.

On obtient donc une valeur moyenne relative à la cible (unité et quantité) permettant de donner un ordre d'idée de l'erreur.

Par exemple **si la cible est une valeur foncière en €** alors le résultat sera **l'écart type moyen de la valeur foncière en €**. Ex: +/- 2.000€ de la valeur réel 



Exemple:

| Prédit    | Attendu   | Erreur   |
| --------- | --------- | -------- |
| 200.000 € | 210.000 € | 10.000 € |
| 120.000 € | 122.000 € | 2.000 €  |
| 90.000 €  | 90.500 €  | 500 €    |

Résultat: (10.000 + 2.000 + 500) / 3 = **4166.6 €** = MAE



Vous pouvez également utiliser [MAPE](MAPE.md) pour rapporter le résultat à un **%**

# Quand l'utiliser ?

MAE s'utilise en Régression Linéaire et en complément d'autres méthodes d'évaluation tel que [R2](R2.md), [MSE](MSE.md) / [MAPE](MAPE.md) et [RMSE](RMSE.md).

Il permet d'obtenir une mesure d'erreur relative à votre cible.

# Exemple

Dans cet exemple d'évaluation du modèle nous obtenons une note de `0.981` ce qui est presque parfais pour un modèle.

```python
# .... Création du modèle et du jeu de test ....

from sklearn.metrics import mean_absolute_error

print("MAE : En moyenne je me trompe de ", round(mean_absolute_error(y_test, y_pred),2), "€")
```

Résultat:

```
MAE : En moyenne je me trompe de 15514.94 € 
```

