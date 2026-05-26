# Sur-Entrainement et Sous-Entrainement



En machine learning, **overfitting** et **underfitting** décrivent deux façons dont un modèle peut mal généraliser sur de nouvelles données. c-a-d : *Être capable de faire de bonnes prédictions sur des données que le modèle n’a jamais vues pendant l’entraînement.*



Un modèle est entraîné sur un **dataset d’apprentissage** :

- Données vues → *train set*
- Données jamais vues → *test set* (ou données réelles en production)

La généralisation, c’est la capacité du modèle à rester performant sur les **données “inconnues”**.



Le phénomène **overfitting / underfitting s’applique à (presque) tous les modèles de machine learning**. Ce n’est pas une propriété d’un algorithme précis, mais **un problème de généralisation**.

Dès qu’un modèle “apprend”, il peut :

- soit **ne pas apprendre assez** → underfitting
- soit **apprendre trop précisément les données d’entraînement** → overfitting



| Famille de modèle | Underfitting | Overfitting   |
| ----------------- | ------------ | ------------- |
| Linéaire          | fréquent     | possible      |
| Arbres simples    | fréquent     | fréquent      |
| Random Forest     | rare         | modéré        |
| Boosting          | rare         | possible      |
| Deep Learning     | possible     | très fréquent |
| KNN               | possible     | fréquent      |
| SVM               | possible     | possible      |







## Résumé simple

- ✔ Overfitting / underfitting = **diagnostic issu de l’évaluation**
- ❌ Ce ne sont pas des métriques
- ✔ Ils apparaissent en comparant train vs test

## Déduction

On ne mesure pas “overfitting” directement. On le **déduit** à partir des métriques :

### Exemple avec accuracy (classification)

| Dataset | Accuracy |
| ------- | -------- |
| Train   | 0.99     |
| Test    | 0.72     |

Conclusion : **overfitting**

### Exemple avec erreur (régression)

| Dataset | RMSE |
| ------- | ---- |
| Train   | 2    |
| Test    | 15   |

Conclusion : **overfitting**

### Cas underfitting

| Dataset | Accuracy |
| ------- | -------- |
| Train   | 0.70     |
| Test    | 0.68     |

Conclusion : **underfitting** (modèle trop simple)

# Cross-validation

Avec un seul découpage :

- tu entraînes sur 70–80%
- tu testes sur 20–30%

problème :

- le résultat dépend du hasard du découpage
- tu peux avoir un test set “facile” ou “difficile”

Au lieu de faire **un seul split**, on fait **plusieurs splits**.