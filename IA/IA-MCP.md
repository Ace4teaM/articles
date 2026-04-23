# Model Context Protocol

**MCP est un standard pour brancher une IA sur des sources de données et des outils externes de manière structurée.**

## Pourquoi MCP existe ?

Les modèles d’IA ne savent pas naturellement :

- Accéder à une base de données
- Lire un fichier local
- Interroger une API métier
- Exécuter une action dans un logiciel

MCP fournit :

- Un **format standardisé**
- Une **structure de communication claire**
- Une façon propre d’exposer des outils à une IA

------

## Comment ça fonctionne ?

Il y a généralement 3 éléments :

1. **Le modèle (LLM)** → pose des requêtes
2. **Un serveur MCP** → expose des outils et ressources
3. **Des connecteurs** → relient bases de données, fichiers, APIs, etc.

Le modèle peut :

- Découvrir les outils disponibles
- Lire des ressources
- Appeler des fonctions exposées

------

## Exemple concret

Imaginons un outil exposé via MCP :

- `getUserById`
- `createInvoice`
- `searchDocuments`

L’IA peut :

- Comprendre que ces outils existent
- Appeler `getUserById(42)`
- Utiliser le résultat dans sa réponse

------

## Pourquoi c’est important ?

MCP permet :

- De créer des **agents IA connectés au monde réel**
- D’avoir une architecture propre et modulaire
- De séparer l’IA du backend métier
- De sécuriser l’accès aux données

------

## En une phrase

> **MCP est un protocole standard qui permet à une IA d’interagir proprement avec des outils et des données externes.**

# Développement MCP

MCP doit pouvoir mettre en relation 2 applications: votre LLM (chatgpt, mistral, claude, ...) et votre application favorite (gmail, github, ....)

https://modelcontextprotocol.io/docs/getting-started/intro

**Plusieurs critères sont à prendre en compte:**

* Vous devez gérer les autorisations cela implique une interface de configuration coté application favorite (c'est essentiel pour ne pas exposer vos données et laisser l'IA casser vos données)
* Vous devez avoir un serveur en ligne pour ne pas imposer une configuration coté client (ouverture de port, redirection) le serveur peut être l'application ou un intermédiaire de redirection ou bien encore une version desktop de l'IA. (local-user-app->remote-server<-remote-ia-app) ou (remote-user-app<->remote-ia-app) ou (local-ia-app<->local-user-app)



**Les serveurs MCP peuvent fournir trois types principaux de capacités:**

1. **[Ressources:](https://modelcontextprotocol.io/docs/learn/server-concepts#resources)** Données de type fichier qui peuvent être lues par les clients (comme les réponses API ou le contenu du fichier)
2. **[Outils](https://modelcontextprotocol.io/docs/learn/server-concepts#tools)** : Fonctions pouvant être appelées par le LLM (avec approbation de l'utilisateur)
3. **[Prompts](https://modelcontextprotocol.io/docs/learn/server-concepts#prompts)**Invites: Modèles pré-écrits qui aident les utilisateurs à accomplir des tâches spécifiques



## Développement du serveur

Si votre application doit exposer des données utiles ou si elle peut exécuter des commandes supervisé par une IA vous pouvez implémenter le serveur.

https://modelcontextprotocol.io/docs/develop/build-server

## Développement du client

Si vous implémentez vos propre service IA ou si votre application a besoin d'utiliser des services externe (analogiquement à ce qu'il faisait avec une API) vous pouvez développer un client.

https://modelcontextprotocol.io/docs/develop/build-client



## Intégration client

Beaucoup de client sont déjà compatible avec MCP, vous en trouverez la liste ici:

https://modelcontextprotocol.io/clients