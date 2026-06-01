# Bento ML

BentoML est un framework open source qui sert à **packager, déployer et exposer des modèles de Machine Learning** sous forme de services API prêts pour la production.

En pratique, il fait le lien entre :

- le **data scientist** qui entraîne un modèle,
- et l’**application** qui doit utiliser ce modèle en temps réel.

# À quoi sert BentoML ?

Quand un modèle est entraîné (avec Scikit-learn, XGBoost, PyTorch, TensorFlow, etc.), il faut ensuite :

1. le sauvegarder,
2. charger les dépendances,
3. créer une API,
4. gérer les versions,
5. déployer le tout sur un serveur ou dans Docker/Kubernetes.

BentoML automatise et standardise tout ça.

# Ce que BentoML apporte

## 1. Servir un modèle via une API

Exemple :

- une application envoie une image,
- BentoML appelle le modèle,
- il renvoie une prédiction JSON.

Typiquement via :

- REST API,
- gRPC,
- endpoints HTTP.

## 2. Compatibilité avec beaucoup de frameworks ML

Il fonctionne avec :

- scikit-learn
- XGBoost
- PyTorch
- TensorFlow
- LightGBM
- etc.

# Architecture simplifiée

## Étape 1 — entraînement

Tu entraînes ton modèle normalement :

```python
model.fit(X_train, y_train)
```

------

## Étape 2 — sauvegarde BentoML

```python
import bentoml

bentoml.sklearn.save_model("mon_modele", model)
```

Le modèle devient un artefact versionné.

------

## Étape 3 — création du service

```python
import bentoml
from bentoml.io import JSON

model_ref = bentoml.sklearn.get("mon_modele:latest")
model = model_ref.to_runner()

svc = bentoml.Service("prediction_service", runners=[model])

@svc.api(input=JSON(), output=JSON())
def predict(data):
    return model.run(data)
```

## Étape 4 — lancement API

```python
bentoml serve service:svc
```

Et tu obtiens une API HTTP utilisable immédiatement.

# Concepts importants

## Runner

Le `Runner` exécute le modèle de manière optimisée :

- parallélisation,
- batch,
- gestion GPU,
- performances.

## Bento

Un “Bento” est un package contenant :

- le modèle,
- le code,
- les dépendances,
- la configuration.

Un peu comme :

- un conteneur ML portable.

## Serving

“Servir un modèle” signifie :

> rendre le modèle accessible à une application.

Exemple :

- site web,
- chatbot,
- outil métier,
- application mobile.

# Pourquoi BentoML est apprécié

## Standardise la mise en production

Sans BentoML :

- beaucoup de scripts artisanaux,
- dépendances fragiles,
- APIs faites à la main.

Avec BentoML :

- structure propre,
- reproductible,
- portable.

## Compatible Docker/Kubernetes

Très utile pour :

- cloud,
- microservices,
- scalabilité.

## Pensé pour la production

Fonctionnalités :

- monitoring,
- versioning,
- batching,
- async,
- GPU,
- scaling.

# Différence avec FastAPI

FastAPI :

- framework web généraliste.

BentoML :

- spécialisé ML.

Souvent :

- BentoML utilise FastAPI en interne.

# Différence avec MLflow

MLflow gère surtout :

- expériences,
- tracking,
- registry.

BentoML gère surtout :

- serving,
- APIs,
- déploiement.

Ils sont souvent complémentaires.

# Cas d’usage typiques

## IA temps réel

- prédiction fraude,
- recommandation,
- scoring.

## Vision

- détection image,
- OCR,
- classification.

## NLP / LLM

- chatbot,
- résumé,
- embeddings.

## MLOps

- pipeline industrialisé.

# En résumé

BentoML est :

- un outil de **mise en production de modèles ML**,
- orienté API et déploiement,
- compatible avec la majorité des frameworks IA,
- très utilisé dans les architectures MLOps modernes.

On peut le voir comme :

> “le Docker/API framework des modèles de Machine Learning”.