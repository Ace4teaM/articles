# Réseaux de neurones (MLP)

Le MLP en régression dans scikit-learn correspond à un réseau de neurones capable de prédire une valeur continue (prix, température, consommation, etc.). Dans ce cas, on utilise `MLPRegressor`.

Le principe est simple : les variables d’entrée sont transformées à travers plusieurs couches de neurones, qui apprennent des combinaisons non linéaires, jusqu’à produire une valeur numérique en sortie.

Contrairement à une régression linéaire, la relation entre les variables d’entrée et la sortie n’est pas supposée linéaire. Le modèle apprend cette relation automatiquement.

Fonctionnement général

- couche d’entrée : variables du dataset
- couches cachées : transformation non linéaire (ReLU, tanh…)
- couche de sortie : une seule valeur continue

# Quand utiliser MLP ?

Il est utile quand on veut modéliser des relations non linéaires, mais qu’un modèle classique (régression linéaire, SVM simple, arbres) ne suffit pas.

Voici les cas concrets où il est pertinent.

Tu peux utiliser un MLP quand les données sont tabulaires et non linéaires
 C’est le cas le plus fréquent avec scikit-learn.
 Exemples :

- détection de fraude
- scoring client
- prédiction de churn
- estimation de prix à partir de variables multiples

Le **MLP est intéressant si les relations entre variables sont complexes et non linéaires**, par exemple quand plusieurs facteurs interagissent entre eux.

Tu peux aussi l’utiliser quand les modèles classiques saturent
 Si tu observes :

- une régression logistique trop simple
- un arbre de décision qui overfit ou sous-performe
- un random forest correct mais plafonné

alors un MLP peut parfois améliorer les performances en capturant des interactions plus fines.

Tu dois l’utiliser avec des données bien préparées
 Un MLP est sensible à :

- l’échelle des variables (normalisation obligatoire)
- les valeurs aberrantes
- les features bruitées

Sans preprocessing propre, il performe souvent moins bien qu’un arbre.

Tu dois l’envisager quand tu as suffisamment de données
 Le MLP a besoin de données pour apprendre correctement.

- petit dataset : risque d’overfit ou instabilité
- dataset moyen à grand : bon candidat

Tu dois éviter le MLP dans certains cas

- données tabulaires simples et interprétables → régression logistique, arbres
- besoin d’explicabilité forte → modèles linéaires ou arbres
- très peu de données → modèles plus simples
- images / texte complexes → scikit-learn MLP n’est pas adapté (on passe à CNN / Transformers)

Comparaison rapide

- régression logistique : simple, rapide, interprétable
- random forest : robuste, bon baseline
- gradient boosting : souvent meilleur sur tabulaire
- MLP : utile quand la relation est complexe et que les modèles classiques plafonnent

En pratique
 Sur données tabulaires, le MLP est rarement le premier choix. Il devient intéressant comme modèle “de montée en complexité” après avoir testé des modèles plus classiques.

# Exemple en régression

Exemple avec scikit-learn sur un cas de régression

```python
from sklearn.datasets import fetch_california_housing
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPRegressor

# Données
X, y = fetch_california_housing(return_X_y=True)

# Séparation train/test
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Normalisation indispensable
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

# Modèle MLP pour régression
model = MLPRegressor(
    hidden_layer_sizes=(100, 50),
    activation='relu',
    max_iter=500,
    random_state=42
)

# Apprentissage
model.fit(X_train, y_train)

# Prédiction
y_pred = model.predict(X_test)

# Score R²
print(model.score(X_test, y_test))
```

# Points importants pour la régression avec MLP

**Normalisation obligatoire**
 Les réseaux de neurones sont très sensibles aux échelles des variables. Sans StandardScaler, les performances se dégradent fortement.

**Choix de l’architecture**
 hidden_layer_sizes contrôle la complexité :

- (50,) : modèle simple
- (100, 50) : modèle intermédiaire
- (100, 100, 50) : modèle plus profond

Plus le modèle est complexe, plus le risque de surapprentissage augmente.

**Activation**

- relu : choix standard
- tanh : parfois utile pour des données centrées
- logistic : rarement utilisé en régression

**Optimisation**
 Le MLP utilise une descente de gradient avec **backpropagation**. Il peut être sensible à :

- learning rate
- nombre d’itérations
- initialisation des poids

**Quand ce modèle est adapté en régression**

- relations non linéaires entre variables
- dataset tabulaire de taille moyenne à grande
- cas où des modèles classiques plafonnent

**Limites**

- moins performant que des modèles comme Gradient Boosting sur beaucoup de problèmes tabulaires
- peu interprétable
- nécessite un réglage fin des hyperparamètres
- sensible aux données mal normalisées

En pratique, le **MLP en régression est souvent un modèle de comparaison plutôt qu’un premier choix**. Sur données tabulaires structurées, des modèles comme **Random Forest** ou **XGBoost** restent généralement plus robustes.