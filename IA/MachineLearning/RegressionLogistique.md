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

# Classification Binaire

Le modèle doit choisir entre **2 catégories**.

Exemples :

- Spam / Non spam
- Oui / Non
- Malade / Sain

```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report

# Dataset
data = pd.DataFrame({
    "nb_liens": [10, 0, 5, 1, 8, 0, 7, 2],
    "nb_mots": [100, 20, 80, 15, 120, 10, 90, 25],
    "spam": [1, 0, 1, 0, 1, 0, 1, 0]
})

# Variables explicatives
X = data[["nb_liens", "nb_mots"]]

# Variable cible
y = data["spam"]

# Découpage train/test
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)

# Modèle
model = LogisticRegression()

# Entraînement
model.fit(X_train, y_train)

# Prédictions
y_pred = model.predict(X_test)

# Résultats
print("Accuracy :", accuracy_score(y_test, y_pred))
print(classification_report(y_test, y_pred))
```

# Classification Multiclasse

Le modèle doit choisir **UNE classe parmi plusieurs**.

Exemples :

- Chat / Chien / Oiseau
- Rouge / Bleu / Vert
- Type de fleur Iris

```python
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report

# Chargement dataset
iris = load_iris()

X = iris.data
y = iris.target

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)

# Modèle
model = LogisticRegression(max_iter=200)

# Entraînement
model.fit(X_train, y_train)

# Prédictions
y_pred = model.predict(X_test)

# Résultats
print(classification_report(y_test, y_pred))
```



## Fonctionnement

La régression logistique calcule une probabilité pour chaque classe :

- P(setosa)
- P(versicolor)
- P(virginica)

Puis choisit la plus grande.

# Classification Multilabel

Ici une donnée peut appartenir à **PLUSIEURS classes simultanément**.

Exemples :

- Film → Action + Science-fiction
- Image → Chien + Herbe + Voiture
- Musique → Rock + Électro

Contrairement au multiclasse :

- multiclasse = UNE seule catégorie
- multilabel = plusieurs catégories possibles

```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.multiclass import OneVsRestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report

# Dataset
data = pd.DataFrame({
    "duree": [90, 120, 150, 95, 140, 110],
    "explosions": [0, 1, 1, 0, 1, 0],
    "humour": [1, 0, 0, 1, 0, 1],

    # Labels multiples
    "Action": [0, 1, 1, 0, 1, 0],
    "Comedie": [1, 0, 0, 1, 0, 1],
    "ScienceFiction": [0, 1, 1, 0, 1, 0]
})

X = data[["duree", "explosions", "humour"]]

y = data[["Action", "Comedie", "ScienceFiction"]]

# Split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)

# Modèle multilabel
model = OneVsRestClassifier(LogisticRegression())

# Entraînement
model.fit(X_train, y_train)

# Prédictions
y_pred = model.predict(X_test)

print(classification_report(y_test, y_pred))
```

## Pourquoi `OneVsRestClassifier` ?

Parce qu’on entraîne :

- un modèle pour Action
- un modèle pour Comédie
- un modèle pour Science-fiction

Chaque modèle répond indépendamment :

- oui/non