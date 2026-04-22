# Docker

Docker est une **plateforme de conteneurs** qui permet d’exécuter des applications avec toutes leurs dépendances de manière isolée et identique sur n’importe quel système. Plus léger qu’une machine virtuelle, un conteneur partage le noyau du système hôte, assurant rapidité et faible consommation de ressources. Docker facilite la gestion des dépendances, la reproductibilité des environnements et le déploiement grâce aux **Dockerfile** et **docker-compose**.

## Installation

https://www.docker.com/products/docker-desktop

## Docker Compose

**Docker Compose** est un outil qui permet de **définir et de gérer plusieurs conteneurs Docker comme un seul ensemble**.

Au lieu de lancer chaque conteneur avec une longue commande `docker run`, tu écris un fichier **`docker-compose.yml`** qui décrit :

- les services (conteneurs) à lancer
- les images à utiliser ou à construire
- les ports exposés
- les volumes et réseaux
- les dépendances entre services

Puis tu démarres tout avec une seule commande :

```
docker-compose up
```

💡 Exemple concret : tu peux lancer **une API Node.js**, **une base de données MongoDB**, et **un serveur Redis** ensemble, avec tous leurs paramètres, juste avec `docker-compose up`.

En résumé, Docker Compose facilite **l’orchestration multi-conteneurs** pour le développement et les tests.

## Exemple de projet avec docker

> index.js

```javascript
const express = require('express');

const app = express();
const PORT = 3000;

// Middleware de base
app.use(express.json());

// Route test
app.get('/', (req, res) => {
  res.send('Hello Express 👋');
});

// Démarrage du serveur
app.listen(PORT, () => {
  console.log(`Serveur lancé sur http://localhost:${PORT}`);
});
```

> package.json

```json
{
  "name": "web-api",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "dev": "nodemon index.js",
    "start": "node index.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  },
  "devDependencies": {
    "nodemon": "^2.0.4",
    "prettier": "^3.5.3"
  }
}
```

> dockerfile

```dockerfile
# Image Node.js officielle
FROM node:20-alpine

# Dossier de travail dans le container
WORKDIR /usr/src/app

# Copier package.json et package-lock.json
COPY ./package*.json ./

# Installer les dépendances
RUN npm install

# Copier les sources du projet
COPY . .

# Exposer le port
EXPOSE 3000

# Commande executé au démarrage du container (si non spécifié dans docker run)
CMD ["sh", "-c", "npm run start"]
```

> .dockerignore

Ignore la copie de certains fichiers dans `dockerfile` avec dans la commande `COPY`.

```
.git
docker-compose.yml
node_modules
```

> Initialisation du projet de base

```shell
mkdir <mon-projet>
cd <mon-projet>
"<package.json>" > package.json
"<dockerfile>" > dockerfile
"<index.js>" > index.js
```

> Création de l'image Docker

```powershell
docker build --no-cache -t express-js .
```

> Démarrage du container Docker (avec sources partagées dans Windows)

Le dossier `${PWD}` sera monté dans le dossier `/usr/src/app/src` du container (écrasé dans le container).

`sh` permet de remplacer la commande de démarrage et d'accéder à la console distante et ainsi pouvoir exécuter des commandes dans l'environnement natif (les commandes `CMD` par défaut dans `dockerfile`)

Le dossier `/usr/src/app/node_modules` sera exclue du montage Windows pour être dans un volume Docker (interne) [plus performant]

Le répertoire de travail sera : `/usr/src/app` (option `-w`)

```powershell
docker run -it -p 3000:3000 -v ${PWD}:/usr/src/app -v /usr/src/app/node_modules -w /usr/src/app --name web-api express-js sh
```

> Démarrage du serveur (dans l'invite de commande)

Enfin `"npm run dev"` remplace la commande par défaut et démarre en mode rechargement à chaud (dev)

```shell
npm run dev
```

## Commandes utiles

Enfin, si vous avez besoin de recréer le container il faudrat d'abord le supprimer

```powershell
docker stop web-api
docker rm web-api
```

Affiche le contenu de l'image (pas le container)

```powershell
docker run --rm express-js ls /usr/src/app
```

Affiche le contenu du container (pas l'image)

```powershell
docker exec -it web-api ls /usr/src/app
```

### 