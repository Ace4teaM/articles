# Rule-Based / modèle Dummy

Un modèle **Rule-Based** ou un modèle **Dummy** sont des approches très simples utilisées :

- soit pour créer un système basé sur des règles humaines,
- soit pour servir de référence minimale avant d’utiliser un vrai modèle de Machine Learning.

Les deux sont différents, mais souvent comparés aux modèles ML “intelligents”.

# 1. Modèle Rule-Based

Un système **Rule-Based** fonctionne avec :

> des règles écrites manuellement.

Aucun apprentissage automatique.

# Exemple simple

```
if temperature > 30:
    return "chaud"
else:
    return "froid"
```

Le système :

- ne “comprend” rien,
- ne s’entraîne pas,
- applique juste des conditions.

# Caractéristiques

## Avantages

- simple,
- prévisible,
- explicable,
- facile à déboguer.

## Inconvénients

- difficile à maintenir quand ça grossit,
- peu flexible,
- incapable d’apprendre,
- explose en complexité.

# Exemples réels

## Détection spam ancienne génération

```
SI mail contient "argent gratuit"
ALORS spam
```

## Jeux vidéo

PNJ avec règles :

```
SI joueur proche → attaquer
SINON → patrouiller
```

## Métier

```
SI revenu < 1000€ ET dette > 5000€
ALORS refuser le crédit
```

# Quand utiliser du Rule-Based ?

Quand :

- le problème est simple,
- les règles sont connues,
- peu de cas possibles,
- besoin d’explicabilité totale.

# Limite principale

Les règles humaines deviennent vite impossibles à gérer.

Exemple :

- reconnaissance d’image,
- langage naturel,
- fraude complexe.

Tu ne peux pas écrire :

- des millions de règles manuellement.

C’est là que le Machine Learning devient utile.

# 2. Modèle Dummy

Un modèle **Dummy** est :

> un faux modèle très simple utilisé comme baseline.

Il sert à vérifier :

> “Mon vrai modèle est-il réellement meilleur qu’une stratégie stupide ?”

# Exemple classique

Classification :

```
90% des emails = non spam
10% = spam
```

Un Dummy peut prédire :

```
toujours "non spam"
```

Accuracy :

```
90%
```

# Pourquoi c’est important ?

Si ton modèle ML obtient :

```
91%
```

alors :

- il est à peine meilleur qu’un modèle idiot.

Le Dummy évite :

- de croire qu’un modèle est bon alors qu’il ne fait presque rien.

# Types de Dummy Models

Avec scikit-learn :

## Classification

### Toujours la classe majoritaire

```
DummyClassifier(strategy="most_frequent")
```

### Aléatoire

```
DummyClassifier(strategy="uniform")
```

### Respecte les probabilités réelles

```
DummyClassifier(strategy="stratified")
```

# Régression

## Moyenne constante

```
DummyRegressor(strategy="mean")
```

Le modèle prédit toujours :

- la moyenne des valeurs.

# Pourquoi les Dummy Models sont importants

Ils servent de :

- baseline,
- point de comparaison minimal.

# Exemple concret

Tu prédis le prix d’une maison.

Dummy :

```
toujours 250 000€
```

Erreur moyenne :

```
50 000€
```

Ton vrai modèle :

```
48 000€
```

→ ton modèle ML est mauvais.

# Différence importante

## Rule-Based

- utilise des règles métier humaines,
- peut être intelligent,
- logique explicite.

## Dummy

- volontairement naïf,
- utilisé uniquement comme référence statistique.

# Comparaison rapide

| Aspect              | Rule-Based           | Dummy       |
| ------------------- | -------------------- | ----------- |
| Apprentissage       | Non                  | Non         |
| Intelligence métier | Oui                  | Non         |
| Utilité             | Résoudre un problème | Baseline    |
| Complexité          | Variable             | Très faible |
| Production réelle   | Oui                  | Rarement    |

# Relation avec le ML

Souvent un projet ML commence par :

1. Dummy baseline
2. Règles simples
3. Premier modèle ML
4. Optimisation avancée

# En résumé

## Rule-Based

Un système basé sur :

- des règles humaines explicites.

Exemple :

```
SI température > 30 → chaud
```

## Dummy Model

Un faux modèle très simple servant de :

- référence minimale,
- baseline.

Exemple :

```
toujours prédire la classe majoritaire
```

Un bon modèle ML doit toujours :

> battre clairement un Dummy Model.