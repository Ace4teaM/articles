# NPM (Node Package Manager)

Installer, gérer et désinstaller des paquets JavaScript (ou TypeScript) pour ton projet Node.JS.

**Initialiser un projet**

```shell
npm init
```

**Installer une dépendance**

```shell
npm install chart.js
```

**Vérification des erreurs avec ESInt**

```shell
npm install eslint
```

configuration

```shell
npm init @eslint/config
```

package.json :

```json
"scripts": {
   "dev": "http-server",
   "lint": "eslint *.js"
  }
```

execution du script

```shell
npm run lint
```

# NPX (Node Package Execute)

Exécuter des paquets Node.js **sans les installer** (ou exécuter des paquets installés localement sans taper le chemin complet) avec Node.JS.

**En résumé**

- **`npm`** : Installe des paquets.
- **`npx`** : Exécute des paquets (installés ou non).

C'est un outil très pratique pour les développeurs qui veulent garder leur environnement propre et éviter les installations globales inutiles.

**Initialiser un projet**

```shell
npx create-react-app mon-projet
```

Télécharge et exécute `create-react-app` pour créer un nouveau projet React, **sans installation globale**.

**Installer une dépendance**

Exécuter un outil comme `prettier` pour formater ton code, mais sans l'installer globalement :

```shell
npx prettier --write src/
```

`npx` va télécharger `prettier`, l'exécuter, puis le supprimer après utilisation.

**Exécuter une commande locale sans préciser le chemin** :

Si tu as installé `eslint` localement dans ton projet, tu peux l'exécuter directement avec :

```shell
npx eslint src/
```

Pas besoin de taper `./node_modules/.bin/eslint src/`.

**Tester une nouvelle version d'un outil** :

```
npx webpack --version
```

Affiche la dernière version de `webpack` disponible sur npm, même si tu ne l'as pas installée.

**Exécuter un script unique** :

```
npx cowsay "Bonjour Thomas !"
```

Affiche une vache ASCII qui dit "Bonjour Thomas !" (sans installer `cowsay`).

# **Différence clé entre `npm` et `npx`**

| Critère          | npm                                 | npx                               |
| ---------------- | ----------------------------------- | --------------------------------- |
| **Rôle**         | Installe/gère des paquets.          | Exécute des paquets.              |
| **Installation** | Nécessaire pour utiliser un paquet. | Pas besoin d'installer le paquet. |
| **Portée**       | Globale ou locale.                  | Exécution ponctuelle ou locale.   |
| **Cas d'usage**  | Gestion des dépendances.            | Exécution de commandes ou outils. |

------

# **Quand utiliser `npm` ou `npx` ?**

- **Utilise `npm`** quand tu veux :
  - Ajouter une dépendance à ton projet (`npm install`).
  - Mettre à jour ou supprimer un paquet.
  - Lancer des scripts définis dans `package.json`.
- **Utilise `npx`** quand tu veux :
  - Exécuter un outil **une seule fois** (ex : `create-react-app`, `cowsay`).
  - Tester une nouvelle version d'un paquet sans l'installer.
  - Éviter les conflits de versions (ex : utiliser la dernière version de `webpack`).
  - Exécuter une commande locale sans taper le chemin complet.

------

# **Exemple combiné**

Imagine que tu veux créer un projet React et utiliser ESLint pour vérifier ton code :

1. **Créer le projet** (avec `npx`) :

   ```
   bash
   Copier
   npx create-react-app mon-projet
   ```

2. **Aller dans le dossier** :

   ```
   bash
   Copier
   cd mon-projet
   ```

3. **Installer ESLint localement** (avec `npm`) :

   ```
   bash
   Copier
   npm install eslint --save-dev
   ```

4. **Exécuter ESLint** (avec `npx`) :

   ```
   bash
   Copier
   npx eslint src/
   ```

# **En résumé**

- **`npm`** = Gestion des paquets (installation, mise à jour, suppression).
- **`npx`** = Exécution de paquets (sans installation ou depuis `node_modules`).
