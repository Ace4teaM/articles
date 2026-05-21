# RMSE "Rooted mean squared error"

Cette méthode de calcule est utilisé pour calculer les poids des coefficients d'un un modèle de [régression linéaire](RegressionLineaire.md) mais également pour évaluer la performance de ce modèle.

> Calcule la moyenne des écarts d'erreurs pour chaque prédiction.

Le RMSE est simplement la racine du [MSE](MSE/md)

On obtient donc la racine d'une moyenne au carré relative à la cible (unité et quantité) permettant de donner un ordre d'idée de l'erreur.

Par exemple **si la cible est une valeur foncière en €** alors la racine de la moyenne au carré donnera également  **une de l'écart type d'erreur en €**. Ex: +/- 20.000€ de la valeur réel 

Pourquoi la racine du carré ? Parce que cette méthode fait ressortir les outliers. Si le RMSE est très grand alors vous avez certaines prédictions avec un fort écart de valeur.

# Quand l'utiliser ?

RMSE s'utilise en Régression Linéaire et en complément d'autres méthodes d'évaluation tel que [R2](R2.md), [MAE](MAE.md) / [MAPE](MAPE.md) et [MSE](MSE.md).

Il permet d'obtenir une taille d'erreur relative à votre cible.

# Exemple

Dans cet exemple d'évaluation du modèle nous obtenons une note de `19116` ce qui est supérieur à l'évaluation du MAE qui est de `15514`.

```python
# .... Création du modèle et du jeu de test ....

from sklearn.metrics import mean_absolute_error, root_mean_squared_error

print("MAE : En moyenne je me trompe de ", round(mean_absolute_error(y_test, y_pred),2), "€")

print("RMSE : En moyenne je me trompe de ", round(root_mean_squared_error(y_test, y_pred),2), "€ (mais les grosses erreurs comptent beaucoup plus)")
```

Résultat:

```
MAE : En moyenne je me trompe de  15514.94 €

RMSE : En moyenne je me trompe de  19116.62 €² (mais les grosses erreurs comptent beaucoup plus)
```

