# MAPE "Mean absolute percentage error"

Cette méthode de calcule est utilisé pour évaluer la performance d'un modèle de [régression linéaire](RegressionLineaire.md).

> Calcule la moyenne en pourcentage des écarts d'erreurs pour chaque prédiction.

On obtient donc une valeur moyenne relative à la cible (unité mais en %) permettant de donner un ordre d'idée de l'erreur.

Par exemple **si la cible est une valeur foncière en €** alors le résultat sera **l'écart type moyen de la valeur foncière en %**. Ex: +/- 2% de la valeur cible



Le MAPE répond à :

> “De combien de % mon modèle se trompe-t-il en moyenne ?”



Exemple:

| Prédit    | Attendu   | Erreur |
| --------- | --------- | ------ |
| 200.000 € | 210.000 € | 5 %    |
| 120.000 € | 122.000 € | 1.6 %  |
| 90.000 €  | 90.500 €  | 0.55 % |

Résultat: (5 + 1.6 + 0.55) / 3 = **7.15 %** = MAPE



Vous pouvez également utiliser [MAE](MAE.md) pour rapporter le résultat à un quantitatif en **€**

# Quand l'utiliser ?

MAPE s'utilise en Régression Linéaire et en complément d'autres méthodes d'évaluation tel que [R2](R2.md), [MSE](MSE.md) / [MAE](MAE.md) et [RMSE](RMSE.md).

Il permet d'obtenir une mesure d'erreur relative à un pourcentage.

# Exemple

Dans cet exemple d'évaluation du modèle nous obtenons une note de `0.981` ce qui est presque parfais pour un modèle.

```python
# .... Création du modèle et du jeu de test ....

from sklearn.metrics import mean_absolute_percentage_error

print("MAPE : En moyenne je me trompe de ", round(mean_absolute_percentage_error(y_test, y_pred),2), "%")
```

Résultat:

```
MAPE : En moyenne je me trompe de  0.06 %
```

