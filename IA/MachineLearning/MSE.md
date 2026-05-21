# MSE "Mean squared error"

Cette méthode de calcule est utilisé pour calculer les poids des coefficients d'un un modèle de [régression linéaire](RegressionLineaire.md) mais également pour évaluer la performance de ce modèle.

> Mesure l’erreur moyenne d’un modèle de régression, mais en **mettant les erreurs au carré**

On obtient donc une moyenne au carré relative à la cible (unité mais pas en quantité) permettant de donner un ordre d'idée de l'erreur.

Par exemple **si la cible est une valeur foncière en €** alors la moyenne au carré donnera **une valeur exponentiel de l'écart type d'erreur de prédiction du prix en €**. Ex: +/- 20.000€ de la valeur réel 

Pourquoi au carré ? Parce que cette méthode fait ressortir les outliers. Si votre valeur est très grande vous avez certaines prédictions avec un fort écart de valeur.

Le RMSE remet l’erreur dans la bonne unité.

# Quand l'utiliser ?

MSE s'utilise en Régression Linéaire et en complément d'autres méthodes d'évaluation tel que [R2](R2.md), [MAE](MAE.md) / [MAPE](MAPE.md) et [RMSE](RMSE.md).

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

