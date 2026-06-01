# Drift

Le Drift ou la dérive de notre modèle nous permet de savoir si le modèle devient obsolète.

## Data Drift

Un changement dans la **distribution des features ou les corrélations** entre celles-ci. 

Deux types de méthodes :

- Des méthodes **“unidimensionnelles”** : C'est-à-dire qui sont capables de détecter la dérive d’une feature en particulier.
- Des méthodes **“multidimensionnelles”** : C’est-à-dire qui sont capables de détecter des drifts qui ne seraient pas visibles en ne regardant qu’une seule feature, mais plusieurs à la  fois.

## Target Drift

Un changement dans la **distribution de la target**, ou des liens entre la feature et la target.

## Concept Drift

Une évolution majeure de la réalité de la donnée qui va venir rendre **obsolètes** les features ou ce qu’a appris le modèle avec.