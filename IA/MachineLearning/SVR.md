# SVM pour la régression (valeur continue)

La **prédiction par SVM (Support Vector Machine)** avec scikit-learn consiste à entraîner un modèle qui sépare (ou approxime) des données en trouvant une frontière optimale.

Je t’explique simplement le principe + comment ça se fait concrètement en Python.

# C’est quoi un SVM ?

Un SVM cherche une **frontière de décision** (hyperplan) qui sépare les classes en maximisant la marge entre elles.

- En classification : on sépare des classes (ex: spam / non spam)
- En régression : on approxime une fonction (SVR)

L’idée clé : **choisir la séparation la plus robuste possible**, pas juste une séparation correcte.

- Le SVR sert à **prédire une valeur continue** (prix, température, demande, etc.).

  Mais contrairement à une régression classique :

  - au lieu de “coller” la courbe à tous les points
  - il accepte une **zone d’erreur tolérée**

Cette zone s’appelle le **tube ε (epsilon-insensitive tube)**

# Image mentale simple

Imagine une courbe de prédiction :

```
        zone de tolérance (ε)
     -----------------------------
      •    •     •      •   •
        •       •   •
     -----------------------------
          courbe SVR
```

Tout point **dans le tube ε n’est pas pénalisé**

# Comment SVR apprend ?

SVR cherche une fonction :

- la plus **simple possible**
- qui passe “au milieu” des données
- tout en tolérant une erreur ε

Et il ne retient que certains points importants :
les **support vectors**

# Exemple simple (prix de maison)

## Données :

| Surface (m²) | Prix (€) |
| ------------ | -------- |
| 50           | 150 000  |
| 60           | 180 000  |
| 80           | 240 000  |
| 100          | 300 000  |

## Code SVR :

```python
from sklearn.svm import SVR
from sklearn.preprocessing import StandardScaler
import numpy as np

# données
X = np.array([[50],[60],[80],[100]])
y = np.array([150000,180000,240000,300000])

# normalisation (très importante pour SVR)
scaler_X = StandardScaler()
scaler_y = StandardScaler()

X_scaled = scaler_X.fit_transform(X)
y_scaled = scaler_y.fit_transform(y.reshape(-1,1)).ravel()

# modèle SVR
model = SVR(kernel="rbf", C=100, epsilon=0.1)
model.fit(X_scaled, y_scaled)

# prédiction
prediction = model.predict(scaler_X.transform([[70]]))
prix = scaler_y.inverse_transform(prediction.reshape(-1,1))

print(prix)
```

# Interprétation du résultat

Si on demande une maison de 70 m² :

- le modèle ne cherche pas une interpolation exacte
- il donne une valeur basée sur la tendance globale

# Rôle des paramètres importants

## epsilon (ε)

taille du tube de tolérance

- grand ε → modèle plus tolérant (moins précis)
- petit ε → modèle plus strict

## C (regularisation)

- petit C → modèle souple (ignore certaines erreurs)
- grand C → modèle stricte (essaie de tout suivre)

## kernel

```python
SVR(kernel="linear")  # relation linéaire
SVR(kernel="rbf")     # relation non linéaire (très utilisé)
```

kernel RBF permet de gérer des relations complexes (non linéaires)

# Exemple visuel concret (intuition)

### Cas 1 : données simples

Prix maison ≈ surface

SVR trouve une droite légèrement “tolérante”

### Cas 2 : données complexes

Prix dépend de :

- surface
- quartier
- état du bien

SVR (avec kernel RBF) crée une courbe flexible

# Différence avec une régression classique

| Modèle              | Comment il apprend                |
| ------------------- | --------------------------------- |
| Régression linéaire | minimise toutes les erreurs       |
| SVR                 | ignore les erreurs dans le tube ε |

# Résumé simple

SVR :

- prédit des valeurs continues
- ignore les petites erreurs (zone ε)
- s’appuie sur des support vectors
- peut modéliser des relations non linéaires