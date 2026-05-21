# Régression logistique (ou classification)

Cette méthode de prédiction supervisé fonctionne bien pour prédire un valeur à partir de 1 ou plusieurs prédicteurs.

Nous avons donc :

* 1 variable cible (la prédiction)

* 1 ou plusieurs variables prédicteur (les prédicteur)

Dans une classification, la variable cible est une catégorie et non une valeur continue comme dans la régression linéaire.

Il existe plusieurs types de classifications: **binaire**, **multiclasse** ou **multilabel**.

* **binaire**: la variable cible prend 2 valeurs exclusives : 0 ou 1 ...
* **multiclasse**: la variable cible peut prendre plus de 2 valeurs soit: **ordonné** (ex: 1, 2, 3; mauvais, moyen, bon) soit **nominal** (ex: couleurs; nationalités; styles de musiques)
* **multilabel**: la variable cible peut appartenir à plusieurs catégories à la fois (ex: personne est à la fois un Humain, un Mammifère et un Bipède)

Le principe général de modélisation est similaire à celui de la  régression ; ce qui va surtout changer, ce sont les métriques de score  des modèles et leur interprétation. On va adapter la régression linéaire au cas de la classification en  interprétant la prédiction de la régression linéaire, comme une des  catégories de la variable cible.

Prenons le cas d'une régression linéaire à 1 prédicteur :

```
poids = a_1 * taille + bruit
```

Ici `poids` est continue et potentiellement peut prendre toute valeur réelle

Imaginons une fonction  *f*  qui projette   *poids*  dans l'intervalle [0,1] :

On peut interpréter la variable résultante comme étant la probabilité que la prédiction soit dans une des  catégories. En considérant par exemple un seuil de classification de  0.5  .

- si  f(poids) &lt; 0.5  alors catégorie Maigre.
- si  f(poids) &gt;= 0.5  alors catégorie Fort.

On peut donc appliquer une régression linéaire, projeter le résultat dans l'intervalle [0,1]  et interpréter cette valeur comme la probabilité d'appartenance à une des catégories souhaitées.

> Cette fonction de projection de toute valeur réelle dans l'intervalle  [0,1] existe et elle s'appelle la [**fonction** **logistique**](https://fr.wikipedia.org/wiki/Fonction_logistique_(Verhulst)).

# Limitations

**Attention**: Une régression linéaire ne fonctionne que si les prédicteurs sont eux-mêmes linéaires, sinon la méthodes n'est pas adapté et il faudra opter pour un autre algorithme.

Supposons que nous ayons une relation quadratique entre la variable cible et un prédicteur *y*=*a*∗*x*2 + du bruit comme sur le graphe ci-dessous. On voit bien que la droite  de la régression linéaire n'explique en rien la relation entre le  prédicteur et la cible.

![16977174396552_image29.png](16977174396552_image29.png)

# Fiabilité

## Vérifier la linéarité

Comparons nos candidats dans des nuages de points

![2026-05-11 111939.png](2026-05-11 111939.png)

**Si:**

- une droite → bon candidat
- une courbe → relation non linéaire (transformations possibles)
- un nuage sans structure → peu utile

### Corrélation de Pearson

Elle mesure la force d’une relation linéaire :

- proche de **+1 / -1** → bon signal
- proche de **0** → faible intérêt linéaire

En Python :

```
df.corr(numeric_only=True)
```

Ou avec une variable :

```
from scipy.stats import pearsonr
pearsonr(X, y)
```

⚠️ Attention : corrélation ≠ causalité.

## Rapporter tous les prédicteurs à une même plage

**Des variations d'amplitude significative peuvent fausser l'importance des coefficients**

Une autre précaution utile concerne l'amplitude respective des variables.

Les valeurs des coefficients de la régression linéaire sont en effet  inversement proportionnelles à l'amplitude de la variable associée.

Si une variable est 1 000 fois plus grande en moyenne qu'une autre  variable, et si ces 2 variables ont le même pouvoir de prédiction sur la variable cible, alors le coefficient de la grande variable sera  1 000 fois plus petit que celui de la deuxième variable.

En normalisant les variables afin que leur amplitude soit comprise dans un intervalle comparable, chaque coefficient de la régression linéaire  reflète directement l'impact de la variable sur la variable cible, son  pouvoir de prédiction.

![c52ab863-4ad4-4661-b184-7eda7eccdad7.png](c52ab863-4ad4-4661-b184-7eda7eccdad7.png)

**Application avec python**

![267ace3d-2d02-4d00-b7ec-d7b076a034d4.png](267ace3d-2d02-4d00-b7ec-d7b076a034d4.png)