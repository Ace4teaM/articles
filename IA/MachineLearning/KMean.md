# Partitionnement (Clustering)

Cette méthode de prédiction non-supervisé permet de prédire des groupes sans utilisé de valeur cible.

> Le principe du clustering est de regrouper les échantillons du dataset qui se ressemblent de façon automatique. On partitionne ainsi les données en un nombre fini de sous-ensembles  cohérents que l'on peut appeler “groupes”, “classes” ou “catégories”.

L'algorithme de clustering a 2 objectifs :

1. Minimiser la différence entre les échantillons d'un même groupe. On veut des groupes denses et homogènes.
2. Maximiser la différence entre les groupes. On veut des groupes bien séparés les uns des autres.



Poser le problème ainsi amène immédiatement 3 questions (si si, 3).

* Comment définir la similarité des échantillons ?
* Comment trouver le nombre de clusters optimal ?
* Quels types d'algorithmes pour le clustering ?



# Quand l'utiliser ?

Le clustering est utilisé lorsque l'on veut comprendre le dataset sans à-priori préalable. Par exemple :

- L'analyse des données géospatiales pour déterminer les caractéristiques  spécifiques de certaines forêts dans le contexte de la biodiversité ou  de la prévention des feux. 
- L'analyse de texte pour faciliter la compréhension et l'organisation de grands  ensembles de données textuelles. Par exemple l'analyse de tous les  articles d'une publication pour identifier les thèmes principaux ou  récurrents.
- La détection d'anomalies pour regrouper les données normales dans un  cluster et en considérant toute donnée non conforme à ce cluster comme  une anomalie. 
- Et bien entendu, le marketing pour mieux cibler les clients en fonction de leurs comportements d'achat, préférences ou caractéristiques  démographiques.



# Algorithme k-means

L'[algorithme du k-means](https://scikit-learn.org/stable/modules/clustering.html#k-means) est simple et efficace. En voici les étapes principales :

- Phase d'initialisation :

1. On choisit arbitrairement un nombre de clusters K.
2. Le modèle sélectionne aléatoirement K points comme centres de clusters initiaux, appelés "**centroïdes**".

- À chaque itération :

1. **Attribution des données** : Chaque point de données est associé au cluster dont le centroïde est le plus proche.
2. **Mise à jour des centroïdes** : Les coordonnées des centroïdes des clusters sont recalculées en prenant en compte les nouveaux points.

Ce processus  itératif se répète jusqu'à ce que les centroïdes ne changent plus de  manière significative, ou après un nombre d'itérations fixé à l'avance.

Une fois le processus terminé, vous obtenez K clusters avec des points de données similaires regroupés ensemble.

> Nous obtenons des groupes de caractéristiques centrés autour de leur milieu.



## Calculer la distance entre les points et leur centroïde respectif

Un bon clustering doit regrouper au maximum les points et donc cette distance doit être minimum.



C'est ce que fait la méthode *score* du k-means de scikit-learn.

Pour le modèle ci-dessus, nous obtenons :

```
k_means.score()
```