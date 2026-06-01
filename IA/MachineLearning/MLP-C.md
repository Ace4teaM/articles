# Réseaux de neurones (MLP)

Le MLP pour la classification dans scikit-learn correspond à un réseau de neurones qui apprend à associer des entrées à des classes (binaire ou multi-classes). Dans scikit-learn, cela se fait avec `MLPClassifier`.

Principe général
 Le modèle transforme les données d’entrée à travers plusieurs couches de neurones :

- les premières couches détectent des combinaisons simples de variables
- les couches intermédiaires apprennent des motifs plus complexes
- la couche de sortie produit une probabilité par classe

Pour la classification, la sortie passe généralement par une fonction softmax (multi-classes) ou sigmoid (binaire), afin de produire des probabilités.

# Quand utiliser MLP en classification

Cas adaptés :

- relations non linéaires complexes
- données tabulaires de taille moyenne ou grande
- modèles classiques insuffisants

Cas où il est moins adapté :

- petit dataset (risque d’overfitting)
- besoin d’interprétabilité forte
- problèmes tabulaires simples (où gradient boosting est souvent meilleur)
- données images/texte complexes (on passe à CNN/Transformers)

Comparaison rapide

- régression logistique : simple et interprétable
- random forest : robuste et stable
- gradient boosting : souvent très performant sur tabulaire
- MLP : utile pour capturer des interactions complexes mais plus sensible

En pratique, le **MLPClassifier est rarement le premier choix**, mais il devient **intéressant comme modèle non linéaire générique** quand les méthodes classiques atteignent leurs limites.

# Exemple en classification

Voici un exemple simple avec scikit-learn pour une classification :

```python
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import accuracy_score

# Données
X, y = load_breast_cancer(return_X_y=True)

# Split train/test
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Normalisation (très important pour les réseaux de neurones)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Modèle réseau de neurones
model = MLPClassifier(
    hidden_layer_sizes=(50, 30),  # 2 couches cachées
    activation='relu',
    max_iter=500,
    random_state=42
)

# Entraînement
model.fit(X_train, y_train)

# Prédiction
y_pred = model.predict(X_test)

# Évaluation
print("Accuracy :", accuracy_score(y_test, y_pred))
```

Ce que fait le modèle :

- la première couche apprend des combinaisons simples des variables
- les couches intermédiaires apprennent des motifs plus complexes
- la dernière couche produit la probabilité de chaque classe

# Comment le modèle fonctionne en classification

**Propagation avant**
 Les données passent dans le réseau et produisent une probabilité pour chaque classe.

**Calcul de l’erreur**
 Le modèle compare la prédiction à la vraie classe avec une fonction de perte (souvent cross-entropy).

**Apprentissage**
 Les poids sont ajustés via rétropropagation du gradient pour réduire l’erreur.

**Décision finale**

- binaire : seuil à 0.5
- multi-classes : classe avec probabilité la plus élevée

# Paramètres importants

**hidden_layer_sizes**
 Contrôle la structure du réseau :

- (50,) : simple
- (100, 50) : intermédiaire
- (100, 100, 50) : plus complexe

**activation**

- relu : standard, efficace
- tanh : parfois utile pour données centrées
- logistic : rarement utilisé

**alpha**
 Régularisation L2 pour limiter le surapprentissage.

**solver**

- adam : recommandé par défaut
- lbfgs : parfois efficace sur petits datasets
- sgd : plus lent mais contrôlable

