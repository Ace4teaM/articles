# SVM pour la classification

La **prédiction par SVM (Support Vector Machine)** avec scikit-learn consiste à entraîner un modèle qui sépare (ou approxime) des données en trouvant une frontière optimale.

# C’est quoi un SVM ?

Un SVM cherche une **frontière de décision** (hyperplan) qui sépare les classes en maximisant la marge entre elles.

- En classification : on sépare des classes (ex: spam / non spam), on parle de **SVC (Support Vector Classifier)**
- En régression : on approxime une fonction (SVR), on parle de **SVC (Support Vector Regression)**

L’idée clé : **choisir la séparation la plus robuste possible**, pas juste une séparation correcte.

## Exemple avec sklearn

```python
from sklearn.svm import SVC
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import load_iris

# données
X, y = load_iris(return_X_y=True)

# split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# normalisation (TRÈS important pour SVM)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# modèle SVM
model = SVC(kernel='rbf', C=1.0, gamma='scale')

# entraînement
model.fit(X_train, y_train)

# prédiction
y_pred = model.predict(X_test)
```

# Comment fonctionne la prédiction ?

Une fois entraîné :

```python
y_pred = model.predict(X_test)
```

Le modèle fait ceci en interne :

1. Il calcule la position des points par rapport à la frontière
2. Il utilise uniquement certains points importants appelés : **support vectors**
3. Il applique une fonction de décision :

- Si côté positif → classe A
- Si côté négatif → classe B

# Fonction de décision

On peut voir la “confiance” du modèle :

```python
model.decision_function(X_test)
```

- Valeur > 0 → classe 1
- Valeur < 0 → classe 0
- Plus c’est loin de 0 → plus le modèle est sûr

# Le rôle des kernels (très important)

Si les données ne sont pas linéaires :

```python
SVC(kernel="linear")   # séparation droite
SVC(kernel="rbf")      # séparation non linéaire (très utilisé)
SVC(kernel="poly")     # polynôme
```

Le kernel transforme implicitement les données dans un espace où elles deviennent séparables.

# Les paramètres clés

### C (regularisation)

- Petit C → marge large, plus de tolérance aux erreurs
- Grand C → modèle strict, risque d’overfitting

### gamma (kernel RBF)

- petit gamma → frontière lisse
- grand gamma → frontière complexe

# Résumé simple

Un SVM :

- trouve une frontière optimale
- s’appuie sur des points clés (support vectors)
- utilise des kernels pour gérer la non-linéarité
- prédit via une fonction de décision

### Objectif :

Séparer des classes (ex : spam / non spam, malade / sain)

### Principe :

- Trouver une frontière (hyperplan)
- Maximiser la marge entre les classes
- S’appuyer sur des points clés : les *support vectors*

### Exemple sklearn :

```python
from sklearn.svm import SVC

model = SVC(kernel="rbf")
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
```

Sortie = une **classe (0, 1, 2, …)**
